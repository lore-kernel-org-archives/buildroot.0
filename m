From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  8 Dec 2008 09:46:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia:
	libtheora
Message-ID: <20081208174600.41EE13C804@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-08 09:45:59 -0800 (Mon, 08 Dec 2008)
New Revision: 24327

Log:
libtheora: add new multimedia package libtheora

libtheora is a library used by gstreamer when streaming Ogg multimedia.



Added:
   trunk/buildroot/package/multimedia/libtheora/
   trunk/buildroot/package/multimedia/libtheora/Config.in
   trunk/buildroot/package/multimedia/libtheora/libtheora.mk

Modified:
   trunk/buildroot/package/multimedia/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/Config.in	2008-12-08 16:29:41 UTC (rev 24326)
+++ trunk/buildroot/package/multimedia/Config.in	2008-12-08 17:45:59 UTC (rev 24327)
@@ -7,6 +7,7 @@
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"
 source "package/multimedia/libsndfile/Config.in"
+source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpg123/Config.in"

Added: trunk/buildroot/package/multimedia/libtheora/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/libtheora/Config.in	                        (rev 0)
+++ trunk/buildroot/package/multimedia/libtheora/Config.in	2008-12-08 17:45:59 UTC (rev 24327)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBTHEORA
+	bool "libtheora"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_PKGCONFIG
+	help
+	  A library for the free and open video compression format "Theora"
+	  from the Xiph.org Foundation.
+
+	  http://www.theora.org/

Added: trunk/buildroot/package/multimedia/libtheora/libtheora.mk
===================================================================
--- trunk/buildroot/package/multimedia/libtheora/libtheora.mk	                        (rev 0)
+++ trunk/buildroot/package/multimedia/libtheora/libtheora.mk	2008-12-08 17:45:59 UTC (rev 24327)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# libtheora
+#
+#############################################################
+LIBTHEORA_VERSION = 1.0
+LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
+LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
+LIBTHEORA_INSTALL_STAGING = YES
+
+LIBTHEORA_CONF_OPT = \
+		--disable-oggtest \
+		--disable-vorbistest \
+		--disable-sdltest \
+		--disable-examples
+
+LIBTHEORA_DEPENDENCIES = libogg libvorbis pkgconfig
+
+$(eval $(call AUTOTARGETS,package/multimedia,libtheora))
