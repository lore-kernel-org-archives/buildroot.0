From: Bob Liu <lliubbo@gmail.com>
Date: Mon, 28 Feb 2011 16:29:20 +0800
Subject: [Buildroot] [PATCH] add inetutils to package
Message-ID: <1298881761-1294-1-git-send-email-lliubbo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bob Liu <lliubbo@gmail.com>
---
 package/Config.in              |    2 +-
 package/inetutils/Config.in    |    6 ++++++
 package/inetutils/inetutils.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 package/inetutils/Config.in
 create mode 100644 package/inetutils/inetutils.mk

diff --git a/package/Config.in b/package/Config.in
index 7f1d9ff..5123aec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,7 +366,6 @@ menu "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
-source "package/bluez_utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
 endif
@@ -383,6 +382,7 @@ source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
+source "package/inetutils/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
diff --git a/package/inetutils/Config.in b/package/inetutils/Config.in
new file mode 100644
index 0000000..ce7933b
--- /dev/null
+++ b/package/inetutils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_INETUTILS
+	bool "inetutils"
+	help
+	  inetutils
+
+	  http://www.gnu.org/software/inetutils/
diff --git a/package/inetutils/inetutils.mk b/package/inetutils/inetutils.mk
new file mode 100644
index 0000000..3d2d95d
--- /dev/null
+++ b/package/inetutils/inetutils.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# inet_utils
+#
+#############################################################
+INETUTILS_VERSION = 1.8
+INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.gz
+INETUTILS_SITE = http://ftp.gnu.org/gnu/inetutils/
+INETUTILS_INSTALL_STAGING = YES
+INETUTILS_INSTALL_TARGET_OPT = SUIDMODE="-m 4775" DESTDIR=$(TARGET_DIR) install
+INETUTILS_CONF_OPT = \
+	--disable-ifconfig
+
+$(eval $(call AUTOTARGETS,package,inetutils))
-- 
1.6.3.3
