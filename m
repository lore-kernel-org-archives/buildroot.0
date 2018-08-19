From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 20:42:42 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/python-cryptography: bump
 version to 2.3.1
Message-ID: <20180819184242.21134-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://cryptography.io/en/latest/changelog/#v2-3-1

Please note that CVE-2018-10903, fixed in version 2.3, was introduced
in version 1.9.0, so it was not present in buildroot:
https://nvd.nist.gov/vuln/detail/CVE-2018-10903

Added license hash and switched runtime dependency from pyasn1 to
asn1crypto: https://cryptography.io/en/latest/changelog/#v1-8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-cryptography/Config.in                | 2 +-
 package/python-cryptography/python-cryptography.hash | 8 +++++---
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index 14f950d4d8..d1c2917ea9 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_PYASN # runtime
+	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
 	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index a1162cf880..9c6d8cc44f 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/cryptography/json, sha256 locally computed
-md5 fade66de437392ed1ba6980768626204 cryptography-1.7.2.tar.gz
-sha256 878cb68b3da3d493ffd68f36db11c29deee623671d3287c3f8d685117ffda9a9 cryptography-1.7.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/cryptography/json
+md5	2b5e8269c43c9b9ab54fc8c75ba3c7ac  cryptography-2.3.1.tar.gz
+sha256	8d10113ca826a4c29d5b85b2c4e045ffa8bad74fb525ee0eceb1d38d4c70dfd6  cryptography-2.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256	35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 5373da8202..3c97d0afee 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.7.2
+PYTHON_CRYPTOGRAPHY_VERSION = 2.3.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/99/df/71c7260003f5c469cec3db4c547115df39e9ce6c719a99e067ba0e78fd8a
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/22/21/233e38f74188db94e8451ef6385754a98f3cad9b59bedf3a8e8b14988be4
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.18.0
