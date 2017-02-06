From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:26 -0500
Subject: [Buildroot] [PATCH 13/44] linux-firmware: add atheros qca61x4
	bluetooth option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-14-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 0bc6d77..46f9e64 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -92,6 +92,11 @@ endmenu # Video encoder
 
 menu "Bluetooth firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ABT_QCA61X4
+	bool "Qualcomm Atheros Bluetooth support for QCA61x4 chips"
+	help
+	  Firmware files for Qualcomm Atheros QCA61x4 Bluetooth chips
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	bool "Intel Wireless Bluetooth"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bdeabfa..2609653 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -113,6 +113,14 @@ LINUX_FIRMWARE_FILES += intel/ibt-*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ibt_firmware
 endif
 
+# Quallcomm Atheros QCA61x4 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ABT_QCA61X4),y)
+LINUX_FIRMWARE_DIRS += qca
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENSE.QualcommAtheros_ath10k \
+	qca/NOTICE.txt
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
-- 
2.9.3
