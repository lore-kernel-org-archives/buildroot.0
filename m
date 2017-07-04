From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:39:35 +0200
Subject: [Buildroot] [PATCH] linux-firmware: add qca6174{bt} firmware
Message-ID: <20170704163935.14221-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/linux-firmware/Config.in         | 11 +++++++++++
 package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 43ed8413ae..5c653bffff 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -39,6 +39,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
 	  bluetooth support.

+config BR2_PACKAGE_LINUX_FIRMWARE_QCA_6174A_BT
+	bool "Qualcomm Atheros Rome 6174A Bluetooth"
+	help
+	  Firmware files for QCA Rome 6174A
+	  bluetooth support.
+
 endmenu # Bluetooth

 menu "WiFi firmware"
@@ -58,6 +64,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6004
 	help
 	  Firmware files for the Atheros AR6004 chip

+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
+	bool "Qualcomm Atheros 6174"
+	help
+	  Firmware files for the Qualcomm Atheros QCA6174 chip
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
 	bool "Atheros 7010"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bce36ceab8..87101689b0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -30,6 +30,12 @@ LINUX_FIRMWARE_FILES += intel/ibt-*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ibt_firmware
 endif

+# Qualcomm Atheros Rome 6174A Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCA_6174A_BT),y)
+LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qcom
+endif
+
 # Freescale i.MX SDMA
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA),y)
 LINUX_FIRMWARE_FILES += imx/sdma/sdma-imx6q.bin imx/sdma/sdma-imx7d.bin
@@ -102,6 +108,12 @@ LINUX_FIRMWARE_FILES += ath6k/AR6004
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif

+# qca6174
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
+LINUX_FIRMWARE_FILES += ath10k/QCA6174
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+endif
+
 # ar7010
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010),y)
 LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw ath9k_htc/htc_7010-1.4.0.fw
--
2.13.2
