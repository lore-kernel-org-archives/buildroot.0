From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 09:27:32 +0200
Subject: [Buildroot] [PATCH 1/2] gst-plugins-good: update configuration
	options
In-Reply-To: <1310628453-3966-1-git-send-email-s.neumann@raumfeld.com>
References: <1310628453-3966-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310628453-3966-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the list of plugins that can be selected/deselected.
---
 package/multimedia/gst-plugins-good/Config.in      |    9 +++++++++
 .../gst-plugins-good/gst-plugins-good.mk           |   18 ++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 368642f..b431603 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -82,6 +82,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ICYDEMUX
 	bool "icydemux"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE
+	bool "imagefreeze"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE
 	bool "interleave"
 
@@ -127,6 +130,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTPMANAGER
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP
 	bool "rtsp"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SHAPEWIPE
+	bool "shapewipe"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE
 	bool "smpte"
 
@@ -180,6 +186,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 	bool "ossaudio (OSS audio)"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
+	bool "oss4 (Open Sound System 4)"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
 	select BR2_PACKAGE_LIBSOUP
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 8fbd120..ff7b4c0 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -144,6 +144,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-icydemux
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-imagefreeze
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-imagefreeze
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-interleave
 else
@@ -234,6 +240,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-rtsp
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SHAPEWIPE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-shapewipe
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-shapewipe
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-smpte
 else
@@ -321,6 +333,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-oss
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-oss4
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-oss4
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-soup
 GST_PLUGINS_GOOD_DEPENDENCIES += libsoup
-- 
1.7.1
