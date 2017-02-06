From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:50 -0500
Subject: [Buildroot] [PATCH 37/44] linux-firmware: add keyspan pda serial
	adapter option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-38-aduskett@codeblue.com>
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
index 417cb7f..8b3cd6a 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -488,6 +488,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_KEYSPAN_USA
 	help
 	  Firmware files for USB Keyspan USA-xxx serial devices
 
+config BR2_PACKAGE_LINUX_FIRMWARE_KEYSPAN_PDA
+	bool "USB Keyspan PDA single-port serial devices"
+	help
+	  Firmware files for USB Keyspan single-port serial devices
+
 endmenu # Serial
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b444a9c..7bc149a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -660,6 +660,15 @@ LINUX_FIRMWARE_DIRS += keyspan
 # which is installed unconditionally
 endif
 
+# Keyspan PDA Serial adapters
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_KEYSPAN_PDA),y)
+LINUX_FIRMWARE_FILES += \
+	keyspan_pda/keyspan_pda.fw \
+	keyspan_pda/xircom_pgs.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
