From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 09:39:44 +0200
Subject: [Buildroot] [git commit] usb_modeswitch: bump to version 2.0.1
Message-ID: <20130912080443.0BE5C9B726@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=821575c1fa5398f31f3789a4a1abf63741df4a74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop libusb-compat since it's no longer required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/usb_modeswitch/Config.in         |    1 -
 package/usb_modeswitch/usb_modeswitch.mk |    4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index a27b3ee..8b3e408 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  USB mode switcher.
 	  Used to switch mode on multiple-function devices
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index fe54b50..ef9ff0d 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 1.2.6
+USB_MODESWITCH_VERSION = 2.0.1
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
-USB_MODESWITCH_DEPENDENCIES = libusb-compat
+USB_MODESWITCH_DEPENDENCIES = libusb
 USB_MODESWITCH_LICENSE = GPLv2+
 USB_MODESWITCH_LICENSE_FILES = COPYING
 
