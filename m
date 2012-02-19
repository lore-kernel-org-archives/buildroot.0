From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Feb 2012 23:03:10 +0100
Subject: [Buildroot] [git commit branch/next] linux-firmware: add support
	for the atheros ar9271 firmware
Message-ID: <20120219220800.7B51390AFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25d88d92814aae41c97a95e5c6be1373125b4f7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/Config.in         |    9 +++++++++
 package/linux-firmware/linux-firmware.mk |    4 ++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9ce1a75..b15896c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -8,6 +8,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE
 
 if BR2_PACKAGE_LINUX_FIRMWARE
 
+menu "Atheros"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
+	bool "Atheros 9271"
+	help
+	  Firmware files for the Atheros 9271 module
+
+endmenu
+
 menu "Ralink"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d5987ab..eedef2f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -21,6 +21,10 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
 	rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin 	\
 	LICENCE.ralink-firmware.txt
 
+# ar9271
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271) += \
+	LICENCE.atheros_firmware ar9271.fw
+
 # wl127x
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
 	ti-connectivity/wl1271-fw-2.bin				\
