From: Kevin JOLY <kevin.joly@sensefly.com>
Date: Mon, 13 Mar 2017 08:26:20 +0100
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
Message-ID: <1489389980-8677-1-git-send-email-kevin.joly@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for libgphoto2 core library designed to allow access to digital camera.

Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/libgphoto2/Config.in       | 11 +++++++++++
 package/libgphoto2/libgphoto2.hash |  6 ++++++
 package/libgphoto2/libgphoto2.mk   | 15 +++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/libgphoto2/Config.in
 create mode 100644 package/libgphoto2/libgphoto2.hash
 create mode 100644 package/libgphoto2/libgphoto2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 70a5428..7ad55b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -935,6 +935,9 @@ F:	package/cpuload/
 F:	package/bwm-ng/
 F:	package/ramsmp/
 
+N:	Kevin Joly <kevin.joly@sensefly.com>
+F:	package/libgphoto2
+
 N:	Laurent Cans <laurent.cans@gmail.com>
 F:	package/aircrack-ng/
 
diff --git a/package/Config.in b/package/Config.in
index 85e4dee..96e03f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
diff --git a/package/libgphoto2/Config.in b/package/libgphoto2/Config.in
new file mode 100644
index 0000000..a69231d
--- /dev/null
+++ b/package/libgphoto2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBGPHOTO2
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_LIBXML2
+	bool "libgphoto2"
+	help
+	  libgphoto2 is the core library designed to allow access to digital
+	  camera by external programs.
+
+	  http://gphoto.org/
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
new file mode 100644
index 0000000..2e659ab
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.hash
@@ -0,0 +1,6 @@
+# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.12/
+md5 a5999acc204c31515a6ec8e517d2cd91 libgphoto2-2.5.12.tar.bz2
+sha1 4ded403b87d46ad49ba88b22b9410789ed3cef10 libgphoto2-2.5.12.tar.bz2
+
+# Locally calculated hash
+sha256 b9bb28990fde45ac385e4851a07dbad2e1250404b535b0a3a3b898bb431e4e2e	libgphoto2-2.5.12.tar.bz2
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
new file mode 100644
index 0000000..72996d4
--- /dev/null
+++ b/package/libgphoto2/libgphoto2.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libgphoto2
+#
+################################################################################
+
+LIBGPHOTO2_VERSION = 2.5.12
+LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
+LIBGPHOTO2_SITE = https://sourceforge.net/projects/gphoto/files/libgphoto/$(LIBGPHOTO2_VERSION)
+LIBGPHOTO2_INSTALL_STAGING = YES
+LIBGPHOTO2_DEPENDENCIES = libxml2 libusb libusb-compat libtool host-pkgconf
+LIBGPHOTO2_LICENSE = LGPLv2.1+
+LIBGPHOTO2_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.7.4
