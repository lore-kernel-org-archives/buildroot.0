From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 27 Sep 2011 14:27:07 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: sort plug-ins alphabetically
Message-ID: <1317126427-14633-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-good/Config.in      |   24 +++++-----
 .../gst-plugins-good/gst-plugins-good.mk           |   48 ++++++++++----------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index b431603..e560ea8 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -36,9 +36,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB
 
 comment "dependency-less plugins"
 
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER
-	bool "videofilter"
-
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA
 	bool "alpha"
 
@@ -76,6 +73,15 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV
 	bool "flv"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX
+	bool "flx"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM
+	bool "goom"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1
+	bool "goom2k1"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX
 	bool "id3demux (*.mp3 audio)"
 
@@ -88,15 +94,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE
 	bool "interleave"
 
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX
-	bool "flx"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM
-	bool "goom"
-
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1
-	bool "goom2k1"
-
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW
 	bool "law"
 
@@ -152,6 +149,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOCROP
 	bool "videocrop"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER
+	bool "videofilter"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER
 	bool "videomixer"
 
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index d037031..e78e26a 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -58,12 +58,6 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-videofilter
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-alpha
 else
@@ -136,6 +130,24 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-flv
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-flx
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-flx
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-goom
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-goom
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-goom2k1
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-goom2k1
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-id3demux
 else
@@ -160,24 +172,6 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-interleave
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-flx
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-flx
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-goom
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-goom
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-goom2k1
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-goom2k1
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-law
 else
@@ -280,6 +274,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-videocrop
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-videofilter
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-videomixer
 else
-- 
1.7.4.1
