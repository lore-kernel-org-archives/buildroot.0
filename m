From: David Bachelart <david.bachelart@bbright.com>
Date: Fri, 11 Jul 2014 15:56:00 +0200
Subject: [Buildroot] [PATCH 1/1] python-dbus: new package
In-Reply-To: <1405086960-14881-1-git-send-email-david.bachelart@bbright.com>
References: <1405086960-14881-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1405086960-14881-2-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-dbus is a binding for libdbus, the reference implementation of
D-Bus

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in                  |    1 +
 package/python-dbus/Config.in      |   17 +++++++++++++++++
 package/python-dbus/python-dbus.mk |   16 ++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/python-dbus/Config.in
 create mode 100644 package/python-dbus/python-dbus.mk

diff --git a/package/Config.in b/package/Config.in
index c626968..c979560 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -459,6 +459,7 @@ menu "external python modules"
 	source "package/python-bottle/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-dbus/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-id3/Config.in"
diff --git a/package/python-dbus/Config.in b/package/python-dbus/Config.in
new file mode 100644
index 0000000..b463514
--- /dev/null
+++ b/package/python-dbus/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_DBUS
+	bool "python-dbus"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+     D-Bus is a message bus, used for sending messages between 
+     applications. Conceptually, it fits somewhere in between raw 
+     sockets and CORBA in terms of complexity.
+
+     This package provides a Python interface to D-Bus.
+
+     See the dbus description for more information about D-Bus in 
+     general.
+ 
+     http://www.freedesktop.org/wiki/Software/DBusBindings#Python
diff --git a/package/python-dbus/python-dbus.mk b/package/python-dbus/python-dbus.mk
new file mode 100644
index 0000000..c6aa58a
--- /dev/null
+++ b/package/python-dbus/python-dbus.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-dbus
+#
+################################################################################
+
+PYTHON_DBUS_VERSION = 1.2.0
+PYTHON_DBUS_SOURCE = dbus-python-$(PYTHON_DBUS_VERSION).tar.gz
+PYTHON_DBUS_SITE = http://dbus.freedesktop.org/releases/dbus-python/
+
+PYTHON_DBUS_LICENSE = 
+PYTHON_DBUS_LICENSE_FILES = COPYING
+
+PYTHON_DBUS_DEPENDENCIES = dbus-glib
+
+$(eval $(autotools-package))
-- 
1.7.10.4
