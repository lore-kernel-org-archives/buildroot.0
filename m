From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  7 Nov 2013 22:27:28 +0100
Subject: [Buildroot] [PATCH] log4cplus: new package
Message-ID: <1383859648-13759-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in              |  1 +
 package/log4cplus/Config.in    | 15 +++++++++++++++
 package/log4cplus/log4cplus.mk | 14 ++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/log4cplus/Config.in
 create mode 100644 package/log4cplus/log4cplus.mk

diff --git a/package/Config.in b/package/Config.in
index c0a3f20..7c0eb94 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -706,6 +706,7 @@ source "package/libtpl/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
+source "package/log4cplus/Config.in"
 source "package/log4cxx/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/mpc/Config.in"
diff --git a/package/log4cplus/Config.in b/package/log4cplus/Config.in
new file mode 100644
index 0000000..8a112a4
--- /dev/null
+++ b/package/log4cplus/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LOG4CPLUS
+	bool "log4cplus"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  log4cplus is a simple to use C++ logging API providing
+	  thread-safe, flexible, and arbitrarily granular control
+	  over log management and configuration. It is modelled
+	  after the Java log4j API.
+
+	  http://sourceforge.net/projects/log4cplus
+
+comment "log4cplus needs a toolchain w/ C++, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
new file mode 100644
index 0000000..292fa66
--- /dev/null
+++ b/package/log4cplus/log4cplus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# log4cplus
+#
+################################################################################
+
+LOG4CPLUS_VERSION = 1.1.2
+LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
+LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
+LOG4CPLUS_LICENSE = Apache-2.0
+LOG4CPLUS_LICENSE_FILES = LICENSE
+LOG4CPLUS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.8.1.4
