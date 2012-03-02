From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Mar 2012 15:43:29 -0300
Subject: [Buildroot] [PATCH 1/2] linux-firmware: update definition for
	atheros ar9271
Message-ID: <1330713810-12947-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ar9271.fw is the old convention for the firmware.
Starting with kernel 3.0 the new convention is htc_9271.fw which is a
newer version of the firmware so symlinking won't do it and there are no
guarantees that the newer firmware will work with the older driver
either.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index eedef2f..8d1dd00 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -23,7 +23,7 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
 
 # ar9271
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271) += \
-	LICENCE.atheros_firmware ar9271.fw
+	LICENCE.atheros_firmware ar9271.fw htc_9271.fw
 
 # wl127x
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
-- 
1.7.3.4
