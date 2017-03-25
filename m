From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:28:02 +0100
Subject: [Buildroot] [git commit] linux-firmware: Add missing firmware for
	the carl9170 driver
Message-ID: <20170325143433.EE3FC818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=397db2fd5d67f57d39ef58744958bef6f1e6cb35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a long time now Atheros USB AR9170 devices have been using the
carl9170 driver which relies on the carl9170-1.fw firmware file.  This
firmware is available in linux-firmware but it wasn't currently
installed by Buildroot.

Signed-off-by: Karoly Pados <kp@tec4data.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bfcd2ef..55a4aac 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -104,7 +104,7 @@ endif
 
 # ar9170
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170),y)
-LINUX_FIRMWARE_FILES += ar9170-1.fw ar9170-2.fw
+LINUX_FIRMWARE_FILES += ar9170-1.fw ar9170-2.fw carl9170-1.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
