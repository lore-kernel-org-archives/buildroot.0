From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Mar 2012 15:43:30 -0300
Subject: [Buildroot] [PATCH 2/2] linux-firmware: add ar7010 variant
	(ath9k_htc driver) firmware
In-Reply-To: <1330713810-12947-1-git-send-email-gustavo@zacarias.com.ar>
References: <1330713810-12947-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1330713810-12947-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/Config.in         |    5 +++++
 package/linux-firmware/linux-firmware.mk |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index b15896c..5166800 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -10,6 +10,11 @@ if BR2_PACKAGE_LINUX_FIRMWARE
 
 menu "Atheros"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
+	bool "Atheros 7010"
+	help
+	  Firmware files for the Atheros 7010 module
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	bool "Atheros 9271"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8d1dd00..e09f67d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -21,6 +21,10 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
 	rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin 	\
 	LICENCE.ralink-firmware.txt
 
+# ar7010
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010) += \
+	LICENCE.atheros_firmware ar7010.fw ar7010_1_1.fw htc_7010.fw
+
 # ar9271
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271) += \
 	LICENCE.atheros_firmware ar9271.fw htc_9271.fw
-- 
1.7.3.4
