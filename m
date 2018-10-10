From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:28:43 +0200
Subject: [Buildroot] [git commit] python-pysnmp: bump to version 4.4.6
Message-ID: <20181010122734.886F8822B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8122a1d85b6cc9f2adcb1243521c04ba4cae0510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update dependencies.
License was renamed to LICENSE.rst (no content changed).
Add hash for license.

Fixes:
http://autobuild.buildroot.org/results/9b3/9b3bcd761aa35d9fdf4acc05258cc87e8c36fb14/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysnmp/Config.in          | 9 +++------
 package/python-pysnmp/python-pysnmp.hash | 8 +++++---
 package/python-pysnmp/python-pysnmp.mk   | 8 +++-----
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index c7cdf3892d..a034b16852 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,13 +1,10 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	depends on BR2_INSTALL_LIBSTDCPP # pyasn
-	select BR2_PACKAGE_PYTHON_PYASN
-	select BR2_PACKAGE_PYTHON_PYCRYPTO
+	select BR2_PACKAGE_PYTHON_PYSMI # runtime
+	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	help
 	  PySNMP is a cross-platform, pure-Python SNMP engine
 	  implementation.
 
 	  http://pysnmp.sf.net
-
-comment "python-pysnmp needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 7ecbf4c480..bb5fc24834 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysnmp/json, sha256 locally computed
-md5 cc0838cdf3f2d34539f478942f648384 pysnmp-4.3.3.tar.gz
-sha256 c837d35cbb2c1e067b7b8ed752d962481ef8d7ff11e4cdd8bfb0840c4a786318 pysnmp-4.3.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pysnmp/json
+md5	9eaed18907d9b15828f138471b187e8f  pysnmp-4.4.6.tar.gz
+sha256	e34ffa0dce5f69adabd478ff76c3e1b08e32ebb0767df8b178d0704f4a1ac406  pysnmp-4.4.6.tar.gz
+# Locally computed sha256 checksums
+sha256	4781cdf5b05a40b8c36f2e71e248dac621762bc8e8482fa5fddab5053e2cdace  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 2721ba8a7b..0a916119df 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 4.3.3
+PYTHON_PYSNMP_VERSION = 4.4.6
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/47/b5/c65b9b6fcc36d3f4caca30d3314920f1ca75f5ceecc1f6ae2538ede24511
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/8b/66/96a49bf1d64ad1e005a8455644523b7e09663a405eb20a4599fb219e4c95
 PYTHON_PYSNMP_SETUP_TYPE = setuptools
 
 PYTHON_PYSNMP_LICENSE = BSD-3-Clause
-PYTHON_PYSNMP_LICENSE_FILES = LICENSE.txt
-
-PYTHON_PYSNMP_DEPENDENCIES = python-pyasn python-pycrypto
+PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
 
 $(eval $(python-package))
