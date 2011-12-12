From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 12 Dec 2011 15:25:48 +0100
Subject: [Buildroot] [PATCH 1/1] New package gsl The GNU Scientific Library.
Message-ID: <1323699948-25758-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers.
The library provides a wide range of mathematical routines such as random number generators,
special functions and least-squares fitting.
There are over 1000 functions in total with an extensive test suite.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in     |    1 +
 package/gsl/Config.in |    8 ++++++++
 package/gsl/gsl.mk    |   11 +++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/gsl/Config.in
 create mode 100644 package/gsl/gsl.mk

diff --git a/package/Config.in b/package/Config.in
index eb93b1c..ff0838c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -343,6 +343,7 @@ endmenu
 
 menu "Other"
 source "package/fftw/Config.in"
+source "package/gsl/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/libatomic_ops/Config.in"
diff --git a/package/gsl/Config.in b/package/gsl/Config.in
new file mode 100644
index 0000000..75a38cd
--- /dev/null
+++ b/package/gsl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GSL
+	bool "gsl"
+	help
+	  GSL The GNU Scientific Library.
+	  Includes a wide range of math functions.
+	  Statistics, Complex numbers, FFT, ...
+	  
+	  http://www.gnu.org/software/gsl
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
new file mode 100644
index 0000000..aa5a64a
--- /dev/null
+++ b/package/gsl/gsl.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# gnu gsl
+#
+#############################################################
+GSL_VERSION = 1.15
+GSL_SITE = ftp://ftp.gnu.org/gnu/gsl/
+GSL_INSTALL_STAGING = YES
+GSL_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8
