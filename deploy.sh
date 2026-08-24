#!/usr/bin/env bash
# 部署脚本：把下载主页提交并推送到 GitHub 仓库 zq0929/DSH
# 用法：在本机终端执行  bash /Users/qian/WorkBuddy/2026-08-24-11-04-28/deploy.sh
# 前置：本机已登录 GitHub（gh auth login，或已配置 SSH / credential helper）
set -e

SRC="/Users/qian/WorkBuddy/2026-08-24-11-04-28"
REPO="zq0929/DSH"
TMP="$(mktemp -d)"

echo "==> 克隆 $REPO 到 $TMP"
git clone "https://github.com/$REPO.git" "$TMP/repo"

echo "==> 复制下载主页文件"
cp "$SRC/index.html" "$SRC/og-cover.png" "$SRC/robots.txt" "$SRC/sitemap.xml" "$TMP/repo/"

cd "$TMP/repo"
git add index.html og-cover.png robots.txt sitemap.xml
git commit -m "Add DSH Desktop download homepage: SEO meta, mirror channels, custom domain dsh.966887.xyz"
git push

echo "==> 完成。已推送到 https://github.com/$REPO"
echo "    站点地址（启用 Pages 后）：https://dsh.966887.xyz/"
