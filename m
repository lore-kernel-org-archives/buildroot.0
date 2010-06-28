From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Mon, 28 Jun 2010 13:15:36 +0100
Subject: [Buildroot] [PATCH] Added GStreamer Real-Time Streaming Protocol
	pkg.
Message-ID: <AB12B32E73474741A2C5361C433A44DE01E38DE5@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 package/multimedia/Config.in            |    1 +
 package/multimedia/gst-rtsp/Config.in   |    9 +++++++++
 package/multimedia/gst-rtsp/gst-rtsp.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-rtsp/Config.in
 create mode 100644 package/multimedia/gst-rtsp/gst-rtsp.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 3b0eec5..690e2d7 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -9,6 +9,7 @@ source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/gst-rtsp/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
 source "package/multimedia/libdvdread/Config.in"
 source "package/multimedia/libdvdnav/Config.in"
diff --git a/package/multimedia/gst-rtsp/Config.in
b/package/multimedia/gst-rtsp/Config.in
new file mode 100644
index 0000000..c12ff59
--- /dev/null
+++ b/package/multimedia/gst-rtsp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GST_RTSP
+	bool "gst-rtsp"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  A GStreamer based RTSP server.
+
+	  http://gstreamer.freedesktop.org/modules/gst-rtsp-server.html
+
diff --git a/package/multimedia/gst-rtsp/gst-rtsp.mk
b/package/multimedia/gst-rtsp/gst-rtsp.mk
new file mode 100644
index 0000000..be51a43
--- /dev/null
+++ b/package/multimedia/gst-rtsp/gst-rtsp.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# gst-rtsp
+#
+#############################################################
+GST_RTSP_VERSION = 0.10.5
+GST_RTSP_SOURCE = gst-rtsp-$(GST_RTSP_VERSION).tar.bz2
+GST_RTSP_SITE = http://people.freedesktop.org/~wtay/
+GST_RTSP_LIBTOOL_PATCH = NO
+GST_RTSP_INSTALL_STAGING = YES
+GST_RTSP_INSTALL_TARGET = YES
+
+GST_RTSP_DEPENDENCIES = gst-plugins-base gstreamer liboil
+
+$(eval $(call AUTOTARGETS,package/multimedia,gst-rtsp))
-- 
1.7.1
