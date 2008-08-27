From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 27 Aug 2008 04:01:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fbdump
Message-ID: <20080827110117.2A7173C847@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-27 04:01:16 -0700 (Wed, 27 Aug 2008)
New Revision: 23239

Log:
fbdump: Add new package fbdump.

fbdump is a simple tool to capture snapshots from the Linux kernel framebuffer 
device and write them out as a PPM file. Currently, most packed-pixel framebuffer
formats and the vga16 framebuffer are supported.



Added:
   trunk/buildroot/package/fbdump/
   trunk/buildroot/package/fbdump/Config.in
   trunk/buildroot/package/fbdump/fbdump.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-27 07:46:55 UTC (rev 23238)
+++ trunk/buildroot/package/Config.in	2008-08-27 11:01:16 UTC (rev 23239)
@@ -323,6 +323,7 @@
 
 comment "graphic libraries"
 source "package/directfb/Config.in"
+source "package/fbdump/Config.in"
 source "package/fusion/Config.in"
 source "package/imagemagick/Config.in"
 source "package/jpeg/Config.in"

Added: trunk/buildroot/package/fbdump/Config.in
===================================================================
--- trunk/buildroot/package/fbdump/Config.in	                        (rev 0)
+++ trunk/buildroot/package/fbdump/Config.in	2008-08-27 11:01:16 UTC (rev 23239)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FBDUMP
+	bool "fbdump (Framebuffer Capture Tool)"
+	help
+	   fbdump is a simple tool to capture snapshots from the Linux kernel framebuffer
+	   device and write them out as a PPM file. Currently, most packed-pixel framebuffer
+       formats and the vga16 framebuffer are supported.
+

Added: trunk/buildroot/package/fbdump/fbdump.mk
===================================================================
--- trunk/buildroot/package/fbdump/fbdump.mk	                        (rev 0)
+++ trunk/buildroot/package/fbdump/fbdump.mk	2008-08-27 11:01:16 UTC (rev 23239)
@@ -0,0 +1,16 @@
+#############################################################
+#
+# fbdump
+#
+#############################################################
+FBDUMP_VERSION:=0.4.2
+FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
+FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
+FBDUMP_AUTORECONF = NO
+FBDUMP_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
+FBDUMP_INSTALL_STAGING = YES
+FBDUMP_INSTALL_TARGET = YES
+FBDUMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
+
+$(eval $(call AUTOTARGETS,package,fbdump))
+
