From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:44:45 +0200
Subject: [Buildroot] [git commit] package/python-pyasn: remove duplicate
 package
Message-ID: <20200420053724.C3B208F3B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9de136ffebf6a137b6509174b68ca0c35f999150
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a duplicate of python-pyasn1.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                       |  7 +++++++
 DEVELOPERS                             |  1 -
 package/Config.in                      |  1 -
 package/python-pyasn/Config.in         | 14 --------------
 package/python-pyasn/python-pyasn.hash |  6 ------
 package/python-pyasn/python-pyasn.mk   | 14 --------------
 6 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c3c4259dbe..c92023310d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,13 @@ config BR2_PACKAGE_COLLECTD_LVM
 	help
 	  collectd removed LVM plugin, liblvm2app has been deprecated
 
+config BR2_PACKAGE_PYTHON_PYASN
+	bool "duplicate python-pyasn1 package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_PYASN1
+	help
+	  This package was a duplicate of python-pyasn1.
+
 config BR2_PACKAGE_PYTHON_PYASN_MODULES
 	bool "duplicate python-pyasn1-modules package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0e83844a26..245f12314e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2250,7 +2250,6 @@ F:	package/davfs2/
 N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
 F:	package/miraclecast/
-F:	package/python-pyasn/
 F:	package/python-pycrypto/
 F:	package/python-pysnmp/
 F:	package/python-pysnmp-mibs/
diff --git a/package/Config.in b/package/Config.in
index 9ae9e0bb65..ef63daf97c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1067,7 +1067,6 @@ menu "External python modules"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
 	source "package/python-pyalsa/Config.in"
-	source "package/python-pyasn/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
 	source "package/python-pycairo/Config.in"
diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
deleted file mode 100644
index 2396194df6..0000000000
--- a/package/python-pyasn/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYASN
-	bool "python-pyasn"
-	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	help
-	  PyASN is a Python extension module that enables you to
-	  perform very fast IP address to Autonomous System Number
-	  lookups.
-
-	  https://github.com/hadiasghari/pyasn
-
-comment "python-pyasn needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyasn/python-pyasn.hash b/package/python-pyasn/python-pyasn.hash
deleted file mode 100644
index c08b64dd25..0000000000
--- a/package/python-pyasn/python-pyasn.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f00a02a631d4016818659d1cc38d229a, sha256 locally computed
-md5     f00a02a631d4016818659d1cc38d229a  pyasn1-0.1.9.tar.gz
-sha256  853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f  pyasn1-0.1.9.tar.gz
-
-# Locally calculated
-sha256  8bea85439e7446ecb270079cce926d605a7d10f51fe8789b1aeced557dcbe1b6  LICENSE.txt
diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
deleted file mode 100644
index f34520f835..0000000000
--- a/package/python-pyasn/python-pyasn.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pyasn
-#
-################################################################################
-
-PYTHON_PYASN_VERSION = 0.1.9
-PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
-PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1
-PYTHON_PYASN_LICENSE = BSD-2-Clause
-PYTHON_PYASN_LICENSE_FILES = LICENSE.txt
-PYTHON_PYASN_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
