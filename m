From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Sep 2014 22:17:17 +0200
Subject: [Buildroot] [git commit] gst-omx: bump version
Message-ID: <20140909205923.C8F049D64B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3a7f3f3ad38fc7a46d43e0eeafbc9ad341c90f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust configuration file library paths in a post-patch hook instead of a
patch as that is more robust / makes it easier to bump the version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer1/gst-omx/gst-omx-config-files.patch  |  127 --------------------
 package/gstreamer1/gst-omx/gst-omx.mk              |   10 ++-
 2 files changed, 9 insertions(+), 128 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx-config-files.patch b/package/gstreamer1/gst-omx/gst-omx-config-files.patch
deleted file mode 100644
index f484521..0000000
--- a/package/gstreamer1/gst-omx/gst-omx-config-files.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-Change config files to match default buildroot install
-
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
----
-Index: gst-omx-1.0.0/config/bellagio/gstomx.conf
-===================================================================
---- gst-omx-1.0.0.orig/config/bellagio/gstomx.conf	2013-03-12 04:12:09.000000000 -0500
-+++ gst-omx-1.0.0/config/bellagio/gstomx.conf	2013-05-21 17:50:14.545692908 -0500
-@@ -1,6 +1,6 @@
- [omxmpeg4videodec]
- type-name=GstOMXMPEG4VideoDec
--core-name=/usr/local/lib/libomxil-bellagio.so.0
-+core-name=/usr/lib/libomxil-bellagio.so.0
- component-name=OMX.st.video_decoder.mpeg4
- rank=256
- in-port-index=0
-@@ -9,7 +9,7 @@
- 
- [omxh264dec]
- type-name=GstOMXH264Dec
--core-name=/usr/local/lib/libomxil-bellagio.so.0
-+core-name=/usr/lib/libomxil-bellagio.so.0
- component-name=OMX.st.video_decoder.avc
- rank=256
- in-port-index=0
-@@ -18,7 +18,7 @@
- 
- [omxmpeg4videoenc]
- type-name=GstOMXMPEG4VideoEnc
--core-name=/usr/local/lib/libomxil-bellagio.so.0
-+core-name=/usr/lib/libomxil-bellagio.so.0
- component-name=OMX.st.video_encoder.mpeg4
- rank=0
- in-port-index=0
-@@ -27,7 +27,7 @@
- 
- [omxaacenc]
- type-name=GstOMXAACEnc
--core-name=/usr/local/lib/libomxil-bellagio.so.0
-+core-name=/usr/lib/libomxil-bellagio.so.0
- component-name=OMX.st.audio_encoder.aac
- rank=0
- in-port-index=0
-Index: gst-omx-1.0.0/config/rpi/gstomx.conf
-===================================================================
---- gst-omx-1.0.0.orig/config/rpi/gstomx.conf	2013-05-21 17:51:39.965693635 -0500
-+++ gst-omx-1.0.0/config/rpi/gstomx.conf	2013-05-21 17:52:07.781693871 -0500
-@@ -1,6 +1,6 @@
- [omxmpeg2videodec]
- type-name=GstOMXMPEG2VideoDec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_decode
- rank=256
- in-port-index=130
-@@ -9,7 +9,7 @@
- 
- [omxmpeg4videodec]
- type-name=GstOMXMPEG4VideoDec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_decode
- rank=256
- in-port-index=130
-@@ -18,7 +18,7 @@
- 
- [omxh263dec]
- type-name=GstOMXH263Dec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_decode
- rank=256
- in-port-index=130
-@@ -27,7 +27,7 @@
- 
- [omxh264dec]
- type-name=GstOMXH264Dec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_decode
- rank=256
- in-port-index=130
-@@ -36,7 +36,7 @@
- 
- [omxtheoradec]
- type-name=GstOMXTheoraDec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_decode
- rank=256
- in-port-index=130
-@@ -45,7 +45,7 @@
- 
- [omxvp8dec]
- type-name=GstOMXVP8Dec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_decode
- rank=256
- in-port-index=130
-@@ -54,7 +54,7 @@
- 
- [omxmjpegdec]
- type-name=GstOMXMJPEGDec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_decode
- rank=256
- in-port-index=130
-@@ -63,7 +63,7 @@
- 
- [omxvc1dec]
- type-name=GstOMXWMVDec
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_encode
- rank=256
- in-port-index=130
-@@ -73,7 +73,7 @@
- 
- [omxh264enc]
- type-name=GstOMXH264Enc
--core-name=/opt/vc/lib/libopenmaxil.so
-+core-name=/usr/lib/libopenmaxil.so
- component-name=OMX.broadcom.video_encode
- rank=256
- in-port-index=200
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index ea5648e..10c21f5 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.0.0
+GST_OMX_VERSION = 1.2.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = http://gstreamer.freedesktop.org/src/gst-omx
 
@@ -34,4 +34,12 @@ endif
 
 GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
 
+# adjust library paths to where buildroot installs them
+define GST_OMX_FIXUP_CONFIG_PATHS
+	find $(@D)/config -name gstomx.conf | \
+		xargs $(SED) 's|/usr/local|/usr|g' -e 's|/opt/vc|/usr|g'
+endef
+
+GST_OMX_POST_PATCH_HOOKS += GST_OMX_FIXUP_CONFIG_PATHS
+
 $(eval $(autotools-package))
