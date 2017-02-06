From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:48 -0500
Subject: [Buildroot] [PATCH 35/44] linux-firmware: add edgeport serial
	device option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-36-aduskett@codeblue.com>
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
index 7f494c2..064afa1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -478,6 +478,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_COMPUTONE
 	help
 	  Firmware files for Computone IntelliPort Plus serial device
 
+config BR2_PACKAGE_LINUX_FIRMWARE_EDGEPORT
+	bool "USB Inside Out Edgeport Serial Driver"
+	help
+	  USB Inside Out Edgeport Serial Driver
+
 endmenu # Serial
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9a05ace..9f0e7fe 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -646,6 +646,13 @@ LINUX_FIRMWARE_FILES += intelliport2.bin
 # which is installed unconditionally
 endif
 
+# USB Inside Out Edgeport
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_EDGEPORT),y)
+LINUX_FIRMWARE_DIRS += edgeport
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
