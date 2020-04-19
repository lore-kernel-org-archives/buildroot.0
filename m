From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Apr 2020 02:50:11 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pyasn-modules: remove
 duplicate package
Message-ID: <20200419085011.103843-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a duplicate of python-pyasn1-modules.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Config.in.legacy                                   |  7 +++++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/python-pyasn-modules/Config.in             | 11 -----------
 .../python-pyasn-modules/python-pyasn-modules.hash |  5 -----
 .../python-pyasn-modules/python-pyasn-modules.mk   | 14 --------------
 6 files changed, 7 insertions(+), 32 deletions(-)
 delete mode 100644 package/python-pyasn-modules/Config.in
 delete mode 100644 package/python-pyasn-modules/python-pyasn-modules.hash
 delete mode 100644 package/python-pyasn-modules/python-pyasn-modules.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 95f17b1b31..7058da5cb9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_PYTHON_PYASN_MODULES
+	bool "duplicate python-pyasn1-modules package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES
+	help
+	  This package was a duplicate of python-pyasn1-modules.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174
 	bool "duplicate QCA6174 firmware symbol removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c831d9d2d1..2feafbdd98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1762,7 +1762,6 @@ F:	package/python-crossbar/
 F:	package/python-lmdb/
 F:	package/python-mistune/
 F:	package/python-netaddr/
-F:	package/python-pyasn-modules/
 F:	package/python-pygments/
 F:	package/python-pynacl/
 F:	package/python-pytrie/
diff --git a/package/Config.in b/package/Config.in
index ccf54f2417..37786c6c5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1065,7 +1065,6 @@ menu "External python modules"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
 	source "package/python-pyasn/Config.in"
-	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
 	source "package/python-pycairo/Config.in"
diff --git a/package/python-pyasn-modules/Config.in b/package/python-pyasn-modules/Config.in
deleted file mode 100644
index cedd68b34e..0000000000
--- a/package/python-pyasn-modules/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYASN_MODULES
-	bool "python-pyasn-modules"
-	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_PYTHON_PYASN # runtime
-	help
-	  A collection of ASN.1-based protocols modules.
-
-	  https://pypi.python.org/pypi/pyasn1-modules
-
-comment "python-pyasn-modules needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyasn-modules/python-pyasn-modules.hash b/package/python-pyasn-modules/python-pyasn-modules.hash
deleted file mode 100644
index e5880d24ea..0000000000
--- a/package/python-pyasn-modules/python-pyasn-modules.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=178129bc7fbf07215c25230c5f053f81
-md5	178129bc7fbf07215c25230c5f053f81  pyasn1-modules-0.0.8.tar.gz
-# Locally computed
-sha256	10561934f1829bcc455c7ecdcdacdb4be5ffd3696f26f468eb6eb41e107f3837  pyasn1-modules-0.0.8.tar.gz
-sha256  8bea85439e7446ecb270079cce926d605a7d10f51fe8789b1aeced557dcbe1b6  LICENSE.txt
diff --git a/package/python-pyasn-modules/python-pyasn-modules.mk b/package/python-pyasn-modules/python-pyasn-modules.mk
deleted file mode 100644
index b5e853aa2a..0000000000
--- a/package/python-pyasn-modules/python-pyasn-modules.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pyasn-modules
-#
-################################################################################
-
-PYTHON_PYASN_MODULES_VERSION = 0.0.8
-PYTHON_PYASN_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN_MODULES_VERSION).tar.gz
-PYTHON_PYASN_MODULES_SITE = https://pypi.python.org/packages/source/p/pyasn1-modules
-PYTHON_PYASN_MODULES_LICENSE = BSD-2-Clause
-PYTHON_PYASN_MODULES_LICENSE_FILES = LICENSE.txt
-PYTHON_PYASN_MODULES_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.20.1
