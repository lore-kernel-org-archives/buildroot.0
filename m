From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:33 -0500
Subject: [Buildroot] [PATCH 20/44] linux-firmware: add adaptec starfire
	ethernet option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-21-aduskett@codeblue.com>
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
index 6cf4c18..2a4ab3d 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -350,6 +350,11 @@ endmenu
 
 menu "Ethernet firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ADAPTEC_STARFIRE
+	bool "Adaptec Starfire/DuraLAN support"
+	help
+	  Firmware files for the Adaptec Starfire/DuraLAN ethernet card
+
 config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	bool "Broadcom NetXtremeII"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 60d7f8a..c748b29 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -448,6 +448,12 @@ LINUX_FIRMWARE_FILES += iwlwifi-8265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ADAPTEC_STARFIRE),y)
+LINUX_FIRMWARE_DIRS += adaptec
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
 # No license file; the license is in the file WHENCE
-- 
2.9.3
