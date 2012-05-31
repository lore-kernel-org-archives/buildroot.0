From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:32:59 -0000
Subject: [Buildroot] [git commit] libnfc: new package
Message-ID: <20120531113256.3603996E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b35574bc097ad8c364c9a09c3095d22b1392b7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/libnfc/Config.in |    8 ++++++++
 package/libnfc/libnfc.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..bbb2cd5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -360,6 +360,7 @@ source "package/tslib/Config.in"
 source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
+source "package/libnfc/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
new file mode 100644
index 0000000..42418e0
--- /dev/null
+++ b/package/libnfc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBNFC
+	bool "libnfc"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Public platform independent Near Field Communication (NFC) library.
+
+	  http://www.libnfc.org/
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
new file mode 100644
index 0000000..f1028b1
--- /dev/null
+++ b/package/libnfc/libnfc.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# libnfc
+#
+#############################################################
+LIBNFC_VERSION = 1.5.1
+LIBNFC_SITE = http://libnfc.googlecode.com/files/
+LIBNFC_SOURCE = libnfc-$(LIBNFC_VERSION).tar.gz
+LIBNFC_INSTALL_STAGING = YES
+
+LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
+
+# N.B. The acr122 driver requires pcsc-lite.
+LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
+
+$(eval $(call AUTOTARGETS))
