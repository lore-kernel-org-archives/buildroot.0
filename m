From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 20:50:06 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add options for
 MT7650/MT76x2e firmware
Message-ID: <20190623185145.7CC8B834A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37bf239c22d9b5228d366326304ad79e7d95aa4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add options to install the MT7650 bluetooth firmware and the MT76x2e
wifi firmware.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 6b182dc64f..2feec503f4 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -54,6 +54,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
 	  bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
+	bool "MediaTek MT7650"
+	help
+	  Firmware files for MediaTek MT7650 bluetooth support
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	bool "Qualcomm Atheros Rome 6174A Bluetooth"
 	help
@@ -247,6 +252,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
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
index 86e1d1e750..500050f284 100644
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
