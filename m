From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 10 Sep 2016 08:51:44 -0300
Subject: [Buildroot] [PATCH 1/2] linux-firmware: add bluetooth firmware for
	intel chips
Message-ID: <1473508305-8603-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It probably makes no sense to try split them up by model since there
aren't that big.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f56f31d..79af71e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -26,6 +26,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 
 endmenu # Video
 
+menu "Bluetooth firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IBT
+	bool "Intel Wireless Bluetooth"
+	help
+	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
+	  bluetooth support.
+
+endmenu # Bluetooth
+
 menu "WiFi firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1401848..5c80c1e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -19,6 +19,12 @@ LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
+# Intel Wireless Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
+LINUX_FIRMWARE_FILES += intel/ibt-*
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ibt_firmware
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
-- 
2.7.3
