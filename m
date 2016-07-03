From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 12:30:19 +0200
Subject: [Buildroot] [git commit] libminiupnpc: New package
Message-ID: <20160703104237.2AAC781E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae9e43d2facb2ea5441c51891b9277991fc75ebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |  1 +
 package/libminiupnpc/Config.in         | 20 ++++++++++++++++++++
 package/libminiupnpc/libminiupnpc.hash |  2 ++
 package/libminiupnpc/libminiupnpc.mk   | 14 ++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3fddf8e..73bf32f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1173,6 +1173,7 @@ menu "Networking"
 	source "package/libmbus/Config.in"
 	source "package/libmemcached/Config.in"
 	source "package/libmicrohttpd/Config.in"
+	source "package/libminiupnpc/Config.in"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
diff --git a/package/libminiupnpc/Config.in b/package/libminiupnpc/Config.in
new file mode 100644
index 0000000..c241707
--- /dev/null
+++ b/package/libminiupnpc/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBMINIUPNPC
+	bool "libminiupnpc"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_STATIC_LIBS
+	help
+	  The UPnP protocol is supported by most home adsl/cable routers
+	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project is
+	  to bring a free software solution to support the "Internet
+	  Gateway Device" part of the protocol.
+
+	  Miniupnpc aims at the simplest library possible, with the
+	  smallest footprint and no dependencies to other libraries such
+	  as XML parsers or HTTP implementations. All the code is pure
+	  ANSI C.
+
+	  http://miniupnp.free.fr
+
+comment "libminiupnpc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_BINFMT_FLAT
diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
new file mode 100644
index 0000000..985d69d
--- /dev/null
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d434ceb8986efbe199c5ca53f90ed53eab290b1e6d0530b717eb6fa49d61f93b  miniupnpc-2.0.tar.gz
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
new file mode 100644
index 0000000..0eb7cf6
--- /dev/null
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libminiupnpc
+#
+################################################################################
+
+LIBMINIUPNPC_VERSION = 2.0
+LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
+LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
+LIBMINIUPNPC_INSTALL_STAGING = YES
+LIBMINIUPNPC_LICENSE = BSD-3c
+LIBMINIUPNPC_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
