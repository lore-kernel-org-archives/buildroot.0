From: Derycke, Johan <johan.derycke@barco.com>
Date: Tue, 4 Mar 2014 08:32:47 +0000
Subject: [Buildroot] [PATCH 1/2] python-libconfig: new package
Message-ID: <E1CF8EFE2042404B87DE2B6D662128020ED58B96@KUUMEX10.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python bindings to the C++ library libconfig
https://github.com/cnangel/python-libconfig

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
 package/python-libconfig/Config.in           |    9 +++++++++
 package/python-libconfig/python-libconfig.mk |   21 +++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/python-libconfig/Config.in
 create mode 100644 package/python-libconfig/python-libconfig.mk

diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
new file mode 100644
index 0000000..7e4f317
--- /dev/null
+++ b/package/python-libconfig/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_LIBCONFIG
+       bool "python-libconfig"
+       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+  select BR2_PACKAGE_BOOST_PYTHON
+       select BR2_PACKAGE_LIBCONFIG
+       help
+           Python bindings to the C++ library libconfig
+
+          https://github.com/cnangel/python-libconfig
diff --git a/package/python-libconfig/python-libconfig.mk b/package/python-libconfig/python-libconfig.mk
new file mode 100644
index 0000000..8d597ef
--- /dev/null
+++ b/package/python-libconfig/python-libconfig.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-libconfig
+#
+################################################################################
+
+PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
+PYTHON_LIBCONFIG_SITE = https://github.com/cnangel/python-libconfig/
+PYTHON_LIBCONFIG_SITE_METHOD = git
+
+PYTHON_LIBCONFIG_LICENSE = BSD
+PYTHON_LIBCONFIG_LICENSE_FILES = README
+
+PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
+
+PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
+
+$(eval $(python-package))
+
+
+
--
1.7.10.4

Best regards,
Johan Derycke





This message is subject to the following terms and conditions: MAIL DISCLAIMER<http://www.barco.com/en/maildisclaimer>
