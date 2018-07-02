From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 23:10:06 +0200
Subject: [Buildroot] [git commit] package/vim: bump version to v8.1.0133
Message-ID: <20180702211122.1D19584019@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e615852790a2235dfad3b11ad82aafe0eb0f3ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few new features have been add and a lot of bugs have been fixed in
minor release Vim 8.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 28c6b97e31..bfbd55d1a5 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6fbe0ec1228f951ba598b48ac8033f41ca4934cc34689a6008685e7c26477ae2  vim-v8.0.0329.tar.gz
+sha256 a6dab137949097fbe0b67aafedf4c24a3b0d9c41716db35f5beb4834924d7b00  vim-v8.1.0133.tar.gz
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 5ee889882a..0c02ead7b5 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = v8.0.0329
+VIM_VERSION = v8.1.0133
 VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
 # Win over busybox vi since vim is more feature-rich
 VIM_DEPENDENCIES = \
@@ -14,6 +14,7 @@ VIM_SUBDIR = src
 VIM_CONF_ENV = \
 	vim_cv_toupper_broken=no \
 	vim_cv_terminfo=yes \
+	vim_cv_tgetent=zero \
 	vim_cv_tty_group=world \
 	vim_cv_tty_mode=0620 \
 	vim_cv_getcwd_broken=no \
