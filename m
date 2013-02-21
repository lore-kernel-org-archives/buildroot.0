From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 20:44:29 +0200
Subject: [Buildroot] [PATCH] new package: notification-daemon
Message-ID: <1361472269-23454-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

notification-daemon

notification-daemon is the server implementation of the freedesktop.org
desktop notification specification.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                                  |    1 +
 package/notification-daemon/Config.in              |   18 ++++++++++++++++++
 package/notification-daemon/notification-daemon.mk |   18 ++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/notification-daemon/Config.in
 create mode 100644 package/notification-daemon/notification-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 0a3d2c6..b2b580b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -173,6 +173,7 @@ source "package/gob2/Config.in"
 source "package/gtkperf/Config.in"
 source "package/leafpad/Config.in"
 source "package/midori/Config.in"
+source "package/notification-daemon/Config.in"
 source "package/pcmanfm/Config.in"
 source "package/rdesktop/Config.in"
 source "package/sylpheed/Config.in"
diff --git a/package/notification-daemon/Config.in b/package/notification-daemon/Config.in
new file mode 100644
index 0000000..65d6aba
--- /dev/null
+++ b/package/notification-daemon/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_NETWORK_NOTIFICATION_DAEMON
+	bool "notification-daemon"
+	depends on BR2_PACKAGE_LIBGLIB
+	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_GCONF
+	depends on BR2_PACKAGE_DBUS_GLIB
+	depends on BR2_PACKAGE_DBUS
+	depends on BR2_PACKAGE_LIBCANBERRA
+	depends on BR2_PACKAGE_LIBNOTIFY
+	depends on BR2_PACKAGE_LIBX11
+	depends on BR2_PACKAGE_LIBWNCK
+	depends on BR2_PACKAGE_XLIB_LIBX11
+	help
+	  notification-daemon is the server implementation of the
+	  freedesktop.org desktop notification specification.
+
+	  http://git.gnome.org/browse/notification-daemon
+
diff --git a/package/notification-daemon/notification-daemon.mk b/package/notification-daemon/notification-daemon.mk
new file mode 100644
index 0000000..c971fc2
--- /dev/null
+++ b/package/notification-daemon/notification-daemon.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# notification-daemon
+#
+#############################################################
+
+NOTIFICATION_DAEMON_MAJOR_VERSION = 0.5
+NOTIFICATION_DAEMON_MINOR_VERSION = 0
+NOTIFICATION_DAEMON_VERSION = $(NOTIFICATION_DAEMON_MAJOR_VERSION).$(NOTIFICATION_DAEMON_MINOR_VERSION)
+NOTIFICATION_DAEMON_SOURCE = notification-daemon-$(NOTIFICATION_DAEMON_VERSION).tar.bz2
+NOTIFICATION_DAEMON_SITE = http://ftp.acc.umu.se/pub/gnome/sources/notification-daemon/$(NOTIFICATION_DAEMON_VERSION)
+NOTIFICATION_DAEMON_DEPENDENCIES = libglib2 libgtk2 gconf dbus-glib dbus \
+				   libcanberra libnotify libwnck xlib_libX11
+NOTIFICATION_DAEMON_CONF_OPT += --disable-more-warnings
+
+$(eval $(autotools-package))
+
+
-- 
1.7.7.6
