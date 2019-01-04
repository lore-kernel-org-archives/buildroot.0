From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri,  4 Jan 2019 16:49:51 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add options to install more
 Mediatek firmwares.
Message-ID: <20190104154951.21807-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option to install the MT7650 bluetooth firmware and the
MT76x2e wifi firmware.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index dcc8d4bade..3efb3d9050 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -59,6 +59,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	help
 	  Firmware files for QCA Rome 6174A bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
+	bool "MediaTek MT7650"
+	help
+	  Firmware files for MediaTek MT7650 bluetooth support
+
 endmenu # Bluetooth
 
 menu "WiFi firmware"
@@ -242,6 +247,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
 	help
 	  MediaTek MT7601U
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E
+	bool "MediaTek MT76x2e"
+	help
+	  MediaTek MT76x2e
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
 	bool "Qualcomm Atheros 6174"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ee02c7a030..c238d9f01b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -243,6 +243,18 @@ LINUX_FIRMWARE_FILES += mt7601u.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
+# MT7650
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650),y)
+LINUX_FIRMWARE_FILES += mt7650.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+endif
+
+# MT76x2e
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E),y)
+LINUX_FIRMWARE_FILES += mt7662.bin mt7662_rom_patch.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+endif
+
 # qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174
-- 
2.20.1
