From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 17 Feb 2013 18:23:50 +0200
Subject: [Buildroot] [PATCH] new package: libtasn1
Message-ID: <1361118230-9138-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtasn1

Libtasn1 is the ASN.1 library used by GnuTLS, GNU Shishi and some
other packages. It was written by Fabio Fiorina, and has been
shipped as part of GnuTLS for some time but is now a proper
GNU package.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
Note: This package is needed by network-manager-applet (coming soon)

 package/Config.in            |    1 +
 package/libtasn1/Config.in   |    7 +++++++
 package/libtasn1/libtasn1.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/libtasn1/Config.in
 create mode 100644 package/libtasn1/libtasn1.mk

diff --git a/package/Config.in b/package/Config.in
index b242318..e1788c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -554,6 +554,7 @@ source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
+source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libseccomp/Config.in"
 source "package/liburcu/Config.in"
diff --git a/package/libtasn1/Config.in b/package/libtasn1/Config.in
new file mode 100644
index 0000000..2812157
--- /dev/null
+++ b/package/libtasn1/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBTASN1
+	bool "libtasn1"
+	help
+	  ASN.1 library
+
+	  http://www.gnu.org/software/libtasn1
+
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
new file mode 100644
index 0000000..1329b97
--- /dev/null
+++ b/package/libtasn1/libtasn1.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libtasn1
+#
+#############################################################
+
+LIBTASN1_VERSION = 3.2
+LIBTASN1_SOURCE = libtasn1-$(LIBTASN1_VERSION).tar.gz
+LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
+LIBTASN1_DEPENDENCIES = host-bison host-microperl
+LIBTASN1_LICENSE = GPLv3 LGPLv2.1
+LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
+LIBTASN1_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.7.6
