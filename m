From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Thu, 21 Aug 2014 14:42:59 +0300
Subject: [Buildroot] [PATCH] More descriptive help text for usb_modeswitch
Message-ID: <1408621379-10953-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provides a fuller description of the USB_ModeSwitch functionality for the
benefit of the otherwise clueless.

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
---
 package/usb_modeswitch/Config.in |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index 5d8a6d2..8f7e7c9 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -3,8 +3,17 @@ config BR2_PACKAGE_USB_MODESWITCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
-	  USB mode switcher.
-	  Used to switch mode on multiple-function devices
+	  Some models of some USB devices such as modems and Wifi adapters
+	  power-up in mass storage mode to provide access to drivers for the
+	  device's application mode. USB_ModeSwitch changes the mode of such
+	  devices from the initial power-up mode to the application mode.
+	  Specific configuration data for each device model is required.
+
+	  usb_modeswitch can be used with package usb_modeswitch_data and udev
+	  for automatic mode switching when devices are connected.
+
+	  For more information Internet search for "Virtual CD-ROM switching
+	  utility".
 
 	  http://www.draisberghof.de/usb_modeswitch/
 
-- 
1.7.10.4
