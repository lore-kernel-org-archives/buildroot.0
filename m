From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:52 -0500
Subject: [Buildroot] [PATCH 39/44] linux-firmware: add ti usb 3410 serial
	interface option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-40-aduskett@codeblue.com>
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
index 3fee908..ab30585 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -498,6 +498,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ROCKETPORT
 	help
 	  Firmware files for Comtrol RocketPort 2 serial device
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_3410
+	bool "TI USB 3410 Serial Interface"
+	help
+	  Firmware files for TI USB 3410 Serial Interface
+
 endmenu # Serial
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c227996..9b358fd 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -676,6 +676,13 @@ LINUX_FIRMWARE_FILES += rp2.fw
 # which is installed unconditionally
 endif
 
+# TI USB 3410 Serial Interface
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_3410),y)
+LINUX_FIRMWARE_FILES += ti_3410.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
