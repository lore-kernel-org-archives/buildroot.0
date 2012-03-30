From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Mar 2012 14:48:15 +0200
Subject: [Buildroot] [git commit] vim: bump to version 7.3.487
Message-ID: <20120330125239.E24F2969B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f179d3315c781f2f3cbfc26092b67dc75417efd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
