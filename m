From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:53 -0500
Subject: [Buildroot] [PATCH 40/44] linux-firmware: add ti usb 5052 serial
	interface option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-41-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ab30585..1b8c0d0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -503,6 +503,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_3410
 	help
 	  Firmware files for TI USB 3410 Serial Interface
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_5052
+	bool "TI USB 5052 Serial Interface"
+	help
+	  Firmware files for TI USB 5052 Serial Interface
+
 endmenu # Serial
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9b358fd..35b60cc 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -683,6 +683,13 @@ LINUX_FIRMWARE_FILES += ti_3410.fw
 # which is installed unconditionally
 endif
 
+# TI USB 5052 Serial Interface
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_5052),y)
+LINUX_FIRMWARE_FILES += ti_5052.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
