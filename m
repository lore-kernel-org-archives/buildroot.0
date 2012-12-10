From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 10 Dec 2012 01:19:35 +0100
Subject: [Buildroot] [PATCH 1/1] libusb-compat : bump version
Message-ID: <1355098775-25152-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


There seemed to be another more recent version around
of the libusb-compat package.
The new version fixes the Segmentation fault of the usb_modeswitch package.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch | 10 ----------
 package/libusb-compat/libusb-compat.mk                    |  7 +++++--
 2 files changed, 5 insertions(+), 12 deletions(-)
 delete mode 100644 package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch

diff --git a/package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch b/package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch
deleted file mode 100644
index e5ba786..0000000
--- a/package/libusb-compat/libusb-compat-0.1.3-pkgconfig.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- libusb-compat-0.1.3.orig/libusb.pc.in	2008-06-18 00:13:02.000000000 +0100
-+++ libusb-compat-0.1.3/libusb.pc.in	2009-09-16 12:06:50.000000000 +0100
-@@ -9,6 +9,7 @@ emulated_by=libusb-1.0
- Name: libusb
- Description: USB access library (libusb-1.0 compat wrapper)
- Version: @LIBUSB01_VERSION@
-+Requires: libusb-1.0
- Libs: -L${libdir} -lusb
- Cflags: -I${includedir}
- 
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 848c705..b9177ee 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -3,12 +3,15 @@
 # libusb-compat
 #
 #############################################################
-LIBUSB_COMPAT_VERSION = 0.1.4
+LIBUSB_COMPAT_VERSION = 0.1.12
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
-LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
+LIBUSB_COMPAT_SOURCE = libusb-$(LIBUSB_COMPAT_VERSION).tar.gz
+LIBUSB_COMPAT_SITE = http://prdownloads.sourceforge.net/libusb
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 
+LIBUSB_COMPAT_CONF_OPT +=--disable-build-docs
+
 define LIBUSB_COMPAT_FIXUP_CONFIG
 	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
 	    -e 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
-- 
1.8.0.1
