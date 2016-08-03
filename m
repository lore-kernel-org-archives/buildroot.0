From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Aug 2016 22:08:30 +0200
Subject: [Buildroot] [git commit] gst1-imx: bump to version 0.12.2
Message-ID: <20160803200947.8C62F8219B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=735379d43a16e921eac3a6b5494e38a35ca9e733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
* imxv4l2videosrc:
  * Stricter checks for video device capabilities
  * Add support for more video formats like 8/16-bit grayscale

* pxp: Fix incorrect return code which broke blitter with GStreamer 1.8

* blitter:
  * Improvements in error logging
  * Fixes for RGBx framebuffer format detection
  * Fix for subtle tearing problem by implementing triple buffering

* audio:
  * Replace objdump-based scan during build configuration
    Codec filenames are instead moved to the C code; the libdir
    path of the libfslaudiocodec.pc file is used to know where on
    the target the files are placed
  * Explicitely add the libfslaudiocodec.pc libdir to the MP3 encoder
    Fixes build errors in buildroot
  * Minor logging fixes

* misc:
  * Proper check for region copies in phys_mem_meta
  * Add missing G_END_DECLS lines in headers

Tested with the following commands on i.MX6Q (IPU):
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxeglvivsink

Tested with the following commands on i.MX7 (PXP):
 # gst-launch-1.0 imxv4l2videosrc device=/dev/video1 ! imxpxpvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-imx/gst1-imx.hash | 2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index ca47776..d345deb 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 d8a7357bc575e22d0d19d6d7cf547bd69cad5fc47adb93f09ead41b0124353fa  gst1-imx-0.12.1.tar.gz
+sha256 a75f8bc3219fa3c62637f443cef0196c9eafb90aaa5af094847d007124895822  gst1-imx-0.12.2.tar.gz
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index e67f11f..3c6b1b6 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_IMX_VERSION = 0.12.1
+GST1_IMX_VERSION = 0.12.2
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
 GST1_IMX_LICENSE = LGPLv2+
