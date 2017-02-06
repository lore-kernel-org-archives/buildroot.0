From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:51 -0500
Subject: [Buildroot] [PATCH 38/44] linux-firmware: add comtrol rocketport 2
	serial option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-39-aduskett@codeblue.com>
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
index 8b3cd6a..3fee908 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -493,6 +493,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_KEYSPAN_PDA
 	help
 	  Firmware files for USB Keyspan single-port serial devices
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ROCKETPORT
+	bool "Comtrol RocketPort 2 serial driver"
+	help
+	  Firmware files for Comtrol RocketPort 2 serial device
+
 endmenu # Serial
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 7bc149a..c227996 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -669,6 +669,13 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+# Comtrol RocketPort 2 serial interface
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ROCKETPORT),y)
+LINUX_FIRMWARE_FILES += rp2.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
