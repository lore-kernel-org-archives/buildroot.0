From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:31:27 +0100
Subject: [Buildroot] [git commit branch/next] usb_modeswitch_data: bump to
	version 20170205
Message-ID: <20170227203137.41F307FBB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab692a644c8134ed121ebd96f539998e2c0f81be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usb_modeswitch_data/0001-makefile.patch    | 28 ----------------------
 .../usb_modeswitch_data/usb_modeswitch_data.hash   |  2 +-
 package/usb_modeswitch_data/usb_modeswitch_data.mk |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/usb_modeswitch_data/0001-makefile.patch b/package/usb_modeswitch_data/0001-makefile.patch
deleted file mode 100644
index 28441fe..0000000
--- a/package/usb_modeswitch_data/0001-makefile.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fixed Makefile install sections to not reload udev rules. In a 
-cross-compiler environment, it is not wanted to reload the host udev rules.
-
-Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
-Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
---- a/Makefile	2013-06-10 22:32:53.000000000 +0200
-+++ b/Makefile	2013-06-11 10:38:03.181161401 +0200
-@@ -13,9 +13,9 @@
- clean:
- 	$(RM) 40-usb_modeswitch.rules
- 
--install: all files-install db-install rules-reload
-+install: all files-install db-install
- 
--install-packed: files-install db-install-packed rules-reload
-+install-packed: files-install db-install-packed
- 
- files-install: 
- 	install -d $(PREFIX)/share/usb_modeswitch
-@@ -54,7 +54,7 @@
- 		fi \
- 	fi
- 
--uninstall: files-uninstall rules-reload
-+uninstall: files-uninstall
- 
- files-uninstall:
- 	$(RM) $(RULESDIR)/40-usb_modeswitch.rules
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index 0df5475..e19fcac 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d679a44a48b1d1f243fea6b4d2bd54e0e08010ff579dd81eaf698954c0c6dfa7	usb-modeswitch-data-20160112.tar.bz2
+sha256	e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1	usb-modeswitch-data-20170205.tar.bz2
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index a0cbc12..6d75b31 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20160112
+USB_MODESWITCH_DATA_VERSION = 20170205
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
