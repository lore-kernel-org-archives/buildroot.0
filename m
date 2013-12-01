From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:50:47 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: bump for misc fixes
	and improvements
Message-ID: <20131201225157.9C4A09BE94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78f0f205622e787d0c5de988e3b6897fb4beb6fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a few shortcomings in the boot firmware:
  - emmc pll clock issues
  - audio underruns and chirps
  - unload of sensor drivers (?)
  - missing config.txt no longer borks the boot
  - lockups during long exposures on the camera
  - YUV-to-texture fastpath for the camera

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
