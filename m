From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 23:38:18 +0200
Subject: [Buildroot] [git commit] linux-firmware: add qca6174{bt} firmware
Message-ID: <20170704213508.70CDE81D56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caaff41ec168d4abe083eccebb534c555b816e66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Thomas: adjust alphabetic ordering, rename bluetooth option to
include vendor name.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 43ed841..7f4d2a0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -39,6 +39,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
 	  bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
+	bool "Qualcomm Atheros Rome 6174A Bluetooth"
+	help
+	  Firmware files for QCA Rome 6174A bluetooth support.
+
 endmenu # Bluetooth
 
 menu "WiFi firmware"
@@ -206,6 +211,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
 	help
 	  MediaTek MT7601U
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
+	bool "Qualcomm Atheros 6174"
+	help
+	  Firmware files for the Qualcomm Atheros QCA6174 chip
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
 	bool "Ralink rt2501/rt61"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bce36ce..dff15a2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -30,6 +30,12 @@ LINUX_FIRMWARE_FILES += intel/ibt-*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ibt_firmware
 endif
 
+# Qualcomm Atheros Rome 6174A Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT),y)
+LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qcom
+endif
+
 # Freescale i.MX SDMA
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA),y)
 LINUX_FIRMWARE_FILES += imx/sdma/sdma-imx6q.bin imx/sdma/sdma-imx7d.bin
@@ -194,6 +200,12 @@ LINUX_FIRMWARE_FILES += mt7601u.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
+# qca6174
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
+LINUX_FIRMWARE_FILES += ath10k/QCA6174
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+endif
+
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
