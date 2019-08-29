From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:24:35 +0200
Subject: [Buildroot] [git commit branch/next] package/python-xlrd: bump to
 version 1.2.0
Message-ID: <20190829202159.E48938839C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9eaacd9cb458dc41bb94b128c284e7865b3cd22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The license file was changed from xlrd/licences.py to LICENSE in the
following upstream commit:

  https://github.com/python-excel/xlrd/commit/e7bcab2f4527b5a3d5118938076571e9e7566c2b

While the formatting has changed, the contents are the same. We take
this opportunity to add the hash of the license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Thomas: fix license file details]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlrd/python-xlrd.hash | 9 +++++----
 package/python-xlrd/python-xlrd.mk   | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-xlrd/python-xlrd.hash b/package/python-xlrd/python-xlrd.hash
index 8075605a95..0a66a2112a 100644
--- a/package/python-xlrd/python-xlrd.hash
+++ b/package/python-xlrd/python-xlrd.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/xlrd/json
-md5	9a91b688cd4945477ac28187a54f9a3b  xlrd-1.0.0.tar.gz
-# sha256 calculated by scanpypi
-sha256	0ff87dd5d50425084f7219cb6f86bb3eb5aa29063f53d50bf270ed007e941069  xlrd-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/xlrd/json
+md5	e5d5b96924d791b22898b622eb3e918e  xlrd-1.2.0.tar.gz
+sha256	546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2  xlrd-1.2.0.tar.gz
+# locally calculated
+sha256  b5a5dbce60265e305a815a6cb83ed07f24519d8ba644f2a307994488bced8815  LICENSE
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index 5d1363886d..c94e054b5b 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_XLRD_VERSION = 1.0.0
+PYTHON_XLRD_VERSION = 1.2.0
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
-PYTHON_XLRD_SITE = https://pypi.python.org/packages/42/85/25caf967c2d496067489e0bb32df069a8361e1fd96a7e9f35408e56b3aab
+PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/aa/05/ec9d4fcbbb74bbf4da9f622b3b61aec541e4eccf31d3c60c5422ec027ce2
 PYTHON_XLRD_SETUP_TYPE = setuptools
 PYTHON_XLRD_LICENSE = BSD-3-Clause
-PYTHON_XLRD_LICENSE_FILES = xlrd/licences.py
+PYTHON_XLRD_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
 $(eval $(host-python-package))
