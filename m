From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  7 Jun 2013 18:18:57 -0500
Subject: [Buildroot] [PATCH v10 12/13] gst1-plugins-good: add libvpx support
In-Reply-To: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370647138-26623-13-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

adds libvpx support to gst1-plugins-good
---
 package/multimedia/gst1-plugins-good/Config.in     |    4 ++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |   10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst1-plugins-good/Config.in b/package/multimedia/gst1-plugins-good/Config.in
index 2c27fe8..bdfe0b9 100644
--- a/package/multimedia/gst1-plugins-good/Config.in
+++ b/package/multimedia/gst1-plugins-good/Config.in
@@ -207,6 +207,10 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
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
index ee65f75..31d38f8 100644
--- a/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
@@ -30,8 +30,7 @@ GST1_PLUGINS_GOOD_CONF_OPT += \
 	--disable-jack \
 	--disable-libdv \
 	--disable-dv1394 \
-	--disable-taglib \
-	--disable-vpx
+	--disable-taglib
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
@@ -393,6 +392,13 @@ else
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
1.7.1
