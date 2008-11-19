From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 19 Nov 2008 02:50:10 +0100
Subject: [Buildroot] [PATCH 2/7] package/multimedia: add libtheora package
In-Reply-To: <200811190244.44817.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
Message-ID: <200811190250.11102.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtheora is a library for the free and open video compression format
"Theora" from the Xiph.org Foundation.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libtheora/Config.in    |   10 ++++++++++
 package/multimedia/libtheora/libtheora.mk |   21 +++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libtheora/Config.in
 create mode 100644 package/multimedia/libtheora/libtheora.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 4568a51..4c74f7e 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -7,6 +7,7 @@ source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"
 source "package/multimedia/libsndfile/Config.in"
+source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpg123/Config.in"
diff --git a/package/multimedia/libtheora/Config.in b/package/multimedia/libtheora/Config.in
new file mode 100644
index 0000000..97a7087
--- /dev/null
+++ b/package/multimedia/libtheora/Config.in
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
diff --git a/package/multimedia/libtheora/libtheora.mk b/package/multimedia/libtheora/libtheora.mk
new file mode 100644
index 0000000..12d6af8
--- /dev/null
+++ b/package/multimedia/libtheora/libtheora.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# libtheora
+#
+#############################################################
+LIBTHEORA_VERSION = 1.0
+LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
+LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
+LIBTHEORA_AUTORECONF = NO
+LIBTHEORA_INSTALL_STAGING = YES
+LIBTHEORA_INSTALL_TARGET = YES
+
+LIBTHEORA_CONF_OPT = \
+		--disable-oggtest \
+		--disable-vorbistest \
+		--disable-sdltest \
+		--disable-examples
+
+LIBTHEORA_DEPENDENCIES = uclibc libogg libvorbis pkgconfig
+
+$(eval $(call AUTOTARGETS,package/multimedia,libtheora))
-- 
1.6.0.4.762.g0567f
