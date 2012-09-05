From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Sep 2012 22:59:31 +0200
Subject: [Buildroot] [git commit] linux-firmware: add firmware for SDIO
	based Marvell Libertas modules
Message-ID: <20120905215421.62DF797020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c04355b9223b2d74a091b2722229bc0f337d2820
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/Config.in         |   19 +++++++++++++++++++
 package/linux-firmware/linux-firmware.mk |   12 ++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index c494f0f..0c24d98 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -22,6 +22,25 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 
 endmenu
 
+menu "Marvell Libertas"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
+       bool "Libertas SD 8686 v8"
+       help
+         Firmware files (version 8) for the Marvell SD8686 module
+
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9
+       bool "Libertas SD 8686 v9"
+       help
+         Firmware files (version 9) for the Marvell SD8686 module
+
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688
+       bool "Libertas SD 8688"
+       help
+         Firmware files for the Marvell SD8688 module
+
+endmenu
+
 menu "Ralink"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 28c551f..23afafa 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -40,6 +40,18 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010) += \
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271) += \
 	LICENCE.atheros_firmware ar9271.fw htc_9271.fw
 
+# sd8686 v8
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8) += \
+	libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin LICENCE.Marvell
+
+# sd8686 v9
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9) += \
+	libertas/sd8686_v9.bin libertas/sd8686_v9_helper.bin LICENCE.Marvell
+
+# sd8688
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688) += \
+	libertas/sd8688.bin libertas/sd8688_helper.bin LICENCE.Marvell
+
 # wl127x
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
 	ti-connectivity/wl1271-fw-2.bin				\
