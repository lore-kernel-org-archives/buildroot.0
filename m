From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:54 -0500
Subject: [Buildroot] [PATCH 41/44] linux-firmware: add connecttech whiteheat
	serial device option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-42-aduskett@codeblue.com>
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
index 1b8c0d0..48af36a 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -508,6 +508,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_5052
 	help
 	  Firmware files for TI USB 5052 Serial Interface
 
+config BR2_PACKAGE_LINUX_FIRMWARE_WHITEHEAT
+	bool "USB ConnectTech WhiteHEAT serial device"
+	help
+	  Firmware files for USB ConnectTech WhiteHEAT serial device
+	  	  	  	  	  	  	  
 endmenu # Serial
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 35b60cc..d8b1729 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -690,6 +690,13 @@ LINUX_FIRMWARE_FILES += ti_5052.fw
 # which is installed unconditionally
 endif
 
+# USB ConnectTech WhiteHEAT serial device
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_WHITEHEAT),y)
+LINUX_FIRMWARE_FILES += whiteheat.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
