From: Kevin JOLY <kevin.joly@sensefly.com>
Date: Wed, 8 Mar 2017 14:38:06 +0100
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
Message-ID: <1488980286-19036-1-git-send-email-kevin.joly@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for libgphoto2 core library designed to allow access to digital camera.

Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
---
 package/Config.in                  |  1 +
 package/libgphoto2/Config.in       | 10 ++++++++++
 package/libgphoto2/libgphoto2.hash |  3 +++
 package/libgphoto2/libgphoto2.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/libgphoto2/Config.in
 create mode 100644 package/libgphoto2/libgphoto2.hash
 create mode 100644 package/libgphoto2/libgphoto2.mk

diff --git a/package/Config.in b/package/Config.in
index 9eb6a22..69430c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,6 +1073,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
diff --git a/package/libgphoto2/Config.in b/package/libgphoto2/Config.in
new file mode 100644
index 0000000..ba1d535
--- /dev/null
+++ b/package/libgphoto2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBGPHOTO2
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_LIBXML2
+	bool "libgphoto2"
+	help
+	  libgphoto2 is the core library designed to allow access to digital camera by external programs.
+
+	  http://gphoto.org/
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
new file mode 100644
index 0000000..25de0bf
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.hash
@@ -0,0 +1,3 @@
+# Hashes from: https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.12/
+sha1	4e1208a8a66d679b8b619b05915dbb0e684c5518	libgphoto2-2.5.12.tar.gz
+md5	b3b5d36e583fc96eed0594dc414d70c9		libgphoto2-2.5.12.tar.gz
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
new file mode 100644
index 0000000..fc5be1b
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libgphoto2
+#
+################################################################################
+
+LIBGPHOTO2_VERSION = 2.5.12
+LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.gz
+LIBGPHOTO2_SITE = https://sourceforge.net/projects/gphoto/files/libgphoto/$(LIBGPHOTO2_VERSION)
+LIBGPHOTO2_INSTALL_STAGING = YES
+LIBGPHOTO2_INSTALL_TARGET = YES
+LIBGPHOTO2_DEPENDENCIES = libxml2 libusb libusb-compat libtool host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.7.4
