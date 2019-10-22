From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:18:19 +0200
Subject: [Buildroot] [git commit] package/python-pysnmp-apps: remove package
Message-ID: <20191022211245.1AD937FE7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2781d7d74af7b7b94a30d7a26826de8e1b304f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package was renamed to snmpclitools and is no longer maintained.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  9 +++++++++
 package/Config.in                                  |  1 -
 package/python-pysnmp-apps/Config.in               | 12 ------------
 package/python-pysnmp-apps/python-pysnmp-apps.hash |  5 -----
 package/python-pysnmp-apps/python-pysnmp-apps.mk   | 15 ---------------
 5 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c6b6dc49aa..d4f3d04062 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_PYTHON_PYSNMP_APPS
+	bool "python-pysnmp-apps was removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SNMPCLITOOLS
+	help
+	  Following upstream changes, the python-pysnmp-apps package
+	  has been removed, and snmpclitools should be used as a
+	  replacement.
+
 config BR2_KERNEL_HEADERS_5_2
 	bool "kernel headers version 5.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a12ffe93f0..479e9b3ca9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1040,7 +1040,6 @@ menu "External python modules"
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
index 70d63834cb..0000000000
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
-PYTHON_PYSNMP_APPS_LICENSE = BSD-2-Clause
-PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE.txt
-PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
-
-$(eval $(python-package))
