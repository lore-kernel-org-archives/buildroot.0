From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 11 Dec 2011 00:23:31 +0100
Subject: [Buildroot] [PATCH 1/1] New package libmbus library for
	communicating with M-bus energy metering devices.
Message-ID: <1323559411-1383-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


libmbus is an open source M-bus (Meter-Bus) library.
The Meter-Bus is a standard for reading out meter data from electricity meters, heat meters, gas meters, etc.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in          |    1 +
 package/libmbus/Config.in  |    8 ++++++++
 package/libmbus/libmbus.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/libmbus/Config.in
 create mode 100644 package/libmbus/libmbus.mk

diff --git a/package/Config.in b/package/Config.in
index eb93b1c..9e9027d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -333,6 +333,7 @@ source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
+source "package/libmbus/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libmbus/Config.in b/package/libmbus/Config.in
new file mode 100644
index 0000000..f545117
--- /dev/null
+++ b/package/libmbus/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBMBUS
+	bool "libmbus"
+	help
+	  libmbus is a library for communicating with energy metering devices.
+	  It supports TCP and RS232 M-bus gateways.
+	  (M-bus standard : http://www.m-bus.com/)
+	  
+	  http://www.freescada.com/libmbus
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
new file mode 100644
index 0000000..a6d31da
--- /dev/null
+++ b/package/libmbus/libmbus.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libmbus
+#
+#############################################################
+LIBMBUS_VERSION=0.6.1
+LIBMBUS_SITE=http://www.freescada.com/public-dist/
+LIBMBUS_INSTALL_STAGING=YES
+
+# Without this the build yields an error:
+#   cannot find input file: `test/Makefile.in'
+LIBMBUS_AUTORECONF=YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8
