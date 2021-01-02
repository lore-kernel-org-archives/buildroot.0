From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 13:57:13 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Broadcom Tigon3 ethernet cards
Message-ID: <20210102123956.DC3E18384E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e12df970bb50fb35bfedca2bb88c941ac0ec884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 6d5e961527..8e71c21251 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -380,6 +380,12 @@ endmenu
 
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
index dbcf135f26..92d03624f5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -461,6 +461,12 @@ LINUX_FIRMWARE_FILES += iwlwifi-9???-*.ucode
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
