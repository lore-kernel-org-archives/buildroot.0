From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:22 -0500
Subject: [Buildroot] [PATCH 09/44] linux-firmware: add matrox graphics card
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-10-aduskett@codeblue.com>
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
index 48c5963..9d32d7e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -64,6 +64,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	help
 	  Firmware files for the Intel i915 video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MATROX
+	bool "Matrox G200/G400/G550 video card firmware"
+	help
+	  Firmware files for the Matrox G200/G400/G550 video cards.
+
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b3ba1b0..6cd554c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -74,6 +74,13 @@ LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
 endif
 
+# Matrox Graphics Card
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MATROX),y)
+LINUX_FIRMWARE_DIRS += matrox
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 endif
 
 # Intel Wireless Bluetooth
-- 
2.9.3
