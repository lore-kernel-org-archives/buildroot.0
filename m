From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-webpy: bump to version 0.40
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-29-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* Take tarball from PyPI instead of Github.
* webpy now supports both Python 2 and Python 3.
* License change: On commit 97466ad0392738be2f5cc3bd4c1289872a8a0f44,
  WSGI server moved the cherrypy library so web/wsgiserver/LICENSE.txt
  has removed and LICENSE.txt doesn't mention WSGI anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-webpy/Config.in         | 5 +++--
 package/python-webpy/python-webpy.hash | 9 +++++----
 package/python-webpy/python-webpy.mk   | 9 +++++----
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
index 5f4df7832b..d30da70e13 100644
--- a/package/python-webpy/Config.in
+++ b/package/python-webpy/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_WEBPY
 	bool "python-webpy"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_HASHLIB
+	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
+	select BR2_PACKAGE_PYTHON_MARKDOWN # runtime
 	help
 	  web.py is a web framework for Python that is as simple as it
 	  is powerful.
diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 8ac6827538..6af6abeff1 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,4 +1,5 @@
-# Locally computed
-sha256  f074241a0b839408a0b9840ade1198e16fbd6aa6393a48a0e84f73b545baab9a  python-webpy-0.39.tar.gz
-sha256  3826fd531a9b904841f5e3560fcda7e93f2ab8d11ef124ec65e10625efa26c34  LICENSE.txt
-sha256  7347fd17bfd33c4093c31dc77076733e1e0150ce8c13296c56dc042bbecede84  web/wsgiserver/LICENSE.txt
+# md5, sha256 from https://pypi.org/pypi/web.py/json
+md5	4e7ec89e7ae1e938d01fff01ba752606  web.py-0.40.tar.gz
+sha256	dc5e42ffbc42d77d07f75b7acca9975a3368ae609774e49ddebb497a784131f3  web.py-0.40.tar.gz
+# Locally computed sha256 checksums
+sha256	791bf6e9419435f114a19fc6519ff33738021eb3c41b18490943230ab0894df9  LICENSE.txt
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 86812a04cb..187a481286 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.39
-PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_VERSION = 0.40
+PYTHON_WEBPY_SOURCE = web.py-$(PYTHON_WEBPY_VERSION).tar.gz
+PYTHON_WEBPY_SITE = https://files.pythonhosted.org/packages/e3/23/ed84b174add09153329c6357984c8433e2f350de91c3859fa48c3cdbf7dc
 PYTHON_WEBPY_SETUP_TYPE = setuptools
-PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
-PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
+PYTHON_WEBPY_LICENSE = Public Domain
+PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.20.1
