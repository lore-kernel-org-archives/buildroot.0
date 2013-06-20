From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 20 Jun 2013 17:53:30 +0200
Subject: [Buildroot] [PATCH 4/4] usb_modeswitch_data: bump to 20130610
In-Reply-To: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1371743610-17810-5-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 .../usb_modeswitch_data-fix-parallel-install.patch         |    6 +++---
 .../usb_modeswitch_data/usb_modeswitch_data-makefile.patch |   12 ++++++------
 package/usb_modeswitch_data/usb_modeswitch_data.mk         |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch b/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
index ba30499..9319d0d 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
+++ b/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
@@ -7,10 +7,10 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -22,6 +22,7 @@
- 	install -D --mode=644 40-usb_modeswitch.rules $(RULESDIR)/40-usb_modeswitch.rules
+@@ -26,6 +26,7 @@
+ 	./gen-rules.tcl
  
- db-install:
+ db-install: files-install
 +	install -d $(PREFIX)/share/usb_modeswitch
  	install --mode=644 -t $(PREFIX)/share/usb_modeswitch ./usb_modeswitch.d/*
  
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
index 769e514..5632abd 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
+++ b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
@@ -4,19 +4,19 @@ cross-compiler environment, it is not wanted to reload the host udev rules.
 Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
 --- usb_modeswitch_data-20120120.orig/Makefile	2012-01-20 17:25:32.000000000 -0500
 +++ usb_modeswitch_data-20120120/Makefile	2012-02-06 14:20:47.000000000 -0500
-@@ -12,9 +12,9 @@
- 
+@@ -13,9 +13,9 @@
  clean:
+ 	$(RM) 40-usb_modeswitch.rules
  
--install: files-install db-install rules-reload
-+install: files-install db-install
+-install: all files-install db-install rules-reload
++install: all files-install db-install
  
 -install-packed: files-install db-install-packed rules-reload
 +install-packed: files-install db-install-packed
  
- files-install:
+ files-install: 
  	install -d $(PREFIX)/share/usb_modeswitch
-@@ -50,7 +50,7 @@
+@@ -54,7 +54,7 @@
  		fi \
  	fi
  
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 479137c..26432c1 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USB_MODESWITCH_DATA_VERSION = 20121109
+USB_MODESWITCH_DATA_VERSION = 20130610
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
1.7.10.4
