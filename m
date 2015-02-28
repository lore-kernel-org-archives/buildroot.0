From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Mar 2015 00:15:41 +0100
Subject: [Buildroot] [git commit] package/rpi-firmware: fix config.txt
	parsing
Message-ID: <20150301084215.53AF47FA09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9ba844ed0b6f171094c4d2cb651cfea15eb833c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rpi-firmware we currently package has a fiscious bug, that happens
in corner cases while reading config.txt (mostly seen on RPi-2, but may
also occur on RPi-1).

Both the DT-aware and DT-unaware branches are affected.

Bump to the latest rpi-firmware to fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 03178d5..945f890 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 393dcc0e76f18f6ac1b67ba45d36058410670034
+RPI_FIRMWARE_VERSION = b9fac65dd9ff607d0c2c4ea1bbba2bbf3fbc4a10
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -16,7 +16,7 @@ RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
 # The Device Tree blobs are not yet in the master branch of the
 # raspberrypi firmware project, so we have to use a separate branch
 # for now.
-RPI_FIRMWARE_VERSION = 09627457b9e15bf4ea4e6751d3c173a3fb65df07
+RPI_FIRMWARE_VERSION = 6c0acfbbdba9908a4a4d21eab63c49ab72cb528b
 define RPI_FIRMWARE_INSTALL_DTB
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
