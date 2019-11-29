From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 29 Nov 2019 17:31:44 +0100
Subject: [Buildroot] [PATCH 1/1 next] package/linux-firmware: Add options
 for ar301[12] bluetooth firmware.
Message-ID: <20191129163144.26318-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This add two options for firmwares used by the ath3k firmware loader
driver.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/linux-firmware/Config.in         | 10 ++++++++
 package/linux-firmware/linux-firmware.mk | 31 ++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f2658a97da..9d142d2c54 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -64,6 +64,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	help
 	  Firmware files for QCA Rome 6174A bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AR3011
+	bool "Qualcomm Atheros 3011"
+	help
+	  Firmware files for Atheros bluetooth chipset AR3011.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_AR3012_USB
+	bool "Qualcomm Atheros 3012 (USB)"
+	help
+	  Firmware files for Atheros bluetooth chipset AR3012 on USB.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
 	bool "TI CC2560"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5596651532..9d86ce57b2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -114,6 +114,37 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
+# ar3011
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AR3011),y)
+LINUX_FIRMWARE_FILES += ath3k-1.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
+# ar3012
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AR3012_USB),y)
+LINUX_FIRMWARE_FILES += \
+	ar3k/AthrBT_0x01020001.dfu \
+	ar3k/ramps_0x01020001_26.dfu \
+	ar3k/AthrBT_0x01020200.dfu \
+	ar3k/ramps_0x01020200_26.dfu \
+	ar3k/ramps_0x01020200_40.dfu \
+	ar3k/AthrBT_0x31010000.dfu \
+	ar3k/ramps_0x31010000_40.dfu \
+	ar3k/AthrBT_0x11020000.dfu \
+	ar3k/ramps_0x11020000_40.dfu \
+	ar3k/ramps_0x01020201_26.dfu \
+	ar3k/ramps_0x01020201_40.dfu \
+	ar3k/AthrBT_0x41020000.dfu \
+	ar3k/ramps_0x41020000_40.dfu \
+	ar3k/AthrBT_0x11020100.dfu \
+	ar3k/ramps_0x11020100_40.dfu \
+	ar3k/AthrBT_0x31010100.dfu \
+	ar3k/ramps_0x31010100_40.dfu \
+	ar3k/AthrBT_0x01020201.dfu
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENCE.atheros_firmware LICENSE.QualcommAtheros_ar3k
+endif
+
 # ar6002
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002),y)
 LINUX_FIRMWARE_FILES += ath6k/AR6002
-- 
2.24.0
