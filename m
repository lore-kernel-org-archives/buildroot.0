From: Chih-Min Chao <cmchao@gmail.com>
Date: Tue, 21 Sep 2010 00:41:26 +0800
Subject: [Buildroot] [PATCH RESEND 2/2] bluez : new package
In-Reply-To: <1285000886-8353-1-git-send-email-cmchao@gmail.com>
References: <1285000886-8353-1-git-send-email-cmchao@gmail.com>
Message-ID: <1285000886-8353-3-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/Config.in       |    1 +
 package/bluez/Config.in |   14 ++++++++++++++
 package/bluez/bluez.mk  |   16 ++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/bluez/Config.in
 create mode 100644 package/bluez/bluez.mk

diff --git a/package/Config.in b/package/Config.in
index f9a0405..7960ef1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -350,6 +350,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
 endif
 source "package/bind/Config.in"
+source "package/bluez/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/ctorrent/Config.in"
diff --git a/package/bluez/Config.in b/package/bluez/Config.in
new file mode 100644
index 0000000..7ee365a
--- /dev/null
+++ b/package/bluez/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_BLUEZ
+	bool "bluez"
+	depends on BR2_PACKAGE_DBUS
+	depends on BR2_PACKAGE_LIBGLIB2
+	help
+	  BlueZ provides support for the core Bluetooth layers and protocols.
+	  It is flexible, efficient and uses a modular implementation.
+
+	  http://www.bluez.org/
+
+comment "bluez requires dbus package
+	depends on !BR2_PACKAGE_DBUS
+comment "bluez requires libglib2 package
+	depends on !BR2_PACKAGE_LIBGLIB2
diff --git a/package/bluez/bluez.mk b/package/bluez/bluez.mk
new file mode 100644
index 0000000..4f833a8
--- /dev/null
+++ b/package/bluez/bluez.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# Bluez
+#
+#############################################################
+BLUEZ_VERSION:=4.71
+BLUEZ_SOURCE:=bluez-$(BLUEZ_VERSION).tar.gz
+BLUEZ_SITE:=http://www.kernel.org/pub/linux/bluetooth
+BLUEZ_LIBTOOL_PATCH:=NO
+BLUEZ_INSTALL_STAGING:=NO
+BLUEZ_INSTALL_TARGET:=YES
+BLUEZ_DEPENDENCIES:= dbus libglib2
+
+BLUEZ_CONF_OPT:= --enable-tools --disable-static --enable-shared
+
+$(eval $(call AUTOTARGETS,package,bluez))
-- 
1.7.0.4
