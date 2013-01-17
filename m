From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jan 2013 09:25:43 -0300
Subject: [Buildroot] [PATCH 4/4] vim: bump to version 7.3-762
In-Reply-To: <1358425543-25435-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358425543-25435-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358425543-25435-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vim/Config.in | 1 +
 package/vim/vim.mk    | 6 ++++--
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
-- 
1.7.12.4
