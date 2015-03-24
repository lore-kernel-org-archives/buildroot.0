From: Mr Anthony Arnold <anthony.arnold@uqconnect.edu.au>
Date: Tue, 24 Mar 2015 01:49:58 +0000
Subject: [Buildroot] package/glog
Message-ID: <1427161798142.23284@uqconnect.edu.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anthony Arnold <anthony.arnold@uqconnect.edu.au>
---
 package/Config.in      |  1 +
 package/glog/Config.in | 11 +++++++++++
 package/glog/glog.mk   | 13 +++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/glog/Config.in
 create mode 100644 package/glog/glog.mk

diff --git a/package/Config.in b/package/Config.in
index d6a5ad3..3128cc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -836,6 +836,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cxx/Config.in"
 	source "package/zlog/Config.in"
+	source "package/glog/Config.in"
 endmenu
 
 menu "Multimedia"
diff --git a/package/glog/Config.in b/package/glog/Config.in
new file mode 100644
index 0000000..ae528bd
--- /dev/null
+++ b/package/glog/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GLOG
+	bool "glog"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	 C++ implementation of the Google logging module
+
+	 https://github.com/google/glog
+
+comment "glog needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
\ No newline at end of file
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
new file mode 100644
index 0000000..b955bbf
--- /dev/null
+++ b/package/glog/glog.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# glog
+#
+################################################################################
+
+GLOG_VERSION = v0.3.4
+GLOG_LICENSE = New BSD License
+GLOG_LICENSE_FILES = COPYING
+GLOG_SITE = $(call github,google,glog,$(GLOG_VERSION))
+GLOG_SITE_METHOD = git
+
+$(eval $(autotools-package))
-- 
1.9.1
