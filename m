From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 21:42:19 +0200
Subject: [Buildroot] [PATCH] linux-firmware: add support for b43xx firmwares
Message-ID: <1374176539-18915-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index d9bb095..01fe90f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -20,6 +20,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	help
 	  Firmware files for the Atheros 9271 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
+	bool "Broadcom BRCM bcm43xx"
+	help
+	  Firmware files for the Broadcom BRCM bcm43xx
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	bool "Intel iwlwifi 5000"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4ff0e0a..a88bc4c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -112,6 +112,9 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700) += \
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK) += \
 	dvb-usb-terratec-h5-drxk.fw
 
+# brcm
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX) += \
+	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw
 
 ifneq ($(LINUX_FIRMWARE_FILES_y),)
 
-- 
1.8.1.2
