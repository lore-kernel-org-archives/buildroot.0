From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Thu, 23 Dec 2010 13:40:38 +0100
Subject: [Buildroot] [PATCH v2] Add libmodbus to buildroot.
In-Reply-To: <1293108038-24759-1-git-send-email-marek.belisko@open-nandra.com>
References: <1293108038-24759-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1293108038-24759-2-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following patch add compilation of libmodbus use for communication
over modbus protocol.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in              |    1 +
 package/libmodbus/Config.in    |    9 +++++++++
 package/libmodbus/libmodbus.mk |    9 +++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libmodbus/Config.in
 create mode 100644 package/libmodbus/libmodbus.mk

diff --git a/package/Config.in b/package/Config.in
index 80aca2a..19c3e49 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -307,6 +307,7 @@ source "package/libdnet/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
+source "package/libmodbus/Config.in"
 source "package/neon/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
new file mode 100644
index 0000000..df90cee
--- /dev/null
+++ b/package/libmodbus/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBMODBUS
+	bool "libmodbus"
+	help
+	  libmodbus is a free software library to send/receive data with
+	  a device which respects the Modbus protocol. This library can
+	  use a serial port or an Ethernet connection.
+
+	  http://libmodbus.org
+
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
new file mode 100644
index 0000000..5ca88f0
--- /dev/null
+++ b/package/libmodbus/libmodbus.mk
@@ -0,0 +1,9 @@
+############################################################
+# libmodbus
+#############################################################
+LIBMODBUS_VERSION:=2.0.3
+LIBMODBUS_SOURCE:=libmodbus-$(LIBMODBUS_VERSION).tar.gz
+LIBMODBUS_SITE:=http://github.com/downloads/stephane/libmodbus/$(LIBMODBUS_SOURCE)
+LIBMODBUS_INSTALL_STAGING=YES
+
+$(eval $(call AUTOTARGETS,package,libmodbus))
-- 
1.7.1
