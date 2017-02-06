From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:27 -0500
Subject: [Buildroot] [PATCH 14/44] linux-firmware: add atheros ar3011
	bluetooth option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-15-aduskett@codeblue.com>
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
index 46f9e64..82d5355 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -97,6 +97,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ABT_QCA61X4
 	help
 	  Firmware files for Qualcomm Atheros QCA61x4 Bluetooth chips
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ABT_AR3011
+	bool "Qualcomm Atheros Bluetooth support for AR3011 chips"
+	help
+	  Firmware files for Qualcomm Atheros AR3011 Bluetooth chips
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	bool "Intel Wireless Bluetooth"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2609653..e0ddb0d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -121,6 +121,12 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += \
 	qca/NOTICE.txt
 endif
 
+# Quallcomm Atheros AR3011 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ABT_AR3011),y)
+LINUX_FIRMWARE_FILES += ath3k-1.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
-- 
2.9.3
