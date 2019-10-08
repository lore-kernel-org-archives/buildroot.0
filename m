From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  8 Oct 2019 10:27:59 +0300
Subject: [Buildroot] [PATCH 1/2] package/python-pysnmp-apps: remove package
Message-ID: <20191008072801.3745-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package was renamed to snmpclient and is no longer maintained.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                                 |  1 -
 package/python-pysnmp-apps/Config.in              | 12 ------------
 .../python-pysnmp-apps/python-pysnmp-apps.hash    |  5 -----
 package/python-pysnmp-apps/python-pysnmp-apps.mk  | 15 ---------------
 4 files changed, 33 deletions(-)
 delete mode 100644 package/python-pysnmp-apps/Config.in
 delete mode 100644 package/python-pysnmp-apps/python-pysnmp-apps.hash
 delete mode 100644 package/python-pysnmp-apps/python-pysnmp-apps.mk

diff --git a/package/Config.in b/package/Config.in
index 47b602c547..d8d0824c71 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1037,7 +1037,6 @@ menu "External python modules"
 	source "package/python-pysmb/Config.in"
 	source "package/python-pysmi/Config.in"
 	source "package/python-pysnmp/Config.in"
-	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pysocks/Config.in"
 	source "package/python-pytablereader/Config.in"
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
deleted file mode 100644
index 32e3269946..0000000000
--- a/package/python-pysnmp-apps/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYSNMP_APPS
-	bool "python-pysnmp-apps"
-	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
-	select BR2_PACKAGE_PYTHON_PYSNMP
-	help
-	  A collection of command-line tools for SNMP management
-	  purposes built on top of the PySNMP package.
-
-	  http://pysnmp.sf.net
-
-comment "python-pysnmp-apps needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.hash b/package/python-pysnmp-apps/python-pysnmp-apps.hash
deleted file mode 100644
index 42120486d9..0000000000
--- a/package/python-pysnmp-apps/python-pysnmp-apps.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/pysnmp-apps/json
-md5	ed3e4d421bb0e1806298120313efccc2  pysnmp-apps-0.5.3.tar.gz
-sha256	bf4ea6f3054a25b05e255d29e0b57a8aa8102f509048e3a9c0d93ddc86aff570  pysnmp-apps-0.5.3.tar.gz
-# Locally computed sha256 checksums
-sha256	f82128f64d567c333936a12b99a21d0e8cd66ce628d51ce0a7770cc38dc7fe43  LICENSE.txt
diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
deleted file mode 100644
index ee494eba0f..0000000000
--- a/package/python-pysnmp-apps/python-pysnmp-apps.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-pysnmp-apps
-#
-################################################################################
-
-PYTHON_PYSNMP_APPS_VERSION = 0.5.3
-PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
-PYTHON_PYSNMP_APPS_SITE = https://files.pythonhosted.org/packages/c2/1a/26f5f3732df2c7d34663a7f2fa6534b5b4ffae73a4a440b75864ec826ba6
-PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
-PYTHON_PYSNMP_APPS_LICENSE = BSD-3-Clause
-PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE.txt
-PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
-
-$(eval $(python-package))
-- 
2.20.1
