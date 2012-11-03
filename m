From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:11:47 +0100
Subject: [Buildroot] [git commit] libnetfilter_acct: add new package
Message-ID: <20121103182340.BBD1D99A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b48aa7eed99ca980548ade72949dfd4108e8d05d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                              |    1 +
 package/libnetfilter_acct/Config.in            |   12 ++++++++++++
 package/libnetfilter_acct/libnetfilter-acct.mk |   15 +++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eae415b..dde8475 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -455,6 +455,7 @@ source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
 source "package/libmbus/Config.in"
+source "package/libnetfilter_acct/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
 source "package/libnetfilter_cthelper/Config.in"
 source "package/libnetfilter_cttimeout/Config.in"
diff --git a/package/libnetfilter_acct/Config.in b/package/libnetfilter_acct/Config.in
new file mode 100644
index 0000000..76cdf7d
--- /dev/null
+++ b/package/libnetfilter_acct/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBNETFILTER_ACCT
+	bool "libnetfilter_acct"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
+	help
+	  libnetfilter_acct is the userspace library providing interface
+	  to extended accounting infrastructure.
+
+	  http://www.netfilter.org/projects/libnetfilter_acct/
+
+comment "libnetfilter_acct requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_acct/libnetfilter-acct.mk b/package/libnetfilter_acct/libnetfilter-acct.mk
new file mode 100644
index 0000000..615c94c
--- /dev/null
+++ b/package/libnetfilter_acct/libnetfilter-acct.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libnetfilter-acct
+#
+#############################################################
+
+LIBNETFILTER_ACCT_VERSION = 1.0.1
+LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz2
+LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
+LIBNETFILTER_ACCT_INSTALL_STAGING = YES
+LIBNETFILTER_ACCT_DEPENDENCIES = host-pkgconf libmnl
+LIBNETFILTER_ACCT_LICENSE = LGPLv2.1+
+LIBNETFILTER_ACCT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
