From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 09:46:23 -0300
Subject: [Buildroot] [PATCH 06/12] libnetfilter_acct: add new package
In-Reply-To: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1350909989-1012-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                              |    1 +
 package/libnetfilter_acct/Config.in            |   12 ++++++++++++
 package/libnetfilter_acct/libnetfilter-acct.mk |   15 +++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/libnetfilter_acct/Config.in
 create mode 100644 package/libnetfilter_acct/libnetfilter-acct.mk

diff --git a/package/Config.in b/package/Config.in
index bdf8c53..8a8af71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,7 @@ source "package/neon/Config.in"
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
index 0000000..753e604
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
+LIBNETFILTER_ACCT_DEPENDENCIES = host-pkg-config libmnl
+LIBNETFILTER_ACCT_LICENSE = LGPLv2.1+
+LIBNETFILTER_ACCT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.8.6
