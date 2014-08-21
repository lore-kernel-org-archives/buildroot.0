From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:29:02 +0200
Subject: [Buildroot] [git commit] usb_modeswitch: more descriptive help text
Message-ID: <20140821132922.814C99D4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1d7f2dc8f8ce470f60421538aa7bbfa9ba6b45c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides a fuller description of the USB_ModeSwitch functionality for
the benefit of the otherwise clueless.

[Thomas: minor formatting and wording fixes.]

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usb_modeswitch/Config.in |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index 5d8a6d2..e4c7168 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -3,8 +3,19 @@ config BR2_PACKAGE_USB_MODESWITCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
-	  USB mode switcher.
-	  Used to switch mode on multiple-function devices
+	  Some models of some USB devices such as modems and Wifi
+	  adapters power-up in mass storage mode to provide access to
+	  drivers for the device's application mode. usb_modeswitch
+	  changes the mode of such devices from the initial power-up
+	  mode to the application mode. Specific configuration data
+	  for each device model is required.
+
+	  usb_modeswitch can be used with the usb_modeswitch_data
+	  package and udev for automatic mode switching when devices
+	  are connected.
+
+	  For more information search the Internet for "Virtual CD-ROM
+	  switching utility".
 
 	  http://www.draisberghof.de/usb_modeswitch/
 
