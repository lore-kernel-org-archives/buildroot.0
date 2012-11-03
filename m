From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:10:51 +0100
Subject: [Buildroot] [git commit] libnetfilter_cthelper: add new package
Message-ID: <20121103182340.3177C99A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b454a23bd1320e81832731019a250748448e137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/libnetfilter_cthelper/Config.in            |   13 +++++++++++++
 .../libnetfilter_cthelper/libnetfilter-cthelper.mk |   15 +++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fd2703e..e938e53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
 source "package/libmbus/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
+source "package/libnetfilter_cthelper/Config.in"
 source "package/libnetfilter_cttimeout/Config.in"
 source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
diff --git a/package/libnetfilter_cthelper/Config.in b/package/libnetfilter_cthelper/Config.in
new file mode 100644
index 0000000..fd4f95c
--- /dev/null
+++ b/package/libnetfilter_cthelper/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBNETFILTER_CTHELPER
+	bool "libnetfilter_cthelper"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
+	help
+	  libnetfilter_cthelper is the userspace library that provides
+	  the programming interface to the user-space helper infrastructure
+	  available since Linux kernel 3.6.
+
+	  http://www.netfilter.org/projects/libnetfilter_cthelper/
+
+comment "libnetfilter_cthelper requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_cthelper/libnetfilter-cthelper.mk b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
new file mode 100644
index 0000000..1414156
--- /dev/null
+++ b/package/libnetfilter_cthelper/libnetfilter-cthelper.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libnetfilter-cthelper
+#
+#############################################################
+
+LIBNETFILTER_CTHELPER_VERSION = 1.0.0
+LIBNETFILTER_CTHELPER_SOURCE = libnetfilter_cthelper-$(LIBNETFILTER_CTHELPER_VERSION).tar.bz2
+LIBNETFILTER_CTHELPER_SITE = http://www.netfilter.org/projects/libnetfilter_cthelper/files
+LIBNETFILTER_CTHELPER_INSTALL_STAGING = YES
+LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
+LIBNETFILTER_CTHELPER_LICENSE = GPLv2
+LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
