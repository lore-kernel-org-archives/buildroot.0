From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Fri, 7 Jun 2013 15:20:29 +0200
Subject: [Buildroot] [PATCH] usb_modeswitch_data: bump to version 20130602
Message-ID: <51B1DE1D.5040703@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

drop patch applied upstream

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
---
 .../usb_modeswitch_data-fix-parallel-install.patch      | 17 -----------------
 .../usb_modeswitch_data-makefile.patch                  |  4 ++--
 package/usb_modeswitch_data/usb_modeswitch_data.mk      |  2 +-
 3 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch b/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
deleted file mode 100644
index ba30499..0000000
--- a/package/usb_modeswitch_data/usb_modeswitch_data-fix-parallel-install.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Properly create the directory before creating it so that parallel
-install work fine.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -22,6 +22,7 @@
- 	install -D --mode=644 40-usb_modeswitch.rules $(RULESDIR)/40-usb_modeswitch.rules
- 
- db-install:
-+	install -d $(PREFIX)/share/usb_modeswitch
- 	install --mode=644 -t $(PREFIX)/share/usb_modeswitch ./usb_modeswitch.d/*
- 
- db-install-packed:
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
index 769e514..8ddde4e 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
+++ b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
@@ -8,8 +8,8 @@ Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
  
  clean:
  
--install: files-install db-install rules-reload
-+install: files-install db-install
+-install: all files-install db-install rules-reload
++install: all files-install db-install
  
 -install-packed: files-install db-install-packed rules-reload
 +install-packed: files-install db-install-packed
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index cb9754f..b1d9cbe 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20121109
+USB_MODESWITCH_DATA_VERSION = 20130602
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
1.8.1.2


-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
