From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 14:27:51 +0800
Subject: [Buildroot] [PATCH 2/3] package/linux-firmware: Add bnx2x firmware
In-Reply-To: <1389853671.877776.456824160566.0.gpush@pablo>
Message-ID: <1389853671.878483.155308752952.2.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add revision 17 of the Broadcom NetXtreme II 10Gb ethernet driver.

We also add an ethernet submenu for the firmware selection.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/linux-firmware/Config.in         |    9 +++++++++
 package/linux-firmware/linux-firmware.mk |    9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index c8d7a55a..57f8096b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -93,6 +93,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
 
 endmenu
 
+menu "Ethernet firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
+	bool "Broadcom NetXtremeII"
+	help
+	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
+
+endmenu
+
 menu "DVB firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 27b6ab51..db9928d9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -135,6 +135,15 @@ LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
+LINUX_FIRMWARE_FILES += \
+	bnx2x/bnx2x-e1-7.8.17.0.fw \
+	bnx2x/bnx2x-e1h-7.8.17.0.fw \
+	bnx2x/bnx2x-e2-7.8.17.0.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XC5000),y)
 LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
