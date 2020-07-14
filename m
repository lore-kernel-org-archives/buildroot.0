From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 Jul 2020 22:24:06 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/libuev: new package
In-Reply-To: <20200714202407.23575-1-ps.report@gmx.net>
References: <20200714202407.23575-1-ps.report@gmx.net>
Message-ID: <20200714202407.23575-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libuev/Config.in   |  6 ++++++
 package/libuev/libuev.hash |  4 ++++
 package/libuev/libuev.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/libuev/Config.in
 create mode 100644 package/libuev/libuev.hash
 create mode 100644 package/libuev/libuev.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 69ef58e72f..b07bb040c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2038,6 +2038,7 @@ F:	package/gstreamer1/gst1-validate/
 F:	package/gstreamer1/gstreamer1-editing-services/
 F:	package/iwd/
 F:	package/libevdev/
+F:	package/libuev/
 F:	package/log4cplus/
 F:	package/postgresql/
 F:	package/python-colorzero/
diff --git a/package/Config.in b/package/Config.in
index 9592920f3a..c9601a01fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1735,6 +1735,7 @@ menu "Networking"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
 	source "package/libtorrent-rasterbar/Config.in"
+	source "package/libuev/Config.in"
 	source "package/libuhttpd/Config.in"
 	source "package/libupnp/Config.in"
 	source "package/libupnp18/Config.in"
diff --git a/package/libuev/Config.in b/package/libuev/Config.in
new file mode 100644
index 0000000000..bb50099cee
--- /dev/null
+++ b/package/libuev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBUEV
+	bool "libuev"
+	help
+	  Simple event loop for Linux.
+
+	  https://github.com/troglobit/libuev
diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
new file mode 100644
index 0000000000..fece0e9b65
--- /dev/null
+++ b/package/libuev/libuev.hash
@@ -0,0 +1,4 @@
+# From https://github.com/troglobit/libuev/releases/download/v2.3.1/libuev-2.3.1.tar.xz.md5
+md5  ec601f69f69477858fa023a75da23793  libuev-2.3.1.tar.xz
+# License files
+sha256  3c2bf3fdd85687242ba6f2b02b6ce5176aba15b5e1a2ccb8b608439197ec4641  LICENSE
diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
new file mode 100644
index 0000000000..c7b73b4221
--- /dev/null
+++ b/package/libuev/libuev.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libuev
+#
+################################################################################
+
+LIBUEV_VERSION = 2.3.1
+LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
+LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
+LIBUEV_LICENSE = MIT
+LIBUEV_LICENSE_FILES = LICENSE
+LIBUEV_INSTALL_STAGING = YES
+LIBUEV_CONF_OPTS = --disable-examples
+
+$(eval $(autotools-package))
-- 
2.27.0
