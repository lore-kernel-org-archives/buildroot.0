From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 21:49:27 +0200
Subject: [Buildroot] [RFC v1 07/13] package/gst1-plugins-ugly: bump version
 to 1.18.0
In-Reply-To: <20200916194933.24921-1-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
Message-ID: <20200916194933.24921-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change home page url to https

- meson options: doc=disabled

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-ugly/Config.in              | 2 +-
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 6 +++---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index c24ec7ae7b..ba19989892 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -5,7 +5,7 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_UGLY
 	  A set of well-supported plug-ins for GStreamer, but might pose
 	  problems for distributors.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
 
 if BR2_PACKAGE_GST1_PLUGINS_UGLY
 
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index e5df44ab90..9afc9a9c9a 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.16.2.tar.xz.sha256sum
-sha256 5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca gst-plugins-ugly-1.16.2.tar.xz
-sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.0.tar.xz.sha256sum
+sha256  686644e45e08258ae240c4519376668ad8d34ea6d0f6ab556473c317bfb7e082  gst-plugins-ugly-1.18.0.tar.xz
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 9f8b1d3359..2072772d9a 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.16.2
+GST1_PLUGINS_UGLY_VERSION = 1.18.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -15,7 +15,8 @@ GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
 	-Dexamples=disabled \
-	-Dtests=disabled
+	-Dtests=disabled \
+	-Ddoc=disabled
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
 	-Da52dec=disabled \
-- 
2.28.0
