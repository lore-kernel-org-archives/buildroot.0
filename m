From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Dec 2013 23:36:04 +0100
Subject: [Buildroot] [PATCH 1/4] package/rpi-firmware: bump for misc fixes
	and improvements
In-Reply-To: <cover.1385937338.git.yann.morin.1998@free.fr>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
Message-ID: <c273f76cedf440e9171bd7339cd99a1828622776.1385937338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This fixes a few shortcomings in the boot firmware:
  - emmc pll clock issues
  - audio underruns and chirps
  - unload of sensor drivers (?)
  - missing config.txt no longer borks the boot
  - lockups during long exposures on the camera
  - YUV-to-texture fastpath for the camera

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 94badf9..f0882d4 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 18a163f9341755b00841312af2878afeb64c131c
+RPI_FIRMWARE_VERSION = f7e9bcd25c9b01521fdf88aac2740b6cfc887dfb
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
