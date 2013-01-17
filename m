From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Jan 2013 14:43:31 +0100
Subject: [Buildroot] [git commit] vim: bump to version 7.3-762
Message-ID: <20130117134636.A7BB69A281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e59117fe938990f82944f5ec0464330389b0ff0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vim/Config.in |    1 +
 package/vim/vim.mk    |    6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/vim/Config.in b/package/vim/Config.in
index 0da158f..891715e 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VIM
 	bool "vim"
+	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  VIM Text editor
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 7fed822..fa5f8ae 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-# hg 21219ffc9790 = 7.3 release + patchlevel 487
 VIM_SITE = https://vim.googlecode.com/hg
 VIM_SITE_METHOD = hg
-VIM_VERSION = 21219ffc9790
+# 7.3 release patchlevel 762
+VIM_VERSION = 699f8d8f096d
 VIM_DEPENDENCIES = ncurses
 VIM_SUBDIR = src
 VIM_CONF_ENV = vim_cv_toupper_broken=no \
@@ -21,6 +21,8 @@ VIM_CONF_ENV = vim_cv_toupper_broken=no \
 		ac_cv_small_wchar_t=no
 # GUI/X11 headers leak from the host so forcibly disable them
 VIM_CONF_OPT = --with-tlib=ncurses --enable-gui=no --without-x
+VIM_LICENSE = Charityware
+VIM_LICENSE_FILES = README.txt
 
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
