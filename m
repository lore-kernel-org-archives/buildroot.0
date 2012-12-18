From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 14:27:56 +0100
Subject: [Buildroot] [git commit] linux-firmware: add support for the
	Marvell Wifi-Ex SD8787 firmware
Message-ID: <20121218132915.C96B89A381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4715c2b5b89b5a091924ea199f098963b63e470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/Config.in         |    9 +++++++++
 package/linux-firmware/linux-firmware.mk |    4 ++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 0c24d98..f156756 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -41,6 +41,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688
 
 endmenu
 
+menu "Marvell WiFi-Ex"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
+	bool "Marvell Wifi-Ex SD 8787"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8787 module on SDIO.
+
+endmenu
+
 menu "Ralink"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 09836a4..e9a5424 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -52,6 +52,10 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9) += \
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688) += \
 	libertas/sd8688.bin libertas/sd8688_helper.bin LICENCE.Marvell
 
+# sd8787
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787) += \
+	mrvl/sd8787_uapsta.bin LICENCE.Marvell
+
 # wl127x
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += \
 	ti-connectivity/wl1271-fw-2.bin				\
