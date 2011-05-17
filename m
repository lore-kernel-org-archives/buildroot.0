From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Tue, 17 May 2011 21:56:38 +0200
Subject: [Buildroot] [buildroot] Add libiqrf package.
Message-ID: <1305662198-23040-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libiqrf is library written in C which simplify access to
iqrf usb devices (http://iqrf.org).

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in          |    1 +
 package/libiqrf/Config.in  |   11 +++++++++++
 package/libiqrf/libiqrf.mk |   15 +++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/libiqrf/Config.in
 create mode 100644 package/libiqrf/libiqrf.mk

diff --git a/package/Config.in b/package/Config.in
index 5e48ab7..819be1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -301,6 +301,7 @@ source "package/libhid/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/python-serial/Config.in"
+source "package/libiqrf/Config.in"
 endmenu
 
 if BROKEN
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
new file mode 100644
index 0000000..a9e5a52
--- /dev/null
+++ b/package/libiqrf/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBIQRF
+        bool "libiqrf"
+        depends on BR2_PACKAGE_LIBUSB
+        help
+          Libiqrf is a C library for reading and writing a
+          data do iqrf usb devices (http://iqrf.orf)
+
+          https://github.com/nandra/libiqrf
+
+
+
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
new file mode 100644
index 0000000..673ef3a
--- /dev/null
+++ b/package/libiqrf/libiqrf.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libiqrf library
+#
+#############################################################
+
+LIBIQRF_VERSION = v0.1.0
+LIBIQRF_SITE = git://github.com/nandra/libiqrf.git
+LIBIQRF_INSTALL_STAGING = YES
+LIBIQRF_INSTALL_TARGET = YES
+
+LIBIQRF_DEPENDENCIES = libusb
+
+$(eval $(call AUTOTARGETS,package,libiqrf))
+
-- 
1.7.4.1
