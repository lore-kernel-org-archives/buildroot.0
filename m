From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 20 Jun 2013 17:07:42 -0500
Subject: [Buildroot] [PATCH v12 07/11] gst1-plugins-good: add libvpx support
In-Reply-To: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1371766066-676-8-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

adds libvpx support to gst1-plugins-good

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gst1-plugins-good/Config.in     |    4 ++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |    7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/multimedia/gst1-plugins-good/Config.in b/package/multimedia/gst1-plugins-good/Config.in
index 9b7eba0..e579539 100644
--- a/package/multimedia/gst1-plugins-good/Config.in
+++ b/package/multimedia/gst1-plugins-good/Config.in
@@ -317,6 +317,10 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	help
 	  VP8 plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
+	bool "vpx (webm)"
+	select BR2_PACKAGE_LIBVPX
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
 	bool "wavpack (*.wv audio)"
 	select BR2_PACKAGE_WAVPACK
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
index f177ed1..1e6d39b 100644
--- a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
@@ -380,6 +380,13 @@ else
 GST1_PLUGINS_GOOD_CONF_OPT += --disable-speex
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX),y)
+GST1_PLUGINS_GOOD_CONF_OPT += --enable-vpx
+GST1_PLUGINS_GOOD_DEPENDENCIES += libvpx
+else
+GST1_PLUGINS_GOOD_CONF_OPT += --disable-vpx
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
 GST1_PLUGINS_GOOD_CONF_OPT += --enable-wavpack
 GST1_PLUGINS_GOOD_DEPENDENCIES += wavpack
-- 
1.7.9.5
