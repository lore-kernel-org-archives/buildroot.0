From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Nov 2020 16:54:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good: qmlgl
 needs gstreamer-gl-1.0
Message-ID: <20201128155409.1809491-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of qmlql fails without gstreamer-gl-1.0 since version 1.17.1 and
https://github.com/GStreamer/gst-plugins-good/commit/2ecba800bfbf177bc56999dc59ecdff00cbc353c

Fixes:
 - http://autobuild.buildroot.org/results/e1537ebac7cd70b6d868a8b7f0205ce3d8593508

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 4dcf26766a..67df206eea 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -279,6 +279,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
 	bool "qmlgl (qt5)"
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
@@ -286,6 +287,9 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QMLGL
 	help
 	  QT5 plugin which includes elements qmlglsrc and qmlglsink
 
+comment "qmlgl (qt5) needs the gst1-plugins-base opengl library"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
 	bool "shout2"
 	select BR2_PACKAGE_LIBSHOUT
-- 
2.29.2
