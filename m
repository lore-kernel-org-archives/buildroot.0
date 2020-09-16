From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 21:49:25 +0200
Subject: [Buildroot] [RFC v1 05/13] package/gst1-plugins-good: bump version
 to 1.18.0
In-Reply-To: <20200916194933.24921-1-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
Message-ID: <20200916194933.24921-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change home page url to https

- disable new plugin rpicamsrc (compile failure with current buildroot)

- meson options: add gobject-cast-checks=disabled, glib-asserts=disabled,
  glib-checks=disabled, asm=disabled (needs host-nasm), doc=disabled

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-good/Config.in         |  2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash           |  6 +++---
 .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk  | 10 ++++++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index be77f5a82e..4dcf26766a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -8,7 +8,7 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_GOOD
 	  A set of well-supported plug-ins for GStreamer under the
 	  preferred license.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
 
 if BR2_PACKAGE_GST1_PLUGINS_GOOD
 
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 075338b14b..01e2377d03 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.16.2.tar.xz.sha256sum
-sha256 40bb3bafda25c0b739c8fc36e48380fccf61c4d3f83747e97ac3f9b0171b1319 gst-plugins-good-1.16.2.tar.xz
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.18.0.tar.xz.sha256sum
+sha256  6329bc377a3afea5cf1ab329a91cc4a906f075781780d1edc59e8bea8c1a8bac  gst-plugins-good-1.18.0.tar.xz
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index eed4bfe117..396d693a71 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.16.2
+GST1_PLUGINS_GOOD_VERSION = 1.18.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -15,12 +15,18 @@ GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 GST1_PLUGINS_GOOD_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
+	-Dgobject-cast-checks=disabled \
+	-Dglib-asserts=disabled \
+	-Dglib-checks=disabled \
+	-Dasm=disabled \
 	-Ddirectsound=disabled \
 	-Dwaveform=disabled \
+	-Drpicamsrc=disabled \
 	-Dosxaudio=disabled \
 	-Dosxvideo=disabled \
 	-Daalib=disabled \
-	-Dlibcaca=disabled
+	-Dlibcaca=disabled \
+	-Ddoc=disabled
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
-- 
2.28.0
