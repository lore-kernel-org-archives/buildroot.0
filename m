From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xtrans to 1.2.5
Message-ID: <20100308133615.9B2D4776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e25478a3212a955f7dbb83493452d38486bfb3ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_xtrans/Config.in                |    2 +-
 .../xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch      |   11 +++++++++++
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    3 +--
 3 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch

diff --git a/package/x11r7/xlib_xtrans/Config.in b/package/x11r7/xlib_xtrans/Config.in
index 668ae63..4b69020 100644
--- a/package/x11r7/xlib_xtrans/Config.in
+++ b/package/x11r7/xlib_xtrans/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XLIB_XTRANS
 	bool "xtrans"
 	help
-	  xtrans 1.0.3
+	  xtrans 1.2.5
 	  X.Org xtrans library
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch b/package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch
new file mode 100644
index 0000000..e8270c9
--- /dev/null
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans-1.2.5-fix_pkgconfig_dir.patch
@@ -0,0 +1,11 @@
+--- xlib_xtrans-1.2.5/Makefile.in.orig	2010-01-23 16:24:25.287333323 +0200
++++ xlib_xtrans-1.2.5/Makefile.in	2010-01-23 16:25:06.336331430 +0200
+@@ -222,7 +222,7 @@ Xtransinclude_HEADERS = \
+ 
+ aclocaldir = $(datadir)/aclocal
+ aclocal_DATA = xtrans.m4
+-pkgconfigdir = $(datadir)/pkgconfig
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = xtrans.pc
+ EXTRA_DIST = xtrans.pc.in ${aclocal_DATA} ChangeLog Xtrans.mm
+ MAINTAINERCLEANFILES = ChangeLog
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 6959641..0968bdf 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.2.1
+XLIB_XTRANS_VERSION = 1.2.5
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_AUTORECONF = NO
 XLIB_XTRANS_INSTALL_STAGING = YES
-XLIB_XTRANS_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_xtrans))
-- 
1.6.3.3
