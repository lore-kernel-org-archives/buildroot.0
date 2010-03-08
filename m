From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libpciaccess to 0.10.9
Message-ID: <20100308133658.4BD47776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ff6e092bf58bbaa44bf7df57f8405184b1c4c849
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libpciaccess/Config.in          |    2 +-
 .../xlib_libpciaccess-0.10.3-fix_mtrr_check.patch  |   20 --------------------
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    4 ++--
 3 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 package/x11r7/xlib_libpciaccess/xlib_libpciaccess-0.10.3-fix_mtrr_check.patch

diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/x11r7/xlib_libpciaccess/Config.in
index 583c57b..2300822 100644
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ b/package/x11r7/xlib_libpciaccess/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	bool "libpciaccess"
 	depends on BR2_LARGEFILE
 	help
-	  libpciaccess 0.10.3
+	  libpciaccess 0.10.9
 	  X.Org libpciaccess
 
 comment "libpciaccess requires a toolchain with LARGEFILE support"
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess-0.10.3-fix_mtrr_check.patch b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess-0.10.3-fix_mtrr_check.patch
deleted file mode 100644
index 6608d0d..0000000
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess-0.10.3-fix_mtrr_check.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -uNr xlib_libpciaccess-0.10.3.orig/configure.ac xlib_libpciaccess-0.10.3/configure.ac
---- xlib_libpciaccess-0.10.3.orig/configure.ac	2009-02-09 18:35:50.000000000 -0800
-+++ xlib_libpciaccess-0.10.3/configure.ac	2009-02-09 18:38:56.000000000 -0800
-@@ -91,10 +91,12 @@
- AM_CONDITIONAL(OPENBSD, [test "x$openbsd" = xyes])
- AM_CONDITIONAL(SOLARIS, [test "x$solaris" = xyes])
- 
--AC_CHECK_FILE([/usr/include/asm/mtrr.h],
--              [have_mtrr_h="yes"], [have_mtrr_h="no"])
--if test "x$have_mtrr_h" = xyes; then
--    AC_DEFINE(HAVE_MTRR, 1, [Use MTRRs on mappings])
-+if test "$cross_compiling" != yes; then
-+AC_CHECK_FILE([/usr/include/asm/mtrr.h],
-+              [have_mtrr_h="yes"], [have_mtrr_h="no"])
-+if test "x$have_mtrr_h" = xyes; then
-+    AC_DEFINE(HAVE_MTRR, 1, [Use MTRRs on mappings])
-+fi
- fi
- 
- AC_SUBST(PCIACCESS_CFLAGS)
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 94c52f1..73a9642 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XLIB_LIBPCIACCESS_VERSION = 0.10.3
+XLIB_LIBPCIACCESS_VERSION = 0.10.9
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBPCIACCESS_AUTORECONF = YES
+XLIB_LIBPCIACCESS_AUTORECONF = NO
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
 XLIB_LIBPCIACCESS_DEPENDENCIES =
 XLIB_LIBPCIACCESS_CONF_OPT = --enable-shared --disable-static
-- 
1.6.3.3
