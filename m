From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:33 -0000
Subject: [Buildroot] [git commit] package/libuev: new package
Message-ID: <20200902161634.6D60585EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a7bc8decdb913ca263ac54fc963d84bdb0b49dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libuev/Config.in   |  6 ++++++
 package/libuev/libuev.hash |  4 ++++
 package/libuev/libuev.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a161c8036..516e259831 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2054,6 +2054,7 @@ F:	package/gstreamer1/gst1-validate/
 F:	package/gstreamer1/gstreamer1-editing-services/
 F:	package/iwd/
 F:	package/libevdev/
+F:	package/libuev/
 F:	package/log4cplus/
 F:	package/postgresql/
 F:	package/python-colorzero/
diff --git a/package/Config.in b/package/Config.in
index f122983724..6bd2699354 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1738,6 +1738,7 @@ menu "Networking"
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
