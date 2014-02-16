From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 22:59:59 +0100
Subject: [Buildroot] [PATCH 06/11] armadillo: new package
In-Reply-To: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392588004-13317-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Armadillo is a C++ linear algebra library.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in              |  1 +
 package/armadillo/Config.in    |  9 +++++++++
 package/armadillo/armadillo.mk | 15 +++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/armadillo/Config.in
 create mode 100644 package/armadillo/armadillo.mk

diff --git a/package/Config.in b/package/Config.in
index d843961..5c3226e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -723,6 +723,7 @@ source "package/zyre/Config.in"
 endmenu
 
 menu "Other"
+source "package/armadillo/Config.in"
 source "package/apr/Config.in"
 source "package/apr-util/Config.in"
 source "package/argp-standalone/Config.in"
diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
new file mode 100644
index 0000000..bbb1142
--- /dev/null
+++ b/package/armadillo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ARMADILLO
+	bool "armadillo"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_CLAPACK
+	help
+	  Armadillo: An Open Source C++ Linear Algebra Library for
+	  Fast Prototyping and Computationally Intensive Experiments.
+
+	  http://arma.sourceforge.net/
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
new file mode 100644
index 0000000..b2cfdfc
--- /dev/null
+++ b/package/armadillo/armadillo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# armadillo
+#
+################################################################################
+
+ARMADILLO_VERSION_MAJOR = 4.000
+ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).4
+ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma/
+ARMADILLO_DEPENDENCIES = clapack
+ARMADILLO_INSTALL_STAGING = YES
+ARMADILLO_LICENSE = MPLv2.0
+ARMADILLO_LICENSE_FILES = LICENSE.txt
+
+$(eval $(cmake-package))
-- 
1.8.5.4
