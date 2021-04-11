From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 21:20:42 +0200
Subject: [Buildroot] [git commit] package/python-packaging: bump to version
 20.9
Message-ID: <20210411185909.68EB7812D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66e1ababd543c78126808ed78abb27e2a9ad0b2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-six is not a dependency since version 20.5 and
https://github.com/pypa/packaging/commit/39a70cce69d9b08cc4d02b225114d556d5b59ada

https://github.com/pypa/packaging/blob/20.9/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-packaging/Config.in             | 1 -
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
index 5a8135cd57..12170df84e 100644
--- a/package/python-packaging/Config.in
+++ b/package/python-packaging/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_PACKAGING
 	bool "python-packaging"
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Core utilities for Python packages.
 
diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index aafb16c1b0..b3145dfee6 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  3208229da731c5d8e29d4d8941e75005  packaging-20.4.tar.gz
-sha256  4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8  packaging-20.4.tar.gz
+md5  5377308b3ba89f2d78c05e7f485be65d  packaging-20.9.tar.gz
+sha256  5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5  packaging-20.9.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 62a9d68cbb..5fdf7616cc 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 20.4
+PYTHON_PACKAGING_VERSION = 20.9
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/55/fd/fc1aca9cf51ed2f2c11748fa797370027babd82f87829c7a8e6dbe720145
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/86/3c/bcd09ec5df7123abcf695009221a52f90438d877a2f1499453c6938f5728
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
