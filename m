From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  9 Sep 2015 22:20:59 +0200
Subject: [Buildroot] [PATCH 10/14] gst1-imx: bump version to 0.11.1
In-Reply-To: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1441830063-8190-11-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
(0.11.1)
- vpu: decoder: Keep track of unfinished gstvideo frames
- blitter fixes and enhancements
- ipu: All pages are now cleared when page flipping is used
- compositor: Added support for cropping input streams
- imxv4l2src fixes and enhancements
(0.11.0)
- new common codebase for rectangular regions and video canvases
- new blitter-based video sink with full support for vsync to
  eliminate tearing
- complete rewrite of blitter base code
- new compositor elements
- vpu: decoder: Memory leaks fixed
- vpu: encoder: Bitrate can now be set on the fly
- eglvivsink: In Wayland, window x/y coordinates are now supported
- several v4l2src fixes
(0.10.2)
- v4l2src: renamed imxv4l2src to imxv4l2videosrc to avoid name
  collisions with the FSL plugins
- v4l2src: Call the buffer pool baseclass stop() function (fixes
  segfaults)
- uniaudio: Create correct config header even if no codecs were found
- audio: new MP3 encoder element using the libfslcodec MP3 encoder
- g2d/ipu/pxp blitter sink: Respect aspect ratio also in 90/270 degree
  rotations
- pxp: Remove broken/unsupported formats
- eglvivsink: Fix double mutex unlock
- phys mem meta naming cleanup

Tested with the following commands:
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxeglvivsink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/gstreamer1/gst1-imx/gst1-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 9ba7550..8ede8ad 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_IMX_VERSION = 0.10.1
+GST1_IMX_VERSION = 0.11.1
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
 GST1_IMX_LICENSE = LGPLv2+
-- 
2.5.1
