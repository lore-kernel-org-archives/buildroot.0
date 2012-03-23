From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 23 Mar 2012 01:51:35 +0100
Subject: [Buildroot] [PATCH 2/2] Add bluez package.
In-Reply-To: <1332463895-18574-1-git-send-email-marek.belisko@open-nandra.com>
References: <1332463895-18574-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1332463895-18574-2-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in            |    1 +
 package/libbluez/Config.in   |    8 ++++++++
 package/libbluez/libbluez.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/libbluez/Config.in
 create mode 100644 package/libbluez/libbluez.mk

diff --git a/package/Config.in b/package/Config.in
index ccc9b34..50ef982 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -326,6 +326,7 @@ endmenu
 
 menu "Hardware handling"
 source "package/libaio/Config.in"
+source "package/libbluez/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libftdi/Config.in"
diff --git a/package/libbluez/Config.in b/package/libbluez/Config.in
new file mode 100644
index 0000000..ac2b4b7
--- /dev/null
+++ b/package/libbluez/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBBLUEZ
+	bool "libbluez"
+	select BR2_PACKAGE_DBUS
+	help
+	  BlueZ provides support for the core Bluetooth layers and protocols.
+	  It is flexible, efficient and uses a modular implementation.
+		
+	  http://www.bluez.org
diff --git a/package/libbluez/libbluez.mk b/package/libbluez/libbluez.mk
new file mode 100644
index 0000000..34f22eb
--- /dev/null
+++ b/package/libbluez/libbluez.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libbluez
+#
+#############################################################
+
+LIBBLUEZ_VERSION = 4.99
+LIBBLUEZ_SITE = http://www.kernel.org/pub/linux/bluetooth/
+LIBBLUEZ_SOURCE = bluez-$(LIBBLUEZ_VERSION).tar.gz
+LIBBLUEZ_INSTALL_STAGING = YES
+
+LIBBLUEZ_DEPENDENCIES = dbus
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.5.4
