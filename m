From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 22 Jan 2011 20:46:54 +0100
Subject: [Buildroot] RESEND [PATCH 2/2] new package libhid
Message-ID: <370CEDEBA78A4F7D970C185C09C5992B@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previous 2/2 patch was wrong so ignore

Here is the corrected one:

This should be correct:

diff -rupN buildroot-master/package/libhid/Config.in
buildroot/package/libhid/Config.in
--- buildroot-master/package/libhid/Config.in	1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/libhid/Config.in	2011-01-29 19:30:49.000000000 +0100
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBHID
+	bool "libhid"
+	depends on BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Userspace library for accessing USB HID devices
+	  
+	  http://libhid.alioth.debian.org
diff -rupN buildroot-master/package/libhid/libhid-0.2.16.patch
buildroot/package/libhid/libhid-0.2.16.patch
--- buildroot-master/package/libhid/libhid-0.2.16.patch	1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/libhid/libhid-0.2.16.patch	2011-01-23
19:48:38.000000000 +0100
@@ -0,0 +1,22 @@
+diff -rupN libhid-0.2.16org/configure libhid-0.2.16/configure
+--- libhid-0.2.16org/configure	2007-04-26 02:25:25.000000000 +0200
++++ libhid-0.2.16/configure	2011-01-23 18:13:40.000000000 +0100
+@@ -4847,7 +4847,7 @@ done
+ 
+ 
+     LIBUSB_CFLAGS="`libusb-config --cflags`"
+-    LIBUSB_LIBS="`libusb-config --libs`"
++    LIBUSB_LIBS="-lusb"
+ 
+ 
+ 
+@@ -23050,8 +23050,7 @@ echo "$as_me: doxygen disabled by config
+     CPPFLAGS=$(echo  $CPPFLAGS)
+     CFLAGS=$(echo $OS_CFLAGS $LIBUSB_CFLAGS $CFLAGS)
+     CXXFLAGS=$(echo  $CXXFLAGS)
+-    LDFLAGS=$(echo $OS_LDFLAGS $LIBUSB_LIBS
+- $LDFLAGS)
++    LDFLAGS=$(echo $OS_LDFLAGS $LIBUSB_LIBS  $LDFLAGS)
+ 
+ 
+ 
diff -rupN buildroot-master/package/libhid/libhid.mk
buildroot/package/libhid/libhid.mk
--- buildroot-master/package/libhid/libhid.mk	1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/libhid/libhid.mk	2011-01-30 00:10:11.000000000 +0100
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libhid
+#
+#############################################################
+LIBHID_VERSION = 0.2.16
+LIBHID_SOURCE = libhid-$(LIBHID_VERSION).tar.gz
+LIBHID_SITE = http://alioth.debian.org/frs/download.php/1958
+LIBHID_DEPENDENCIES = libusb-compat libusb
+LIBHID_INSTALL_STAGING = YES
+LIBHID_INSTALL_TARGET = YES
+LIBHID_CONF_OPT = --disable-swig  --without-doxygen
--disable-package-config
+
+
+$(eval $(call AUTOTARGETS,package,libhid))

 
