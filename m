From: Bob Liu <lliubbo@gmail.com>
Date: Mon, 28 Feb 2011 16:29:21 +0800
Subject: [Buildroot] [PATCH] add bluetooth utils to package
In-Reply-To: <1298881761-1294-1-git-send-email-lliubbo@gmail.com>
References: <1298881761-1294-1-git-send-email-lliubbo@gmail.com>
Message-ID: <1298881761-1294-2-git-send-email-lliubbo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bluetooth utils often used in embeded system, add it to package.

Signed-off-by: Bob Liu <lliubbo@gmail.com>
---
 package/Config.in                  |    1 +
 package/bluez_utils/Config.in      |    7 +++++++
 package/bluez_utils/bluez_utils.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/bluez_utils/Config.in
 create mode 100644 package/bluez_utils/bluez_utils.mk

diff --git a/package/Config.in b/package/Config.in
index f459c1b..7f1d9ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ menu "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
+source "package/bluez_utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
 endif
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
new file mode 100644
index 0000000..eb6e22d
--- /dev/null
+++ b/package/bluez_utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BLUEZ_UTILS
+	bool "bluez_utils"
+	depends on BR2_PACKAGE_DBUS
+	help
+	  bluez utils
+
+	  http://www.kernel.org/pub/linux/bluetooth
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
new file mode 100644
index 0000000..7b104b0
--- /dev/null
+++ b/package/bluez_utils/bluez_utils.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# bluez_utils
+#
+#############################################################
+BLUEZ_UTILS_VERSION = 4.87
+BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
+BLUEZ_UTILS_SITE = http://www.kernel.org/pub/linux/bluetooth/
+BLUEZ_UTILS_INSTALL_STAGING = YES
+BLUEZ_UTILS_INSTALL_TARGET = YES
+BLUEZ_UTILS_DEPENDENCIES += dbus libglib2
+BLUEZ_UTILS_CONF_OPT = --enable-hidd --enable-test --enable-alsa
+
+$(eval $(call AUTOTARGETS,package,bluez_utils))
-- 
1.6.3.3
