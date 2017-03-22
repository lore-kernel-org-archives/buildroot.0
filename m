From: Karoly Pados <kp@tec4data.at>
Date: Wed, 22 Mar 2017 13:36:41 +0100
Subject: [Buildroot] [PATCH 1/1] linux-firmware: Add missing firmware for
	the carl9170 driver.
Message-ID: <20170322123641.19482-1-kp@tec4data.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For a long time now Atheros USB AR9170 devices have been using the
carl9170 driver which relies on the carl9170-1.fw firmware file.
This firmware is built by current buildroot, but its output
is not copied to the resulting rootfs. This patch fixes that.

Please backport to 2017.02.x branch.

Signed-off-by: Karoly Pados <kp@tec4data.at>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bfcd2ef09..55a4aac09 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -104,7 +104,7 @@ endif
 
 # ar9170
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170),y)
-LINUX_FIRMWARE_FILES += ar9170-1.fw ar9170-2.fw
+LINUX_FIRMWARE_FILES += ar9170-1.fw ar9170-2.fw carl9170-1.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
-- 
2.12.0
