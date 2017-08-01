From: Dave Bender <codehero@gmail.com>
Date: Tue, 1 Aug 2017 06:27:50 -0400
Subject: [Buildroot] cpprestsdk: new package
Message-ID: <CAETHaKqd_JNhE++wYngS9O0VvWO_eQNyvHDX8Wu2G95JR-MevQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added cpprestsdk library

Signed-off-by: David Bender <codehero@gmail.com>
---
 package/Config.in                  |  1 +
 package/cpprestsdk/Config.in       | 15 +++++++++++++++
 package/cpprestsdk/cpprestsdk.hash |  2 ++
 package/cpprestsdk/cpprestsdk.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/cpprestsdk/Config.in
 create mode 100644 package/cpprestsdk/cpprestsdk.hash
 create mode 100644 package/cpprestsdk/cpprestsdk.mk

diff --git a/package/Config.in b/package/Config.in
index 34cb75238..a61fa741e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1582,6 +1582,7 @@ menu "Networking applications"
  source "package/connman/Config.in"
  source "package/connman-gtk/Config.in"
  source "package/conntrack-tools/Config.in"
+ source "package/cpprestsdk/Config.in"
  source "package/crda/Config.in"
  source "package/ctorrent/Config.in"
  source "package/cups/Config.in"
diff --git a/package/cpprestsdk/Config.in b/package/cpprestsdk/Config.in
new file mode 100644
index 000000000..beb37ad17
--- /dev/null
+++ b/package/cpprestsdk/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CPPRESTSDK
+ bool "cpprestsdk"
+ select BR2_PACKAGE_BOOST
+ select BR2_PACKAGE_BOOST_CHRONO
+ select BR2_PACKAGE_BOOST_FILESYSTEM
+ select BR2_PACKAGE_BOOST_RANDOM
+ select BR2_PACKAGE_BOOST_REGEX
+ select BR2_PACKAGE_BOOST_SYSTEM
+ select BR2_PACKAGE_BOOST_THREAD
+ select BR2_PACKAGE_OPENSSL
+ help
+  The C++ REST SDK is a Microsoft project for cloud-based client-server
+  communication in native code using a modern asynchronous C++ API design.
+
+  https://github.com/Microsoft/cpprestsdk
diff --git a/package/cpprestsdk/cpprestsdk.hash
b/package/cpprestsdk/cpprestsdk.hash
new file mode 100644
index 000000000..edd974496
--- /dev/null
+++ b/package/cpprestsdk/cpprestsdk.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha512 d3e1ee4312d4fd77993637ca0f9108f67d3bedaf124b7edd25c7e1a42d703c2297145bb3f88408d4f72167016ed90e178ee96ecf1d343496fe1a362884c14ac0
cpprestsdk-2.9.1.tar.gz
diff --git a/package/cpprestsdk/cpprestsdk.mk b/package/cpprestsdk/cpprestsdk.mk
new file mode 100644
index 000000000..261cbafeb
--- /dev/null
+++ b/package/cpprestsdk/cpprestsdk.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cpprestsdk
+#
+################################################################################
+
+CPPRESTSDK_VERSION = 2.9.1
+CPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,v$(CPPRESTSDK_VERSION))
+CPPRESTSDK_DEPENDENCIES += openssl boost
+CPPRESTSDK_LICENSE = MIT
+CPPRESTSDK_LICENSE_FILES = license.txt
+
+CPPRESTSDK_SUBDIR = Release
+
+$(eval $(cmake-package))
-- 
2.13.0
