From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Feb 2017 19:09:06 +0200
Subject: [Buildroot] [PATCH next 2/2] usb_modeswitch_data: bump to version
	20170205
In-Reply-To: <a328be860a55e9fbce938ca984eaa63ae522d9e0.1488215346.git.baruch@tkos.co.il>
References: <a328be860a55e9fbce938ca984eaa63ae522d9e0.1488215346.git.baruch@tkos.co.il>
Message-ID: <7c3e2f06a5f158f8547369c3bded631b91ff1a4d.1488215346.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/usb_modeswitch_data/0001-makefile.patch    | 28 ----------------------
 .../usb_modeswitch_data/usb_modeswitch_data.hash   |  2 +-
 package/usb_modeswitch_data/usb_modeswitch_data.mk |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/usb_modeswitch_data/0001-makefile.patch

diff --git a/package/usb_modeswitch_data/0001-makefile.patch b/package/usb_modeswitch_data/0001-makefile.patch
deleted file mode 100644
index 28441fe00325..000000000000
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
index 0df5475ea37c..e19fcac628fc 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d679a44a48b1d1f243fea6b4d2bd54e0e08010ff579dd81eaf698954c0c6dfa7	usb-modeswitch-data-20160112.tar.bz2
+sha256	e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1	usb-modeswitch-data-20170205.tar.bz2
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index a0cbc126dfb8..6d75b3198310 100644
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
-- 
2.11.0
