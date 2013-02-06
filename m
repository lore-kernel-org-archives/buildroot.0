From: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Date: Wed,  6 Feb 2013 12:28:59 +0100
Subject: [Buildroot] [PATCH] package: add libwebsockets
Message-ID: <1360150139-6879-1-git-send-email-andreas.wetzel@nanotronic.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
---
 package/Config.in                      |    1 +
 package/libwebsockets/Config.in        |    8 ++++++++
 package/libwebsockets/libwebsockets.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/libwebsockets/Config.in
 create mode 100644 package/libwebsockets/libwebsockets.mk

diff --git a/package/Config.in b/package/Config.in
index 15d7ad6..dc0a80d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -476,6 +476,7 @@ source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
+source "package/libwebsockets/Config.in"
 source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
 source "package/zeromq/Config.in"
diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
new file mode 100644
index 0000000..c4d3beb
--- /dev/null
+++ b/package/libwebsockets/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBWEBSOCKETS
+	bool "libwebsockets"
+	help
+	  Libwebsockets is a lightweight pure C library built to use
+	  minimal CPU and memory resources, and provide fast throughput
+	  in both directions.
+
+	  http://libwebsockets.org/
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
new file mode 100644
index 0000000..a3d8936
--- /dev/null
+++ b/package/libwebsockets/libwebsockets.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libwebsockets
+#
+################################################################################
+
+LIBWEBSOCKETS_VERSION = v1.1-chrome26-firefox18
+LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
+LIBWEBSOCKETS_LICENSE = LGPLv2.1
+LIBWEBSOCKETS_LICENSE_FILES = COPYING
+LIBWEBSOCKETS_DEPENDENCIES = zlib
+LIBWEBSOCKETS_AUTORECONF = YES
+LIBWEBSOCKETS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
