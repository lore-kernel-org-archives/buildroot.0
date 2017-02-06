From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:35 -0500
Subject: [Buildroot] [PATCH 22/44] linux-firmware: add broadcom tigen option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-23-aduskett@codeblue.com>
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
index f377e63..51413b8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -365,6 +365,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BNX2X
 	help
 	  Firmware files for Broadcom NetXtreme 10Gb ethernet cards (bnx2x)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TIGON
+	bool "Broadcom Tigon3 based gigabit Ethernet cards"
+	help
+	  Firmware files for  Broadcom Tigon3 based gigabit Ethernet cards
+	  
 config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4
 	bool "Chelsio T4"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d51ef51..8a4e5ee 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -466,6 +466,12 @@ LINUX_FIRMWARE_FILES += bnx2x/*
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TIGON),y)
+LINUX_FIRMWARE_DIRS += tigon
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
 # cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.14.4.0.bin
 LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.14.4.0.bin cxgb4/t4fw.bin
-- 
2.9.3
