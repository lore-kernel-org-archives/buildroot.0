From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Thu, 17 Mar 2016 16:06:39 +0100
Subject: [Buildroot] [PATCH 1/2] libdebian-installer: new package
Message-ID: <1458227200-19903-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is a mandatory dependency of cdebootstrap.

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 package/Config.in                                    |  1 +
 package/libdebian-installer/Config.in                | 11 +++++++++++
 package/libdebian-installer/libdebian-installer.hash |  3 +++
 package/libdebian-installer/libdebian-installer.mk   | 19 +++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/libdebian-installer/Config.in
 create mode 100644 package/libdebian-installer/libdebian-installer.hash
 create mode 100644 package/libdebian-installer/libdebian-installer.mk

diff --git a/package/Config.in b/package/Config.in
index 2401867..db4ceab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1208,6 +1208,7 @@ menu "Other"
 	source "package/libcroco/Config.in"
 	source "package/libcrossguid/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdebian-installer/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
 	source "package/libevdev/Config.in"
diff --git a/package/libdebian-installer/Config.in b/package/libdebian-installer/Config.in
new file mode 100644
index 0000000..f3b0ed3
--- /dev/null
+++ b/package/libdebian-installer/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBDEBIAN_INSTALLER
+	bool "libdebian-installer"
+	select BR2_PACKAGE_CHECK
+	help
+	  This library is used by debian-installer to perform common
+	  functions such as logging messages and executing commands.
+	  If you aren't working on debian-installer or building your
+	  own install system based on debian-installer, then you
+	  probably don't need this library.
+
+	  http://debian.org
diff --git a/package/libdebian-installer/libdebian-installer.hash b/package/libdebian-installer/libdebian-installer.hash
new file mode 100644
index 0000000..1a647a8
--- /dev/null
+++ b/package/libdebian-installer/libdebian-installer.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 5bf6c1b88e99164d0411f8434523f0f3b8e7e3902da17c55fee740ab34746ebf libdebian-installer_0.104.tar.xz
+
diff --git a/package/libdebian-installer/libdebian-installer.mk b/package/libdebian-installer/libdebian-installer.mk
new file mode 100644
index 0000000..18330fc
--- /dev/null
+++ b/package/libdebian-installer/libdebian-installer.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libdebian-installer
+#
+################################################################################
+
+
+LIBDEBIAN_INSTALLER_VERSION = 0.104
+LIBDEBIAN_INSTALLER_SOURCE = libdebian-installer_$(LIBDEBIAN_INSTALLER_VERSION).tar.xz
+LIBDEBIAN_INSTALLER_SITE = http://http.debian.net/debian/pool/main/libd/libdebian-installer
+LIBDEBIAN_INSTALLER_LICENSE = GPLv2
+LIBDEBIAN_INSTALLER_LICENSE_FILES = debian/copyright
+LIBDEBIAN_INSTALLER_INSTALL_STAGING = YES
+LIBDEBIAN_INSTALLER_INSTALL_TARGET = YES
+# Provided files are too old.
+LIBDEBIAN_INSTALLER_AUTORECONF = YES
+LIBDEBIAN_INSTALLER_DEPENDENCIES = check host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.1.4
