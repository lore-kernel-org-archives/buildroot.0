From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 00:46:02 +0100
Subject: [Buildroot] [git commit] firmwares: add a new package category to
	locate all firmwares
Message-ID: <20130103234637.93E839A5F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4d4b433999ba9f0fb2804c9b4103a4dff0477e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have quite a few packages that are dedicated to providing firmwares
for miscellanous devices. Those package are spread out in the big
"Hradware handling" menu, so are a bit hard to find.

Move all those packages to their own sub-menu:
    Package Selection for the target  --->
        Hardware handling  --->
            Firmwares  --->
                [ ] b43-firware
                [ ] linux-firmware
                [ ] ux500-firmware

Hopefully, this will make it nicer, when new firmware-providing packages
are added in the future (eg. in the pipe: firmware for the RPI GPU).

Fix a typo in the 'b43-firmware' prompt (missing 'm').

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    8 +++++---
 package/b43-firmware/Config.in |    2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7860f3f..2cbadf4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,8 +199,12 @@ source "package/xfsprogs/Config.in"
 endmenu
 
 menu "Hardware handling"
-source "package/acpid/Config.in"
+menu "Misc devices firmwares"
 source "package/b43-firmware/Config.in"
+source "package/linux-firmware/Config.in"
+source "package/ux500-firmware/Config.in"
+endmenu
+source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
@@ -232,7 +236,6 @@ source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
-source "package/linux-firmware/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
@@ -266,7 +269,6 @@ source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
-source "package/ux500-firmware/Config.in"
 source "package/wipe/Config.in"
 endmenu
 
diff --git a/package/b43-firmware/Config.in b/package/b43-firmware/Config.in
index ab7f4a7..bc69bbc 100644
--- a/package/b43-firmware/Config.in
+++ b/package/b43-firmware/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_B43_FIRMWARE
-	bool "b43-firware"
+	bool "b43-firmware"
 	help
 	  Firmware for the Broadcom Wifi devices supported by the b43
 	  kernel driver.
