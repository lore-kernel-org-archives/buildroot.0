From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:47 -0500
Subject: [Buildroot] [PATCH 34/44] linux-firmware: add computone serial
	device option.
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-35-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I also created a serial devices menu as there are several more
serial devices to add.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 2db4f15..7f494c2 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -471,4 +471,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_SIANO_MDTV
 	  
 endmenu
 
+menu "Serial devices"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_COMPUTONE
+	bool "Computone IntelliPort Plus serial device"
+	help
+	  Firmware files for Computone IntelliPort Plus serial device
+
+endmenu # Serial
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2418706..9a05ace 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -639,6 +639,13 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
+# USB ConnectTech computone serial device
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_COMPUTONE),y)
+LINUX_FIRMWARE_FILES += intelliport2.bin
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.9.3
