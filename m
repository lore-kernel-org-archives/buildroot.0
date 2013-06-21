From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Jun 2013 16:05:37 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: add libvpx support
Message-ID: <20130621143541.705F29AF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=302c7539c97ff4fe68a39d46996abfaa0a45f310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

adds libvpx support to gst1-plugins-good

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst1-plugins-good/Config.in     |    4 ++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

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
