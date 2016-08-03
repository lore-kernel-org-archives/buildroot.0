From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 22:09:12 +0200
Subject: [Buildroot] [PATCH 5/5] gst1-imx: bump to version 0.12.2
In-Reply-To: <1469627614-29709-6-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 27 Jul 2016 15:53:34 +0200")
References: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
 <1469627614-29709-6-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <871t25iphz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Changelog:
 > * imxv4l2videosrc:
 >   * Stricter checks for video device capabilities
 >   * Add support for more video formats like 8/16-bit grayscale

 > * pxp: Fix incorrect return code which broke blitter with GStreamer 1.8

 > * blitter:
 >   * Improvements in error logging
 >   * Fixes for RGBx framebuffer format detection
 >   * Fix for subtle tearing problem by implementing triple buffering

 > * audio:
 >   * Replace objdump-based scan during build configuration
 >     Codec filenames are instead moved to the C code; the libdir
 >     path of the libfslaudiocodec.pc file is used to know where on
 >     the target the files are placed
 >   * Explicitely add the libfslaudiocodec.pc libdir to the MP3 encoder
 >     Fixes build errors in buildroot
 >   * Minor logging fixes

 > * misc:
 >   * Proper check for region copies in phys_mem_meta
 >   * Add missing G_END_DECLS lines in headers

 > Tested with the following commands on i.MX6Q (IPU):
 >  # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 >  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
 >    matroskademux ! imxvpudec ! imxipuvideosink
 >  # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
 >    matroskademux ! imxvpudec ! imxeglvivsink

 > Tested with the following commands on i.MX7 (PXP):
 >  # gst-launch-1.0 imxv4l2videosrc device=/dev/video1 ! imxpxpvideosink

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
