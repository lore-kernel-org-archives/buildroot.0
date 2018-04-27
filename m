From: David Barbion <davidb@230ruedubac.fr>
Date: Fri, 27 Apr 2018 13:51:43 +0200
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add amdgpu firmware blobs.
Message-ID: <20180427115143.20338-1-davidb@230ruedubac.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Volcanic Islands (VI), Sea Islands (CI) and Southern
Islands (SI) cards.

This firmware files will be needed if linux kernel is compiled with
amdgpu enabled.

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f93561ee14..3e65c36be4 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
 	help
 	  Firmware files for AMD Radeon video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
+	bool "AMD GPU video card firmware"
+	help
+	  Firmware files for AMD GPU video cards.
+
 endmenu # Video
 
 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 82680937aa..119ea5d015 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -24,6 +24,11 @@ LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU),y)
+LINUX_FIRMWARE_DIRS += amdgpu
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
-- 
2.17.0
