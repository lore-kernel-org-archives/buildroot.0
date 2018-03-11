From: Andre Renaud <andre@ignavus.net>
Date: Sun, 11 Mar 2018 21:57:15 +0000
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Qualcomm video
 firmware option
Message-ID: <CAEj2-1OQaPzpLwrrzN-42WDUiRk-eWd9=GPUtUYmJXdWQp124Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added Qualcomm video firmware option.

Signed-off-by: Andre Renaud <andre@ignavus.net>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in
b/package/linux-firmware/Config.in
index 4e77a3f9a3..61164e101c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
        help
          Firmware files for AMD Radeon video cards.

+config BR2_PACKAGE_LINUX_FIRMWARE_QCOM
+       bool "Qualcomm video card firmware"
+       help
+         Firmware files for Qualcomm/Snapdragon video cards.
+
 endmenu # Video

 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk
b/package/linux-firmware/linux-firmware.mk
index a6fd8ebba4..da106a9941 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -24,6 +24,11 @@ LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif

+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM),y)
+LINUX_FIRMWARE_DIRS += qcom
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
-- 
2.15.1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180311/c383ca05/attachment.html>
