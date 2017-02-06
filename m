From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:49 -0500
Subject: [Buildroot] [PATCH 36/44] linux-firmware: add keyspan usaxxx serial
	adapter option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-37-aduskett@codeblue.com>
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
index 064afa1..417cb7f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -482,6 +482,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_EDGEPORT
 	bool "USB Inside Out Edgeport Serial Driver"
 	help
 	  USB Inside Out Edgeport Serial Driver
+	  
+config BR2_PACKAGE_LINUX_FIRMWARE_KEYSPAN_USA
+	bool "USB Keyspan USA-xxx serial devices"
+	help
+	  Firmware files for USB Keyspan USA-xxx serial devices
 
 endmenu # Serial
 
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9f0e7fe..b444a9c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -653,6 +653,13 @@ LINUX_FIRMWARE_DIRS += edgeport
 # which is installed unconditionally
 endif
 
+# Keyspan USAxxx Serial adapters
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_KEYSPAN_USA),y)
+LINUX_FIRMWARE_DIRS += keyspan
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
