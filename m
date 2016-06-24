From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Fri, 24 Jun 2016 08:12:21 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: cleanup of build options
Message-ID: <1466748741-6725-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove invalid options:
--disable-wsap
--disable-direct3d
--disable-gsettings

remove duplicate options:
--disable-rtmp
--disable-hls
--disable-dash

rename disable->strp -> disable-srtp (that was probably the
original intention, but the spelling has always been incorrect)

remove liveadder plugin - no longer a separate built option, it's
been merged into audiomixer

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           |  5 -----
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 +-------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 046c2aa..0f9fb15 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -312,11 +312,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBRFB
 	help
 	  Connects to a VNC server and decodes RFB stream
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER
-	bool "liveadder"
-	help
-	  Adds multiple live discontinuous streams
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI
 	bool "midi"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 271569e..8f739ec 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -17,9 +17,7 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
 	--disable-valgrind \
 	--disable-directsound \
-	--disable-wsapi \
 	--disable-direct3d \
-	--disable-direct3d9 \
 	--disable-winks \
 	--disable-android_media \
 	--disable-apple_media \
@@ -35,7 +33,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-voamrwbenc \
 	--disable-bs2b \
 	--disable-chromaprint \
-	--disable-dash \
 	--disable-dc1394 \
 	--disable-dts \
 	--disable-resindvd \
@@ -47,7 +44,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-ladspa \
 	--disable-lv2 \
 	--disable-libde265 \
-	--disable-strp \
+	--disable-srtp \
 	--disable-linsys \
 	--disable-modplug \
 	--disable-mimic \
@@ -69,11 +66,8 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-vdpau \
 	--disable-schro \
 	--disable-zbar \
-	--disable-rtmp \
 	--disable-spandsp \
-	--disable-gsettings \
 	--disable-sndio \
-	--disable-hls \
 	--disable-gtk3 \
 	--disable-qt
 
@@ -376,12 +370,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-librfb
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-liveadder
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-liveadder
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-midi
 else
-- 
2.8.2
