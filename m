From: Martin Bark <martin@barkynet.com>
Date: Sun,  6 May 2018 21:07:29 +0100
Subject: [Buildroot] [PATCH 5/5] package/rpi-bt-firmware: bump version
In-Reply-To: <20180506200729.31951-1-martin@barkynet.com>
References: <20180506200729.31951-1-martin@barkynet.com>
Message-ID: <20180506200729.31951-6-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 553a7e4298..043706a1b8 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 beade89c5c072158b6cf18cf741d2695980fd6a4533dab3897bebf90c0631a30  rpi-bt-firmware-18d7c931aff0a8a78360b9b9eaeb15d1224fb907.tar.gz
+sha256 c219f1d232fb80fbf23e7f2ed97d9c495855355a36dda373a8985c699ee1dd4b  rpi-bt-firmware-b5307312a172c8d87d44f6df32f5e24f1c19770e.tar.gz
 sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index bbb40854e8..b1c0aa7c94 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 18d7c931aff0a8a78360b9b9eaeb15d1224fb907
+RPI_BT_FIRMWARE_VERSION = b5307312a172c8d87d44f6df32f5e24f1c19770e
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 
-RPI_BT_FIRMWARE_FILES = brcm/BCM43430A1.hcd BCM4345C0.hcd
-
 define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
-	$(foreach file,$(RPI_BT_FIRMWARE_FILES),\
-		$(INSTALL) -D -m 0644 $(@D)/firmware/$(file) $(TARGET_DIR)/lib/firmware/$(notdir $(file))
-	)
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
+	$(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
 endef
 
 $(eval $(generic-package))
-- 
2.17.0
