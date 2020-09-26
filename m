From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:54:36 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-ugly: bump
 version to 1.18.0
Message-ID: <20200926134452.1C0CE8DA2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ce47bbaaf52a452b9482e1f907ae4744fa08e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change home page url to https

- meson options: doc=disabled

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
