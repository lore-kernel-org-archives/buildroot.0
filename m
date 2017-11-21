From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 20 Nov 2017 18:02:58 -0800
Subject: [Buildroot] [PATCH 1/1] gconf: new package
Message-ID: <20171121020258.31523-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/gconf/Config.in  | 10 ++++++++++
 package/gconf/gconf.hash |  4 ++++
 package/gconf/gconf.mk   | 10 ++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/gconf/Config.in
 create mode 100644 package/gconf/gconf.hash
 create mode 100644 package/gconf/gconf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bb81a19883..0131f21a1f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -794,6 +794,7 @@ F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/gconf/
 F:	package/python-websockets/
 
 N:	Johan Derycke <johanderycke@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..b28e656907 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1433,6 +1433,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
+	source "package/gconf/Config.in"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
diff --git a/package/gconf/Config.in b/package/gconf/Config.in
new file mode 100644
index 0000000000..364caea1ca
--- /dev/null
+++ b/package/gconf/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GCONF
+	bool "gconf"
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	help
+	  GConf was a system used by the GNOME desktop environment for storing
+	  configuration settings for the desktop and applications. It is similar
+	  to the Windows Registry.
diff --git a/package/gconf/gconf.hash b/package/gconf/gconf.hash
new file mode 100644
index 0000000000..24d0cf9b17
--- /dev/null
+++ b/package/gconf/gconf.hash
@@ -0,0 +1,4 @@
+# http://ftp.acc.umu.se/pub/gnome/sources/GConf/3.2/GConf-3.2.6.sha256sum
+sha256 1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
+# License files, locally calculated
+sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
new file mode 100644
index 0000000000..5f33290d7a
--- /dev/null
+++ b/package/gconf/gconf.mk
@@ -0,0 +1,10 @@
+GCONF_VERSION = 3.2.6
+GCONF_SOURCE = GConf-${GCONF_VERSION}.tar.xz
+GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
+GCONF_CONF_OPTS = --disable-orbit --disable-nls --disable-dependency-tracking
+GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2
+
+GCONF_LICENSE = GPL-2.0
+GCONF_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.15.0
