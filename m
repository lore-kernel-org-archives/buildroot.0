From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 22 Jan 2011 20:17:34 +0100
Subject: [Buildroot] [PATCH 2/2] new package libhid
Message-ID: <A17BA6C9FDFD463A81926C4778154B14@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The included patch prevents from linking to libusb on the host.

the package files :
 
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
diff -rupN buildroot-master/package/libhid/Config.in~
buildroot/package/libhid/Config.in~
--- buildroot-master/package/libhid/Config.in~	1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/libhid/Config.in~	2011-01-29 19:27:59.000000000 +0100
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBHID
+	bool "libhid"
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Userspace library for accessing USB HID devices
+	  
+	  http://libhid.alioth.debian.org
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
diff -rupN buildroot-master/package/libhid/libhid.mk~
buildroot/package/libhid/libhid.mk~
--- buildroot-master/package/libhid/libhid.mk~	1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/libhid/libhid.mk~	2011-01-29 23:29:34.000000000 +0100
@@ -0,0 +1,16 @@
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
+#LIBHID_LIBTOOL_PATCH = YES
+LIBHID_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS,package,libhid))
 
