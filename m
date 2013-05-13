From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 13 May 2013 13:04:01 -0500
Subject: [Buildroot] [PATCH v4 7/7] gst1-plugins-good: add libvpx support
In-Reply-To: <1368468241-23319-1-git-send-email-spenser@gillilanding.com>
References: <1368468241-23319-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368468241-23319-8-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

adds libvpx support to gst1-plugins-good

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/gst1-plugins-good/Config.in     |    4 ++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |   10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst1-plugins-good/Config.in b/package/multimedia/gst1-plugins-good/Config.in
index c339a45..7653ec4 100644
--- a/package/multimedia/gst1-plugins-good/Config.in
+++ b/package/multimedia/gst1-plugins-good/Config.in
@@ -206,6 +206,10 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
 	bool "speex"
 	select BR2_PACKAGE_SPEEX
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
+	bool "vpx (webm)"
+	select BR2_PACKAGE_LIBVPX
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
 	bool "wavpack (*.wv audio)"
 	select BR2_PACKAGE_WAVPACK
diff --git a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
index 15e3b0e..297bb5e 100644
--- a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
@@ -27,8 +27,7 @@ GST1_PLUGINS_GOOD_CONF_OPT += \
 		--disable-jack \
 		--disable-libdv \
 		--disable-dv1394 \
-		--disable-taglib \
-		--disable-vpx
+		--disable-taglib
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
@@ -390,6 +389,13 @@ else
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
