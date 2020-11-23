From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Nov 2020 23:11:39 +0100
Subject: [Buildroot] [PATCH/next v1] package/linux-firmware: add option for
 Broadcom Tigon3 ethernet cards
Message-ID: <20201123221139.12637-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 105daf42b8..ca35317b5d 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -375,6 +375,12 @@ endmenu
 
 menu "Ethernet firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3
+	bool "Broadcom NetXtreme/Tigon3"
+	help
+	  Firmware files for Broadcom Tigon3 ethernet cards
+	  (tigon)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	bool "Broadcom NetXtremeII"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8808b5284c..520cfe0474 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -449,6 +449,12 @@ LINUX_FIRMWARE_FILES += iwlwifi-9???-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
+LINUX_FIRMWARE_FILES += tigon/*
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
 # No license file; the license is in the file WHENCE
-- 
2.29.2
