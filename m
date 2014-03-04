From: Derycke, Johan <johan.derycke@barco.com>
Date: Tue, 4 Mar 2014 13:58:10 +0000
Subject: [Buildroot] [PATCH v2 1/2] python-libconfig: new package
Message-ID: <1393941501.23823.14.camel@kuuclt18625l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2
-Fixed indentations and blank lines
-added package/Config.in

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
 package/Config.in                            |    1 +
 package/python-libconfig/Config.in           |    9 +++++++++
 package/python-libconfig/python-libconfig.mk |   17 +++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/python-libconfig/Config.in
 create mode 100644 package/python-libconfig/python-libconfig.mk

diff --git a/package/Config.in b/package/Config.in
index 417c9b8..fb29097 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -442,6 +442,7 @@ source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
 source "package/python-json-schema-validator/Config.in"
 source "package/python-keyring/Config.in"
+source "package/python-libconfig/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
diff --git a/package/python-libconfig/Config.in
b/package/python-libconfig/Config.in
new file mode 100644
index 0000000..170926d
--- /dev/null
+++ b/package/python-libconfig/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_LIBCONFIG
+       bool "python-libconfig"
+       depends on BR2_PACKAGE_PYTHON
+       select BR2_PACKAGE_BOOST_PYTHON
+       select BR2_PACKAGE_LIBCONFIG
+       help
+         Python bindings to the C++ library libconfig
+
+         https://github.com/cnangel/python-libconfig
diff --git a/package/python-libconfig/python-libconfig.mk
b/package/python-libconfig/python-libconfig.mk
new file mode 100644
index 0000000..3f5984b
--- /dev/null
+++ b/package/python-libconfig/python-libconfig.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-libconfig
+#
+################################################################################
+
+PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
+PYTHON_LIBCONFIG_SITE = $(call github,cnangel,python-libconfig,
$(PYTHON_LIBCONFIG_VERSION))
+
+PYTHON_LIBCONFIG_LICENSE = BSD
+PYTHON_LIBCONFIG_LICENSE_FILES = README
+
+PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
+
+PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
+
+$(eval $(python-package))
--
1.7.10.4


This message is subject to the following terms and conditions: MAIL DISCLAIMER<http://www.barco.com/en/maildisclaimer>
