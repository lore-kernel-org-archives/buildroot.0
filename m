From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:28 -0500
Subject: [Buildroot] [PATCH 15/44] linux-firmware: add atheros ar3012
	bluetooth option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-16-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         |  5 +++++
 package/linux-firmware/linux-firmware.mk | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 82d5355..8913f68 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -102,6 +102,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ABT_AR3011
 	help
 	  Firmware files for Qualcomm Atheros AR3011 Bluetooth chips
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ABT_AR3012
+	bool "Qualcomm Atheros Bluetooth support for AR3012 chips"
+	help
+	  Firmware files for Qualcomm Atheros AR3012 Bluetooth chips
+	  	  	  
 config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	bool "Intel Wireless Bluetooth"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e0ddb0d..673e656 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -127,6 +127,32 @@ LINUX_FIRMWARE_FILES += ath3k-1.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
+# Quallcomm Atheros AR3012 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ABT_AR3012),y)
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
+	ar3k/AthrBT_0x01020201.dfu \
+	ar3k/1020201coex/ramps_0x01020201_26_HighPriority.dfu
+	
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
-- 
2.9.3
