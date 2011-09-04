From: Darius Augulis <augulis.darius@gmail.com>
Date: Sun, 04 Sep 2011 15:08:35 +0300
Subject: [Buildroot] [PATCH 2/3] new package: transmission
Message-ID: <20110904120835.3974.93412.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for new bittorrent client - transmission.
Currently only cli and web interfaces (no GUI) are
supported in buildroot.

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
---
 package/Config.in                    |    1 +
 package/transmission/Config.in       |    4 ++++
 package/transmission/transmission.mk |   19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/transmission/Config.in
 create mode 100644 package/transmission/transmission.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..c058f52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ source "package/bridge-utils/Config.in"
 source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/ctorrent/Config.in"
+source "package/transmission/Config.in"
 source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
new file mode 100644
index 0000000..30ceef4
--- /dev/null
+++ b/package/transmission/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_TRANSMISSION
+	bool "transmission"
+	help
+	  Bittorrent client
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
new file mode 100644
index 0000000..488cf07
--- /dev/null
+++ b/package/transmission/transmission.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# transmission
+#
+#############################################################
+TRANSMISSION_VERSION = 2.33
+TRANSMISSION_SOURCE = transmission-${TRANSMISSION_VERSION}.tar.bz2
+TRANSMISSION_SITE = http://download.m0k.org/transmission/files/
+
+TRANSMISSION_CONF_OPT = \
+	--disable-gtk \
+	--disable-libappindicator \
+	--disable-libcanberra \
+	--disable-libnotify \
+	--enable-lightweight \
+	--enable-cli \
+	--enable-daemon
+
+$(eval $(call AUTOTARGETS,package,transmission))
