From: Allan W. Nielsen <a@awn.dk>
Date: Thu,  3 Nov 2011 18:09:31 +0100
Subject: [Buildroot] [PATCH 2/2] gst-plugins-bad: Updated commit bce4cfc7
	0.10.22
In-Reply-To: <1320340171-19905-1-git-send-email-a@awn.dk>
References: <1320340171-19905-1-git-send-email-a@awn.dk>
Message-ID: <1320340171-19905-3-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |   39 +++++++++++++++++++-
 1 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index afab0eb..8eaf4e6 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,7 +3,7 @@
 # gst-plugins-bad
 #
 #############################################################
-GST_PLUGINS_BAD_VERSION = 0.10.21
+GST_PLUGINS_BAD_VERSION = 0.10.22
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
@@ -180,6 +180,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-festival
 endif
 
+#  --disable-fieldanalysis disable dependency-less fieldanalysis plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-fieldanalysis
+
 #  --disable-freeze        disable dependency-less freeze plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-freeze
@@ -223,6 +226,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
 endif
 
+#  --disable-hls           disable dependency-less hls plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-hls
+
 #  --disable-id3tag        disable dependency-less id3tag plugin
 GST_PLUGINS_BAD_CONF_OPT += --disable-id3tag
 
@@ -290,6 +296,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpegdemux
 endif
 
+#  --disable-mpegtsdemux   disable dependency-less mpegtsdemux plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpegtsdemux
+
 #  --disable-mpegtsmux     disable dependency-less mpegtsmux plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
@@ -348,6 +357,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-nuvdemux
 endif
 
+#  --disable-patchdetect   disable dependency-less patchdetect plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-patchdetect
+
 #  --disable-pcapparse     disable dependency-less pcapparse plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-pcapparse
@@ -390,6 +402,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-rtpmux
 endif
 
+#  --disable-rtpvp8        disable dependency-less rtpvp8 plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-rtpvp8
+
 #  --disable-scaletempo    disable dependency-less scaletempo plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-scaletempo
@@ -397,6 +412,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-scaletempo
 endif
 
+#  --disable-sdi           disable dependency-less sdi plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-sdi
+
 #  --disable-sdp           disable dependency-less sdp plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-sdp
@@ -446,6 +464,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-tta
 endif
 
+#  --disable-videofilters  disable dependency-less videofilters plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-videofilters
+
 #  --disable-videomaxrate  disable dependency-less videomaxrate plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-videomaxrate
@@ -460,6 +481,9 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-videomeasure
 endif
 
+#  --disable-videoparsers  disable dependency-less videoparsers plugin
+GST_PLUGINS_BAD_CONF_OPT += --disable-videoparsers
+
 #  --disable-videosignal   disable dependency-less videosignal plugin
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-videosignal
@@ -537,9 +561,15 @@ GST_PLUGINS_BAD_CONF_OPT += --disable-celt
 #  --disable-cog                disable Cog plugin: cog
 GST_PLUGINS_BAD_CONF_OPT += --disable-cog
 
+#  --disable-curl               disable Curl plugin: curl
+GST_PLUGINS_BAD_CONF_OPT += --disable-curl
+
 #  --disable-dc1394             disable libdc1394: dc1394
 GST_PLUGINS_BAD_CONF_OPT += --disable-dc1394
 
+#  --disable-decklink           disable decklink: decklink
+GST_PLUGINS_BAD_CONF_OPT += --disable-decklink
+
 #  --disable-directfb           disable directfb: dfbvideosink
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-directfb
@@ -597,6 +627,9 @@ GST_PLUGINS_BAD_CONF_OPT += --disable-lv2
 #  --disable-libmms             disable mms protocol library: libmms
 GST_PLUGINS_BAD_CONF_OPT += --disable-libmms
 
+#  --disable-linsys             disable Linear Systems SDI plugin: linsys
+GST_PLUGINS_BAD_CONF_OPT += --disable-linsys
+
 #  --disable-modplug            disable modplug: modplug
 GST_PLUGINS_BAD_CONF_OPT += --disable-modplug
 
@@ -700,7 +733,7 @@ GST_PLUGINS_BAD_CONF_OPT += --disable-schro
 GST_PLUGINS_BAD_CONF_OPT += --disable-zbar
 
 #  --disable-vp8                disable VP8 decoder: vp8
-GST_PLUGINS_BAD_CONF_OPT += 
+GST_PLUGINS_BAD_CONF_OPT += --disable-vp8
 
 #  --disable-rtmp               disable rtmp library: rtmp
 GST_PLUGINS_BAD_CONF_OPT += --disable-rtmp
@@ -723,6 +756,8 @@ GST_PLUGINS_BAD_CONF_OPT += --disable-schemas-compile
 #  --with-pic              try to use only PIC/non-PIC objects [default=use
 #                          both]
 #  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+#  --with-sysroot=DIR Search for dependent libraries within DIR
+#                        (or the compiler's sysroot if not specified).
 #  --with-autoconf         use a different autoconf for regeneration of
 #                          Makefiles
 #  --with-autoheader       use a different autoheader for regeneration of
-- 
1.7.3.4
