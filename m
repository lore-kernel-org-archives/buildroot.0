From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 21:49:29 +0200
Subject: [Buildroot] [RFC v1 09/13] WIP: package/gst1-libav: bump version to
 1.18.0 and convert to meson
In-Reply-To: <20200916194933.24921-1-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
Message-ID: <20200916194933.24921-9-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change home page url to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
 - needs some extra work (and testing)...
---
 package/gstreamer1/gst1-libav/Config.in       |  2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash |  6 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 30 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index 23d78b6ad1..e58a3532f0 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_GST1_LIBAV
 	  The codecs, muxers, bitstreams and filters to build can be
 	  selected in the ffmpeg package.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 15e4d859ee..9a74465e09 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.16.2.tar.xz.sha256sum
-sha256 c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2 gst-libav-1.16.2.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.0.tar.xz.sha256sum
+sha256  42f93f5ce9a3fc22051e5f783a4574b56ebf213f331f75dcbc3552459bd3a06a  gst-libav-1.18.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index fdd4d6cc2e..470ae8c13c 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.16.2
+GST1_LIBAV_VERSION = 1.18.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 
@@ -14,29 +14,29 @@ GST1_LIBAV_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_XZ),xz)
 GST1_LIBAV_LICENSE = GPL-2.0+
 GST1_LIBAV_LICENSE_FILES = COPYING
-GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
+#GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
 
 # fixes arm build: https://bugzilla.gnome.org/show_bug.cgi?id=694416
-ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
-GST1_LIBAV_CONF_ENV = AS="$(TARGET_CROSS)gcc"
-endif
+#ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be),y)
+#GST1_LIBAV_CONF_ENV = AS="$(TARGET_CROSS)gcc"
+#endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
+#GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
 GST1_LIBAV_DEPENDENCIES += zlib
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-zlib
+#else
+#GST1_LIBAV_CONF_EXTRA_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-GST1_LIBAV_CONF_EXTRA_OPTS += --enable-bzlib
+#GST1_LIBAV_CONF_EXTRA_OPTS += --enable-bzlib
 GST1_LIBAV_DEPENDENCIES += bzip2
-else
-GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
+#else
+#GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
 endif
 
-GST1_LIBAV_CONF_OPTS = \
-	--with-system-libav \
-	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
+#GST1_LIBAV_CONF_OPTS = \
+#	--with-system-libav \
+#	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.28.0
