From: Michael Cullen <michael@michaelcullen.name>
Date: Fri, 28 Jun 2019 10:08:48 +0100
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: Bump version for pi4
 support
Message-ID: <20190628090850.18733-1-michael@michaelcullen.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit pulls in the latest version of rpi-firmware to enable
support for the new Pi4

Additionally, it copies the RPi4 start files.

Signed-off-by: Michael Cullen <michael@michaelcullen.name>

---
I plan to rework the file copying. What's here right now won't work with
the db and cd images since the filename pattern for the pi4 isn't quite
the same.
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index d719fa6e08..0d7ce949a2 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e911f6342ea8aa9380cae97c6f5ac4ddd370527265f23d5b5d4b2c6f679d4ba8 rpi-firmware-ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da.tar.gz
+sha256 c82c40cf37fac36160a7f6b9c314506beb942bf113a55d30fa163c56a4f98946 rpi-firmware-bcf40b5c2b94178c7564fb451098d44968e44af5.tar.gz
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 272db1c321..d99c7dd0f0 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da
+RPI_FIRMWARE_VERSION = bcf40b5c2b94178c7564fb451098d44968e44af5
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
@@ -44,7 +44,9 @@ endif # INSTALL_VCDBG
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
 	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 	$(RPI_FIRMWARE_INSTALL_DTB)
-- 
2.21.0
