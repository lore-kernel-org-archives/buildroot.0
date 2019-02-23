From: David Lechner <david@lechnology.com>
Date: Fri, 22 Feb 2019 19:07:32 -0600
Subject: [Buildroot] [PATCH] package/linux-firmware: move
 BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560 to Bluetooth
Message-ID: <20190223010732.9120-1-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This moves the BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560 option to the
Bluetooth section of the config file. This chip is Bluetooth-only, so
it belongs there instead of with the Wi-Fi/Bluetooth combo chips.

Signed-off-by: David Lechner <david@lechnology.com>
---
 package/linux-firmware/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index eaf68de8a5..6b182dc64f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -59,6 +59,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	help
 	  Firmware files for QCA Rome 6174A bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
+	bool "TI CC2560"
+	help
+	  Firmware files for Bluetooth modules CC2560 and CC2560A
+
 endmenu # Bluetooth
 
 menu "WiFi firmware"
@@ -282,11 +287,6 @@ config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
 	help
 	  Firmware files for WLAN and Bluetooth modules rs9113
 
-config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
-	bool "TI CC2560"
-	help
-	  Firmware files for Bluetooth modules CC2560 and CC2560A
-
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
-- 
2.17.1
