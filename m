From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 22:20:31 +0100
Subject: [Buildroot] [git commit] package: add libmbus library
Message-ID: <20120102212140.DA4DC8FE2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43f8bb8c250b2e0fbf9fb73a240c299a60511cc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmbus is an open source M-bus (Meter-Bus) library.

The Meter-Bus is a standard for reading out meter data from electricity
meters, heat meters, gas meters, etc.

[Peter: minor whitespace fixes]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Reviewed-by: Luca Ceresoli<luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libmbus/Config.in  |    8 ++++++++
 package/libmbus/libmbus.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0e51493..eb5bfa9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -343,6 +343,7 @@ source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
+source "package/libmbus/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libmbus/Config.in b/package/libmbus/Config.in
new file mode 100644
index 0000000..1e2a8de
--- /dev/null
+++ b/package/libmbus/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBMBUS
+	bool "libmbus"
+	help
+	  libmbus is a library for communicating with energy metering devices.
+	  It supports TCP and RS232 M-bus gateways.
+	  (M-bus standard: http://www.m-bus.com/)
+
+	  http://www.freescada.com/libmbus
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
new file mode 100644
index 0000000..9abb2bf
--- /dev/null
+++ b/package/libmbus/libmbus.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libmbus
+#
+#############################################################
+
+LIBMBUS_VERSION = 0.6.1
+LIBMBUS_SITE = http://www.freescada.com/public-dist/
+LIBMBUS_INSTALL_STAGING = YES
+
+# Without this the build yields an error:
+#   cannot find input file: `test/Makefile.in'
+LIBMBUS_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS))
