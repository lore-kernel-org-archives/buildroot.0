From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 00:46:11 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: reorganise config
	menus
Message-ID: <20130103234637.D12759A5F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=337628a0c104e1e8a687cd738500a83946ad2f0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorganise the sub-menus for the linux-firmware package, so it is easier
to add new categories of firmwares to install (coming in a future patch).

Remove the per-chipco sub-menus, as all entries have the chipco name in
its prompt (except for TI, which is added).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/Config.in |   26 +++-----------------------
 1 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f156756..4cfd4db 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE
 
 if BR2_PACKAGE_LINUX_FIRMWARE
 
-menu "Atheros"
+menu "WiFi firmwares"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
 	bool "Atheros 7010"
@@ -20,10 +20,6 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	help
 	  Firmware files for the Atheros 9271 module
 
-endmenu
-
-menu "Marvell Libertas"
-
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
        bool "Libertas SD 8686 v8"
        help
@@ -39,19 +35,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688
        help
          Firmware files for the Marvell SD8688 module
 
-endmenu
-
-menu "Marvell WiFi-Ex"
-
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	bool "Marvell Wifi-Ex SD 8787"
 	help
 	  Firmware files for the Marvell Wifi-Ex 8787 module on SDIO.
 
-endmenu
-
-menu "Ralink"
-
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
 	bool "Ralink rt2501/rt61"
 	help
@@ -67,10 +55,6 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX
 	help
 	  Ralink rt27xx/rt28xx/rt30xx
 
-endmenu
-
-menu "Realtek"
-
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
 	bool "Realtek 8192"
 	help
@@ -81,17 +65,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
 	help
 	  Realtek 8712
 
-endmenu
-
-menu "Texas Instruments"
-
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
-	bool "wl127X"
+	bool "TI wl127X"
 	help
 	  Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
-	bool "wl128X"
+	bool "TI wl128X"
 	help
 	  Firmware files for WLAN and Bluetooth modules wl128x
 
