From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Wed, 18 May 2011 18:08:27 +0200
Subject: [Buildroot] [buildroot v2] Add libiqrf package.
Message-ID: <1305734907-2692-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libiqrf is library written in C which implement specific iqrf
protocol to communicate with iqrf usb devices (http://iqrf.org).

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in          |    1 +
 package/libiqrf/Config.in  |   13 +++++++++++++
 package/libiqrf/libiqrf.mk |   14 ++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/libiqrf/Config.in
 create mode 100644 package/libiqrf/libiqrf.mk

diff --git a/package/Config.in b/package/Config.in
index 5e48ab7..d5039b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -298,6 +298,7 @@ source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libhid/Config.in"
+source "package/libiqrf/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
new file mode 100644
index 0000000..a95c4d9
--- /dev/null
+++ b/package/libiqrf/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBIQRF
+        bool "libiqrf"
+        depends on BR2_PACKAGE_LIBUSB
+        help
+	  This library implement specific protocol 
+	  which is used for communicating with iqrf devices
+	  (http://iqrf.org) over usb. For usb access is used
+	  libusb library. 
+
+	  https://github.com/nandra/libiqrf
+
+
+
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
new file mode 100644
index 0000000..e3c4bb1
--- /dev/null
+++ b/package/libiqrf/libiqrf.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libiqrf library
+#
+#############################################################
+
+LIBIQRF_VERSION = v0.1.0
+LIBIQRF_SITE = git://github.com/nandra/libiqrf.git
+LIBIQRF_INSTALL_STAGING = YES
+
+LIBIQRF_DEPENDENCIES = libusb
+
+$(eval $(call AUTOTARGETS,package,libiqrf))
+
-- 
1.7.4.1
