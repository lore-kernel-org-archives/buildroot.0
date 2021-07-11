From: Corentin Labbe <clabbe@baylibre.com>
Date: Sun, 11 Jul 2021 20:27:29 +0000
Subject: [Buildroot] [PATCH 1/1] package/armbian-firmware: add option to
 install AP6212 firmware
Message-ID: <20210711202729.2072853-1-clabbe@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This WiFi/BT chip is used on some Allwinner based boards like BananaPI M3.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 package/armbian-firmware/Config.in           | 5 +++++
 package/armbian-firmware/armbian-firmware.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
index 7c5f6ba193..5c3e93abaa 100644
--- a/package/armbian-firmware/Config.in
+++ b/package/armbian-firmware/Config.in
@@ -23,4 +23,9 @@ config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
 	help
 	  Firmware files for XR819 WiFi SDIO chip.
 
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_BRCM43XXX
+	bool "BRCM43XXX WiFi/BT"
+	help
+	  Firmware files for BRCM43XXX AP6212 WiFi/BT combo chip.
+
 endif
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index 0ed069025d..dab3890cdd 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -29,6 +29,13 @@ ARMBIAN_FIRMWARE_FILES += \
 	xr819/sdd_xr819.bin
 endif
 
+# AP6212 WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_BRCM43XXX),y)
+ARMBIAN_FIRMWARE_FILES += \
+	brcm/brcmfmac43430-sdio.txt \
+	brcm/brcmfmac43430a0-sdio.txt
+endif
+
 ifneq ($(ARMBIAN_FIRMWARE_FILES),)
 define ARMBIAN_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
-- 
2.25.1
