From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:34 -0500
Subject: [Buildroot] [PATCH 21/44] linux-firmware: add alteon acenic
	ethernet option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-22-aduskett@codeblue.com>
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
index 2a4ab3d..f377e63 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -355,6 +355,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ADAPTEC_STARFIRE
 	help
 	  Firmware files for the Adaptec Starfire/DuraLAN ethernet card
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ALTEON_ACENIC
+	bool "Alteon AceNIC Gigabit Ethernet card"
+	help
+	  Firmware files for the Alteon AceNIC Gigabit Ethernet card
+	  
 config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	bool "Broadcom NetXtremeII"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c748b29..d51ef51 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -454,6 +454,12 @@ LINUX_FIRMWARE_DIRS += adaptec
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ALTEON_ACENIC),y)
+LINUX_FIRMWARE_DIRS += acenic
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
 # No license file; the license is in the file WHENCE
-- 
2.9.3
