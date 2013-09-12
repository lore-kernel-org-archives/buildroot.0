From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 21:56:11 -0300
Subject: [Buildroot] [PATCH 3/5] usb_modeswitch: bump to version 2.0.1
In-Reply-To: <1378947373-4767-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378947373-4767-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378947373-4767-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop libusb-compat since it's no longer required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usb_modeswitch/Config.in         | 1 -
 package/usb_modeswitch/usb_modeswitch.mk | 4 ++--
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
 
-- 
1.8.1.5
