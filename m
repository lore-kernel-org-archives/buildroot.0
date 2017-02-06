From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:31 -0500
Subject: [Buildroot] [PATCH 18/44] linux-firmware: add mediatek mt7650 option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-19-aduskett@codeblue.com>
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
index 9722775..3aeb61c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -291,6 +291,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
 	help
 	  MediaTek MT7601U
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
+	bool "MediaTek MT7650"
+	help
+	  MediaTek MT7650
+	  
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
 	bool "Ralink rt2501/rt61"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b883a0c..a2c5ae5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -317,6 +317,12 @@ LINUX_FIRMWARE_FILES += mt7601u.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
+# MT7601
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650),y)
+LINUX_FIRMWARE_FILES += mt7650.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+endif
+
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
-- 
2.9.3
