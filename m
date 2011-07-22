From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2011 09:08:36 +0200
Subject: [Buildroot] [git commit] libmnl: new package
Message-ID: <20110722071021.41EAB85758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bea473a4d4a949388826679abd53e3d43573a639
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs largefile support]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/libmnl/Config.in |   11 +++++++++++
 package/libmnl/libmnl.mk |   12 ++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libmnl/Config.in
 create mode 100644 package/libmnl/libmnl.mk

diff --git a/package/Config.in b/package/Config.in
index a01f8d2..981a633 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -324,6 +324,7 @@ source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
+source "package/libmnl/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
new file mode 100644
index 0000000..87475df
--- /dev/null
+++ b/package/libmnl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBMNL
+	bool "libmnl"
+	depends on BR2_LARGEFILE
+	help
+	  libmnl is a minimalistic user-space library oriented
+	  to Netlink developers.
+
+	  http://netfilter.org/projects/libmnl/
+
+comment "libmnl requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
new file mode 100644
index 0000000..6749756
--- /dev/null
+++ b/package/libmnl/libmnl.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libmnl
+#
+#############################################################
+
+LIBMNL_VERSION = 1.0.1
+LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
+LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
+LIBMNL_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libmnl))
-- 
1.7.3.4
