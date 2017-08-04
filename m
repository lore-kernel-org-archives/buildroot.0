From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  4 Aug 2017 07:24:00 +0200
Subject: [Buildroot] [RFC] python-cryptography: bump to version 2.0.3
Message-ID: <20170804052400.10360-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Replace pyasn with asn1crypto and reorder runtime dependencies
alphabetically.

Enable Python hashlib module.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cryptography/Config.in                | 10 ++++++----
 package/python-cryptography/python-cryptography.hash |  4 ++--
 package/python-cryptography/python-cryptography.mk   |  4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 9827cf82b..fc37f970b 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -2,17 +2,19 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_PYASN # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_HASHLIB if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
 	  primitives and recipes to Python developers.
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index a1162cf88..431a9e1bf 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/cryptography/json, sha256 locally computed
-md5 fade66de437392ed1ba6980768626204 cryptography-1.7.2.tar.gz
-sha256 878cb68b3da3d493ffd68f36db11c29deee623671d3287c3f8d685117ffda9a9 cryptography-1.7.2.tar.gz
+md5	24cbdab3fda22be31dd3aef2808f5d2f  cryptography-2.0.3.tar.gz
+sha256	d04bb2425086c3fe86f7bc48915290b13e798497839fbb18ab7f6dffcf98cc3a  cryptography-2.0.3.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 5373da820..0901f845b 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.7.2
+PYTHON_CRYPTOGRAPHY_VERSION = 2.0.3
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/99/df/71c7260003f5c469cec3db4c547115df39e9ce6c719a99e067ba0e78fd8a
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/9c/1a/0fc8cffb04582f9ffca61b15b0681cf2e8588438e55f61403eb9880bd8e0
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.11.0
