From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 22 Feb 2018 14:12:03 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add firmware for ath10k
 QCA6174 module
Message-ID: <1519305123-26936-1-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f93561e..4e77a3f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -83,6 +83,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
 	help
 	  Firmware files for the Atheros QCA988X module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174
+	bool "Atheros 10k (QCA6174)"
+	help
+	  Firmware files for the Atheros QCA6174 module
+
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
 	bool "Broadcom BRCM bcm43xx"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8268093..a6fd8eb 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -143,6 +143,14 @@ LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
+# ath10k-qca6174
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174),y)
+LINUX_FIRMWARE_FILES += ath10k/QCA6174/hw3.0/board.bin \
+			ath10k/QCA6174/hw3.0/firmware-4.bin \
+			ath10k/QCA6174/hw3.0/firmware-6.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
 # sd8686 v8
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8),y)
 LINUX_FIRMWARE_FILES += libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin
-- 
2.7.4
