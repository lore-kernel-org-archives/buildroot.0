From: Ryan Coe <bluemrp9@gmail.com>
Date: Sat, 17 Mar 2018 09:11:17 -0700
Subject: [Buildroot] [PATCH 1/1] rpi-bt-firmware: remove compatibility
 symlink
Message-ID: <20180317161117.28469-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 361d1b969ecdba1a8a62613626f90fc025b94660 defines FIRMWARE_DIR for
bluez5_utils. The compatibility symlink for the firmware is no longer
needed.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/rpi-bt-firmware/rpi-bt-firmware.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 255da19262..644fdc6d5f 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -10,10 +10,7 @@ RPI_BT_FIRMWARE_SITE_METHOD = git
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 
-# The BlueZ hciattach utility looks for firmware in /etc/firmware. Add a
-# compatibility symlink.
 define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
-	ln -sf ../lib/firmware $(TARGET_DIR)/etc/firmware
 	$(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd \
 		$(TARGET_DIR)/lib/firmware/BCM43430A1.hcd
 endef
-- 
2.16.2
