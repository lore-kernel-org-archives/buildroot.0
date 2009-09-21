From: Will Newton <will.newton@gmail.com>
Date: Mon, 21 Sep 2009 17:42:22 +0200
Subject: [Buildroot] [git commit master] libmicrohttpd: New package.
Message-ID: <20090921154312.4FB2577764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1a9015f5d557c594f6719ea08e6c629a1f4c0398
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmicrohttpd is a library that allows embedding an HTTP server into
an application with a small code and memory footprint.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/Config.in                      |    1 +
 package/libmicrohttpd/Config.in        |    7 +++++++
 package/libmicrohttpd/libmicrohttpd.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/libmicrohttpd/Config.in
 create mode 100644 package/libmicrohttpd/libmicrohttpd.mk

diff --git a/package/Config.in b/package/Config.in
index 619c9bd..42539fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -158,6 +158,7 @@ source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
 source "package/libeXosip2/Config.in"
+source "package/libmicrohttpd/Config.in"
 source "package/libnl/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
new file mode 100644
index 0000000..c8cfd5d
--- /dev/null
+++ b/package/libmicrohttpd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBMICROHTTPD
+	bool "libmicrohttpd"
+	select BR2_PACKAGE_LIBGCRYPT
+	default n
+	help
+	  GNU libmicrohttpd is a small C library that makes it easy to
+	  run an HTTP server as part of another application.
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
new file mode 100644
index 0000000..b62f117
--- /dev/null
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libmicrohttpd
+#
+#############################################################
+LIBMICROHTTPD_VERSION:=0.4.2
+LIBMICROHTTPD_SOURCE:=libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
+LIBMICROHTTPD_SITE:=$(BR2_GNU_MIRROR)/libmicrohttpd
+LIBMICROHTTPD_LIBTOOL_PATCH = NO
+LIBMICROHTTPD_INSTALL_STAGING = YES
+
+LIBMICROHTTPD_DEPENDENCIES = libgcrypt
+
+$(eval $(call AUTOTARGETS,package,libmicrohttpd))
-- 
1.6.3.3
