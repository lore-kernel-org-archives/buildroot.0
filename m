From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 13:39:58 +0200
Subject: [Buildroot] [git commit] Add libmodbus package
Message-ID: <20111028122943.1B4C28EDFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b3526f56af35ae1db41b3620513f7065dcfc8d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/libmodbus/Config.in    |    8 ++++++++
 package/libmodbus/libmodbus.mk |   11 +++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c6ca350..33dd59e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -333,6 +333,7 @@ source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
 source "package/libmnl/Config.in"
+source "package/libmodbus/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
new file mode 100644
index 0000000..ccf1190
--- /dev/null
+++ b/package/libmodbus/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBMODBUS
+	bool "libmodbus"
+	help
+	  libmodbus is a free software library to send/receive data according
+	  to the Modbus protocol. This library is written in C and supports
+	  RTU (serial) and TCP (Ethernet) communications.
+
+	  http://libmodbus.org
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
new file mode 100644
index 0000000..ab134fd
--- /dev/null
+++ b/package/libmodbus/libmodbus.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libmodbus
+#
+#############################################################
+LIBMODBUS_VERSION = 3.0.1
+LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
+LIBMODBUS_SOURCE = libmodbus-$(LIBMODBUS_VERSION).tar.gz
+LIBMODBUS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
