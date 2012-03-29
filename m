From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 23:24:59 -0300
Subject: [Buildroot] [PATCH 3/7] vim: bump to version 7.3.487
In-Reply-To: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332987903-12378-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vim/Config.in |    2 +-
 package/vim/vim.mk    |   12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/vim/Config.in b/package/vim/Config.in
index 30b73d3..0da158f 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_VIM_RUNTIME
 	depends on BR2_PACKAGE_VIM
 	help
 	  Install VIM runtime (syntax highlighing + macros).
-	  This option adds about 13MB of data to /usr/share/
+	  This option adds about 15MB of data to /usr/share/
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index f5988d1..ef8d925 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-# svn r1889 == 7.2 release + patchlevel 446
-VIM_SITE = https://vim.svn.sourceforge.net/svnroot/vim/branches/vim7.2
-VIM_SITE_METHOD = svn
-VIM_VERSION = 1889
+# hg 21219ffc9790 = 7.3 release + patchlevel 487
+VIM_SITE = https://vim.googlecode.com/hg
+VIM_SITE_METHOD = hg
+VIM_VERSION = 21219ffc9790
 VIM_DEPENDENCIES = ncurses
 VIM_SUBDIR = src
 VIM_CONF_ENV = vim_cv_toupper_broken=no \
@@ -19,8 +19,8 @@ VIM_CONF_ENV = vim_cv_toupper_broken=no \
 		vim_cv_memmove_handles_overlap=yes \
 		ac_cv_sizeof_int=4 \
 		ac_cv_small_wchar_t=no
-
-VIM_CONF_OPT = --with-tlib=ncurses
+# GUI/X11 headers leak from the host so forcibly disable them
+VIM_CONF_OPT = --with-tlib=ncurses --enable-gui=no --without-x
 
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
-- 
1.7.3.4
