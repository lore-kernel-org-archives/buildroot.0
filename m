From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:32 -0500
Subject: [Buildroot] [PATCH 19/44] linux-firmware: add wl125x option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-20-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3aeb61c..6cf4c18 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -326,6 +326,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
 	help
 	  Realtek rtl8821ae
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL125X
+	bool "TI wl125x"
+	help
+	  Firmware files for WLAN and Bluetooth modules wl125x
+	  
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index a2c5ae5..60d7f8a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -323,6 +323,15 @@ LINUX_FIRMWARE_FILES += mt7650.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
+# wl125x
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL125X),y)
+# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
+LINUX_FIRMWARE_FILES += \
+	ti-connectivity/wl1251-fw.bin \
+	ti-connectivity/wl1251-nvs.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
+
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
-- 
2.9.3
