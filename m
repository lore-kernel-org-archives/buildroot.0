From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri,  9 Dec 2011 13:39:36 +0100
Subject: [Buildroot] [PATCH] Add new package libmbus Library for
	communicating with energy metering devices
Message-ID: <1323434376-22948-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in          |    1 +
 package/libmbus/Config.in  |    7 +++++++
 package/libmbus/libmbus.mk |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
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
index 0000000..93666ed
--- /dev/null
+++ b/package/libmbus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBMBUS
+	bool "libmbus"
+	help
+	  libmbus is a library for communicating with energie metering devices
+	  supports TCP and RS232 M-bus gateways.
+	  
+	  http://www.freescada.com/libmbus
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
new file mode 100644
index 0000000..a57595e
--- /dev/null
+++ b/package/libmbus/libmbus.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libmbus
+#
+#############################################################
+LIBMBUS_VERSION:=0.6.1
+LIBMBUS_SOURCE:=libmbus-$(LIBMBUS_VERSION).tar.gz
+LIBMBUS_SITE:=http://www.freescada.com/public-dist/
+LIBMBUS_INSTALL_STAGING=YES
+LIBMBUS_AUTORECONF=YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8-rc3
