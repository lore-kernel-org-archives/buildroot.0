From: nmenegale <nicolas.menegale@openwide.fr>
Date: Tue, 23 Apr 2013 16:09:26 +0200
Subject: [Buildroot] [PATCH 1/2] glibmm: new package
Message-ID: <1366726167-3396-1-git-send-email-nicolas.menegale@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas M?n?gale  <nicolas.menegale@openwide.fr>
---
v0: initial commit
glibmm is also a dependency of libxml++ (the libxml2 c++ wrapper)
Signed-off-by: nmenegale <nicolas.menegale@openwide.fr>
---
 package/Config.in        |  1 +
 package/glibmm/Config.in |  8 ++++++++
 package/glibmm/glibmm.mk | 13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/glibmm/Config.in
 create mode 100644 package/glibmm/glibmm.mk

diff --git a/package/Config.in b/package/Config.in
index 06bcdef..c75c3ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -558,6 +558,7 @@ source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
+source "package/glibmm/Config.in"
 source "package/gmp/Config.in"
 source "package/gsl/Config.in"
 source "package/gtest/Config.in"
diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
new file mode 100644
index 0000000..16a7a9b
--- /dev/null
+++ b/package/glibmm/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GLIBMM
+	bool "glibmm"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC
+	help
+	  The GLibmm package is a set of C++ bindings for GLib. 
+	  	
+	  http://www.gtkmm.org/
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
new file mode 100644
index 0000000..f7f49bd
--- /dev/null
+++ b/package/glibmm/glibmm.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# Glibmm
+#
+#############################################################
+GLIBMM_VERSION = 2.30.1
+GLIBMM_LICENSE = LGPLv2.1
+GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.bz2
+GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/2.30
+GLIBMM_INSTALL_STAGING = YES
+GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.8.1.2
