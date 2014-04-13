From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 23:24:53 +0200
Subject: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump revision
In-Reply-To: <cover.1397424240.git.yann.morin.1998@free.fr>
References: <cover.1397424240.git.yann.morin.1998@free.fr>
Message-ID: <4cff1d8687bc3c8249984430eda969c455fede6d.1397424240.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.3.2
