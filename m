From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 20 Jun 2013 17:53:29 +0200
Subject: [Buildroot] [PATCH 3/4] usb_modeswitch: bump to 1.2.6
In-Reply-To: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1371743610-17810-4-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 .../usb_modeswitch/usb_modeswitch-makefile.patch   |   31 --------------------
 package/usb_modeswitch/usb_modeswitch.mk           |    2 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 package/usb_modeswitch/usb_modeswitch-makefile.patch

diff --git a/package/usb_modeswitch/usb_modeswitch-makefile.patch b/package/usb_modeswitch/usb_modeswitch-makefile.patch
deleted file mode 100644
index b792741..0000000
--- a/package/usb_modeswitch/usb_modeswitch-makefile.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Removed the -s from the install command. Without this, usb_modeswitch would
-fail to install.
-
-Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -46,7 +46,7 @@
- 	cd jim && $(MAKE) distclean
- 
- install-common: all
--	install -D -s --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
-+	install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
- 	install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
- 	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
- 	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
-@@ -67,10 +67,10 @@
- install: install-common install-script
- 
- install-shared: dispatcher-dynamic install-common
--	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
-+	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
- 
- install-static: dispatcher-static install-common
--	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
-+	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
- 
- uninstall:
- 	$(RM) $(SBINDIR)/usb_modeswitch
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 653109d..35f90bb 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USB_MODESWITCH_VERSION = 1.2.5
+USB_MODESWITCH_VERSION = 1.2.6
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb-compat
-- 
1.7.10.4
