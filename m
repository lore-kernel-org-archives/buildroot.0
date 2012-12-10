From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 10 Dec 2012 01:25:14 +0100
Subject: [Buildroot] [PATCH 1/1] usb_modeswitch does not need libusb
Message-ID: <1355099114-23061-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Only libusb-compat is needed to build usb_modeswitch

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/usb_modeswitch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index a27b3ee..19371bb 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  USB mode switcher.
-- 
1.8.0.1
