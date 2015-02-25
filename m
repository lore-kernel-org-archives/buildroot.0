From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 17:12:52 +0100
Subject: [Buildroot] [git commit] package/gstreamer[0/1]: rename
	BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX config option.
Message-ID: <20150225161515.CEE3F817C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=752dd650b52f85db01d54d3d16b62003b13d953a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 1] BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX is not defined anywhere
 2] qtdemux is not a plugin by itself but belongs to isomp4

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-good/Config.in   |    4 ++--
 package/gstreamer1/gst1-plugins-good/Config.in |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
index 3e25820..35bb692 100644
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -27,11 +27,11 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB
 	bool "zlib support"
-	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ISOMP4 || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
 	select BR2_PACKAGE_ZLIB
 	help
 	  Enable zlib support for the following plugins:
-	  id3demux, qtdemux, matroska
+	  id3demux, isomp4, matroska
 
 comment "dependency-less plugins"
 
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 73c633f..9d15cbf 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -34,11 +34,11 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
 	bool "zlib support"
-	depends on BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_QTDEMUX || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
+	depends on BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4 || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
 	select BR2_PACKAGE_ZLIB
 	help
 	  Enable zlib support for the following plugins:
-	  id3demux, qtdemux, matroska
+	  id3demux, isomp4, matroska
 
 comment "dependency-less plugins"
 
