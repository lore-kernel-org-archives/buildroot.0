From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:36 -0500
Subject: [Buildroot] [PATCH 23/44] linux-firmware: add chelsio t6 option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-24-aduskett@codeblue.com>
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
index 51413b8..622441b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -380,6 +380,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	help
 	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards (cxgb4)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6
+	bool "Chelsio T6"
+	help
+	  Firmware files for Chelsio T6 1Gb and 10Gb ethernet cards (cxgb6)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8a4e5ee..d47d05d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -484,6 +484,12 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.14.4.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6),y)
+# cxgb4/t6fw.bin is a symlink to cxgb4/t6fw-1.16.26.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t6fw-1.16.26.0.bin cxgb4/t6fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
-- 
2.9.3
