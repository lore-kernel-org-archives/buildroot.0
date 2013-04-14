From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 21:35:10 +0200
Subject: [Buildroot] [git commit] package: add libwebsockets
Message-ID: <20130414193550.D82F69B078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=381c4646c5078cb2f31437598e1e353fb1bdb587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add missing zlib select to Config.in]
Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/libwebsockets/Config.in        |    9 +++++++++
 package/libwebsockets/libwebsockets.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 97ba790..322e005 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -535,6 +535,7 @@ source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
+source "package/libwebsockets/Config.in"
 source "package/nss-mdns/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
new file mode 100644
index 0000000..1d927bb
--- /dev/null
+++ b/package/libwebsockets/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBWEBSOCKETS
+	bool "libwebsockets"
+	select BR2_PACKAGE_ZLIB
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
