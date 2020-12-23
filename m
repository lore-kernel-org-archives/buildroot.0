From: Stefan Agner <stefan@agner.ch>
Date: Wed, 23 Dec 2020 11:11:23 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: add new option for USB
 TI 3410/5052 firmware
Message-ID: <2a63d2fb5dc2a51888737af1d3e868b4b8cf74c8.1608718184.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index dbdfdb52b3..6d5e961527 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -490,4 +490,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X
 
 endmenu
 
+menu "USB to Serial Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI
+	bool "USB TI 3410/5052 Serial Firmware"
+	help
+	  Firmware files for TI 3410/5052
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f1c84a134d..f00fb2e6ae 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -620,6 +620,12 @@ LINUX_FIRMWARE_FILES += qat_c62x.bin qat_c62x_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI),y)
+LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) && \
-- 
2.29.2
