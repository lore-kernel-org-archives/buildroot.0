From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 20:54:36 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: bump revision
Message-ID: <20140414185513.3D7DF9C03F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be92f003ba91d2ec7073928a6486261154a727b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Of utmost importance, this bump allows to overclock the RPi to even
higher frequencies: ARM > 1200MHz, core > 600MHz, RAM > 600MHz. :-)
To be used with caution, of course! :-)

Fixes and enhancements for:
  - clocks : allow higher overclocks
  - audio  : PCM channel expansion/conversion
  - video  : stutter on streams without b-frames, choice of scaling /kernel/
  - camera : padding-removal, new YUV and BGR modes
  - decoder: timestamps fixes, frames interval tracking
  - encoder: misc jpeg encoding fixes, save inline motion vectors
  - display: don't require EDID on HDMI

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 06fd194..1c85b83 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 9c7c2cd698ae24022c7aa74b16436c2966e82624
+RPI_FIRMWARE_VERSION = 04ba1c03780ae708c9289bce14f56933e55e9c20
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
