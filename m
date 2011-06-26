From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jun 2011 00:48:13 +0200
Subject: [Buildroot] [git commit] package: Add libiqrf package
Message-ID: <20110626224854.8015985AA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=24d498dadf35db72a1a8d173c071def9b0c66361
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libiqrf is library written in C which implement specific iqrf
protocol to communicate with iqrf usb devices (http://iqrf.org).

[Peter: select libusb, fix Config.in indentation]
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libiqrf/Config.in  |   10 ++++++++++
 package/libiqrf/libiqrf.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/libiqrf/Config.in
 create mode 100644 package/libiqrf/libiqrf.mk

diff --git a/package/Config.in b/package/Config.in
index 85d50ec..8f1f030 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -299,6 +299,7 @@ source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libhid/Config.in"
+source "package/libiqrf/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
new file mode 100644
index 0000000..aa25010
--- /dev/null
+++ b/package/libiqrf/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBIQRF
+	bool "libiqrf"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  This library implement specific protocol
+	  which is used for communicating with iqrf devices
+	  (http://iqrf.org) over usb. For usb access is used
+	  libusb library.
+
+	  https://github.com/nandra/libiqrf
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
1.7.3.4
