From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Apr 2013 15:27:06 -0300
Subject: [Buildroot] [PATCH 2/3] swig: new package
In-Reply-To: <1365532027-13639-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365532027-13639-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365532027-13639-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in      |  1 +
 package/swig/Config.in | 11 +++++++++++
 package/swig/swig.mk   | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/swig/Config.in
 create mode 100644 package/swig/swig.mk

diff --git a/package/Config.in b/package/Config.in
index 2e7dc67..3c05794 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -89,6 +89,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
 endif
 source "package/sstrip/Config.in"
+source "package/swig/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
diff --git a/package/swig/Config.in b/package/swig/Config.in
new file mode 100644
index 0000000..19d49f4
--- /dev/null
+++ b/package/swig/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SWIG
+	bool "swig"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  SWIG is a software development tool that connects programs written
+	  in C and C++ with a variety of high-level programming languages.
+
+	  http://www.swig.org/
+
+comment "swig requires C++ support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
new file mode 100644
index 0000000..fae4642
--- /dev/null
+++ b/package/swig/swig.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# swig
+#
+#############################################################
+
+SWIG_VERSION = 2.0.9
+SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
+SWIG_DEPENDENCIES = host-bison
+SWIG_CONF_OPT = --without-pcre --disable-ccache
+HOST_SWIG_CONF_OPT = --without-pcre --disable-ccache
+SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
+SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.1.5
