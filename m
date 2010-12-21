From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Tue, 21 Dec 2010 14:15:54 +0100
Subject: [Buildroot] [PATCH] Add libmodbus to buildroot.
Message-ID: <1292937354-20879-1-git-send-email-marek.belisko@open-nandra.com>
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
 package/libmodbus/libmodbus.mk |    8 ++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/libmodbus/Config.in
 create mode 100644 package/libmodbus/libmodbus.mk

diff --git a/package/Config.in b/package/Config.in
index 80aca2a..b29113c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
 source "package/xfsprogs/Config.in"
+source "package/libmodbus/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
new file mode 100644
index 0000000..99e8952
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
+	  http://http://libmodbus.org
+
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
new file mode 100644
index 0000000..eb03c84
--- /dev/null
+++ b/package/libmodbus/libmodbus.mk
@@ -0,0 +1,8 @@
+############################################################
+# libmodbus
+#############################################################
+LIBMODBUS_VERSION:=2.0.3
+LIBMODBUS_SOURCE:=libmodbus-$(LIBMODBUS_VERSION).tar.gz
+LIBMODBUS_SITE:=http://github.com/downloads/stephane/libmodbus/$(LIBMODBUS_SOURCE)
+
+$(eval $(call AUTOTARGETS,package,libmodbus))
-- 
1.7.1
