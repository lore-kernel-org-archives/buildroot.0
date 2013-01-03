From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Jan 2013 22:18:57 +0100
Subject: [Buildroot] [PATCH 1/3] firmwares: add a new package category to
	locate all firmwares
In-Reply-To: <cover.1357247755.git.yann.morin.1998@free.fr>
References: <cover.1357247755.git.yann.morin.1998@free.fr>
Message-ID: <4fdbfa674f1c608b08fa9fe2dea5e9940978c590.1357247755.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
1.7.2.5
