From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 10 Dec 2011 01:48:00 +0100
Subject: [Buildroot] [PATCH 1/1] New Package libmbus library for
	communicating with M-bus devices.(rework)
Message-ID: <1323478080-2915-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in          |    1 +
 package/libmbus/Config.in  |    8 ++++++++
 package/libmbus/libmbus.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libmbus/Config.in
 create mode 100644 package/libmbus/libmbus.mk

diff --git a/package/Config.in b/package/Config.in
index e949649..8f0b5ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -330,6 +330,7 @@ source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
+source "package/libmbus/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libmbus/Config.in b/package/libmbus/Config.in
new file mode 100644
index 0000000..0f71ec5
--- /dev/null
+++ b/package/libmbus/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBMBUS
+	bool "libmbus"
+	help
+	  libmbus is a library for communicating with energy metering devices.
+	  It supports TCP and RS232 M-bus gateways.
+	  ( M-bus standard : http://www.m-bus.com/ )
+	  
+	  http://www.freescada.com/libmbus
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
new file mode 100644
index 0000000..d9915ea
--- /dev/null
+++ b/package/libmbus/libmbus.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libmbus
+#
+#############################################################
+LIBMBUS_VERSION:=0.6.1
+LIBMBUS_SOURCE:=libmbus-$(LIBMBUS_VERSION).tar.gz
+LIBMBUS_SITE:=http://www.freescada.com/public-dist/
+LIBMBUS_INSTALL_STAGING=YES
+
+# Without this the build yields an error:
+#   cannot find input file: `test/Makefile.in'
+LIBMBUS_AUTORECONF=YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8
