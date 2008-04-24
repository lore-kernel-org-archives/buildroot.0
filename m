From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 11:35:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libiconv vlc
Message-ID: <20080424183544.47A0A3C84F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 11:35:44 -0700 (Thu, 24 Apr 2008)
New Revision: 21850

Log:
add libiconv and framework for vlc

Added:
   trunk/buildroot/package/libiconv/
   trunk/buildroot/package/libiconv/Config.in
   trunk/buildroot/package/libiconv/libiconv.mk
   trunk/buildroot/package/vlc/
   trunk/buildroot/package/vlc/Config.in
   trunk/buildroot/package/vlc/vlc.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-24 18:13:02 UTC (rev 21849)
+++ trunk/buildroot/package/Config.in	2008-04-24 18:35:44 UTC (rev 21850)
@@ -83,6 +83,7 @@
 source "package/libfloat/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libiconv/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
 source "package/lockfile-progs/Config.in"
@@ -428,6 +429,7 @@
 
 comment "Video libraries/codecs and applications"
 source "package/mplayer/Config.in"
+source "package/vlc/Config.in"
 endif
 
 menuconfig BR2_COMPRESSOR_SUPPORT

Added: trunk/buildroot/package/libiconv/Config.in
===================================================================
--- trunk/buildroot/package/libiconv/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libiconv/Config.in	2008-04-24 18:35:44 UTC (rev 21850)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBICONV
+	bool "libiconv"
+	default n
+	help
+	  unicode conversion library
+
+	  http://ftp.gnu.org/pub/gnu/libiconv

Added: trunk/buildroot/package/libiconv/libiconv.mk
===================================================================
--- trunk/buildroot/package/libiconv/libiconv.mk	                        (rev 0)
+++ trunk/buildroot/package/libiconv/libiconv.mk	2008-04-24 18:35:44 UTC (rev 21850)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# libiconv
+#
+#############################################################
+LIBICONV_VERSION = 1.12
+LIBICONV_SOURCE = libiconv-$(LIBICONV_VERSION).tar.gz
+LIBICONV_SITE = http://ftp.gnu.org/pub/gnu/libiconv
+LIBICONV_AUTORECONF = NO
+LIBICONV_INSTALL_STAGING = YES
+LIBICONV_INSTALL_TARGET = YES
+
+LIBICONV_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+LIBICONV_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,libiconv))
+

Added: trunk/buildroot/package/vlc/Config.in
===================================================================
--- trunk/buildroot/package/vlc/Config.in	                        (rev 0)
+++ trunk/buildroot/package/vlc/Config.in	2008-04-24 18:35:44 UTC (rev 21850)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_VLC
+	bool "vlc"
+	default n
+	help
+	  a free cross-platform media player
+
+	  http://download.videolan.org/pub/videolan/vlc/0.8.6e

Added: trunk/buildroot/package/vlc/vlc.mk
===================================================================
--- trunk/buildroot/package/vlc/vlc.mk	                        (rev 0)
+++ trunk/buildroot/package/vlc/vlc.mk	2008-04-24 18:35:44 UTC (rev 21850)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# vlc
+#
+#############################################################
+VLC_VERSION = 0.8.6e
+VLC_SOURCE = vlc-$(VLC_VERSION).tar.bz2
+VLC_SITE = http://download.videolan.org/pub/videolan/vlc/0.8.6e
+VLC_AUTORECONF = NO
+VLC_INSTALL_STAGING = NO
+VLC_INSTALL_TARGET = YES
+
+VLC_CONF_OPT = 
+
+VLC_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,vlc))
+
