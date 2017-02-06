From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:23 -0500
Subject: [Buildroot] [PATCH 10/44] linux-firmware: add nvidia nouveau option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-11-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9d32d7e..b3be6f8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -69,6 +69,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MATROX
 	help
 	  Firmware files for the Matrox G200/G400/G550 video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_NOUVEAU
+	bool "nouveau - NVIDIA GPU driver"
+	help
+	  Firmware files for various NVIDIA cards.
+
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6cd554c..b471bd4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -81,6 +81,9 @@ LINUX_FIRMWARE_DIRS += matrox
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_NOUVEAU),y)
+LINUX_FIRMWARE_DIRS += nvidia
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.nvidia
 endif
 
 # Intel Wireless Bluetooth
-- 
2.9.3
