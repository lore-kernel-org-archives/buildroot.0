From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 14 Dec 2010 15:02:13 +0100
Subject: [Buildroot] [PATCH] New package: can-utils
Message-ID: <4D0778E5.9010401@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add SocketCAN utilities.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/Config.in
===================================================================
--- a/package/Config.in	2010-12-14 12:26:51.000000000 +0100
+++ b/package/Config.in	2010-12-14 12:41:56.000000000 +0100
@@ -364,6 +364,7 @@
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/can-utils/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
Index: b/package/can-utils/Config.in
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/can-utils/Config.in	2010-12-14 12:41:05.000000000 +0100
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CAN_UTILS
+	bool "can-utils"
+	help
+	  SocketCAN is a set of open source CAN drivers and a networking stack. This package provides various
+	  tools for this stack.
+
+	  http://developer.berlios.de/projects/socketcan/
+
Index: b/package/can-utils/can-utils.mk
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/can-utils/can-utils.mk	2010-12-14 14:40:07.000000000 +0100
@@ -0,0 +1,13 @@
+#############################################################
+#
+# can-utils
+#
+#############################################################
+
+CAN_UTILS_VERSION = HEAD
+CAN_UTILS_SITE = svn://svn.berlios.de/socketcan/trunk/can-utils
+
+CAN_UTILS_AUTORECONF = YES
+
+$(eval $(call AUTOTARGETS,package,can-utils))
+
