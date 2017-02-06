From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:29 -0500
Subject: [Buildroot] [PATCH 16/44] linux-firmware: add texas instruments
	bluetooth option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-17-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 8913f68..6ec08b8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -113,6 +113,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
 	  bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI
+	bool "Texas Instruments bluetooth driver"
+	help
+	  Firmware files for Texas Instruments Bluetooth chips
+	  
 endmenu # Bluetooth
 
 menu "WiFi firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 673e656..d8a4e60 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -153,6 +153,12 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
+# Texas Instruments Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI),y)
+LINUX_FIRMWARE_FILES += ti-connectivity/TIInit_7.2.31.bts
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
-- 
2.9.3
