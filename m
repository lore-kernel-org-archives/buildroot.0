From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:00:01 +0100
Subject: [Buildroot] [git commit] libusb-compat: bump to version 0.1.5
Message-ID: <20140128210416.1FE6B9C6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2951d1e2075a5f0fa9cfd655eb703428d5d8c311
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libusb-compat/Config.in                    |    2 +-
 .../libusb-compat-0.1.3-pkgconfig.patch            |   10 ----------
 package/libusb-compat/libusb-compat.mk             |    2 +-
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/libusb-compat/Config.in b/package/libusb-compat/Config.in
index f6f49ca..076d7b8 100644
--- a/package/libusb-compat/Config.in
+++ b/package/libusb-compat/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  libusb-0.1 compatibility layer for libusb-1.0.
 
-	  http://libusb.sourceforge.net/
+	  http://libusb.info/
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
index db02bc7..a98eb09 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_COMPAT_VERSION_MAJOR = 0.1
-LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).4
+LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).5
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-$(LIBUSB_COMPAT_VERSION_MAJOR)/libusb-compat-$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
