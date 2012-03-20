From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 21 Mar 2012 00:16:57 +0100
Subject: [Buildroot] [PATCH v1 1/1] new package : gsl the GNU Scientific
	Library.
In-Reply-To: <1332285417-2158-1-git-send-email-sagaert.johan@skynet.be>
References: <1332285417-2158-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <1332285417-2158-2-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in        |    1 +
 package/libgsl/Config.in |    8 ++++++++
 package/libgsl/gsl.mk    |   11 +++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/libgsl/Config.in
 create mode 100644 package/libgsl/gsl.mk

diff --git a/package/Config.in b/package/Config.in
index 85583c6..11be301 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
+source "package/libgsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
diff --git a/package/libgsl/Config.in b/package/libgsl/Config.in
new file mode 100644
index 0000000..b81bc76
--- /dev/null
+++ b/package/libgsl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBGSL
+	bool "libgsl"
+	help
+	  The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers.
+	  The library provides a wide range of mathematical routines such as random number generators,
+	  special functions and least-squares fitting.
+	  There are over 1000 functions in total with an extensive test suite.
+ 	  http://www.gnu.org/software/gsl
diff --git a/package/libgsl/gsl.mk b/package/libgsl/gsl.mk
new file mode 100644
index 0000000..a53c196
--- /dev/null
+++ b/package/libgsl/gsl.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# gnu gsl
+#
+#############################################################
+LIBGSL_VERSION = 1.15
+LIBGSL_SOURCE = gsl-$(LIBGSL_VERSION).tar.gz
+LIBGSL_SITE = $(BR2_GNU_MIRROR)/gsl
+LIBGSL_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.3
