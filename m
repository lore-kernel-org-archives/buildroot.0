From: Marc-Andre Chenier <mac@vrvana.com>
Date: Wed, 8 Jul 2015 14:39:55 -0400
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add missing nvs
	file for the wl18xx firmware
Message-ID: <1436380795-30694-1-git-send-email-mac@vrvana.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marc-Andre Chenier <mac@vrvana.com>
---
 package/linux-firmware/linux-firmware.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 25a942a..f35dba5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -178,7 +178,10 @@ LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl18xx-fw-2.bin \
 	ti-connectivity/wl18xx-fw-3.bin \
 	ti-connectivity/wl18xx-fw-4.bin \
+	ti-connectivity/wl1271-nvs.bin \
 	ti-connectivity/TIInit_7.2.31.bts
+# wl1271-nvs.bin (above) is a symlink to:
+LINUX_FIRMWARE_FILES += ti-connectivity/wl127x-nvs.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
-- 
2.4.5
