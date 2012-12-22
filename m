From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 23 Dec 2012 01:51:49 +0200
Subject: [Buildroot] [PATCH] new package: libpciaccess
Message-ID: <1356220309-22847-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                    |    1 +
 package/libpciaccess/Config.in       |    6 ++++++
 package/libpciaccess/libpciaccess.mk |   12 ++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libpciaccess/Config.in
 create mode 100644 package/libpciaccess/libpciaccess.mk

diff --git a/package/Config.in b/package/Config.in
index 66445ff..d5e94db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -431,6 +431,7 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libnfc/Config.in"
 source "package/libnfc-llcp/Config.in"
+source "package/libpciaccess/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libpciaccess/Config.in b/package/libpciaccess/Config.in
new file mode 100644
index 0000000..ce5cbfc
--- /dev/null
+++ b/package/libpciaccess/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBPCIACCESS
+	bool "libpciaccess"
+	help
+	  Library providing generic access to the PCI bus and devices
+
+	  http://cgit.freedesktop.org/xorg/lib/libpciaccess
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
new file mode 100644
index 0000000..901c058
--- /dev/null
+++ b/package/libpciaccess/libpciaccess.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libpciaccess
+#
+#############################################################
+LIBPCIACCESS_VERSION = 0.13.1
+LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.gz
+LIBPCIACCESS_SITE = http://cgit.freedesktop.org/xorg/lib/libpciaccess/snapshot
+LIBPCIACCESS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
+
-- 
1.7.7.6
