From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:17 -0500
Subject: [Buildroot] [PATCH 04/44] linux-firmware: add mastro3 audio device
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-5-aduskett@codeblue.com>
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
index 2b53280..410a02d 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -30,6 +30,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_KORG1212
 	help
 	  Firmware files for Korg 1212 IO audio device.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MASTRO3
+	bool "ESS Allegro Maestro3 audio device"
+	help
+	  Firmware files for ESS Allegro Maestro3 audio device.
+
 endmenu # Audio
 
 menu "Video firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 03eea82..44de36d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -35,6 +35,13 @@ LINUX_FIRMWARE_FILES += korg/
 # which is installed unconditionally
 endif
 
+# ESS Allegro Maestro3 audio device
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MASTRO3),y)
+LINUX_FIRMWARE_DIRS += ess/
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
-- 
2.9.3
