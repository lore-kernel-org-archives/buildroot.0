From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:03 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pathpy: bump to version
 12.0.1
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-6-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Add license file (and hash).
* Support for Python 2 has dropped.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pathpy/Config.in          | 1 +
 package/python-pathpy/python-pathpy.hash | 8 +++++---
 package/python-pathpy/python-pathpy.mk   | 5 +++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-pathpy/Config.in b/package/python-pathpy/Config.in
index 98c05126bf..7c7ffc9e92 100644
--- a/package/python-pathpy/Config.in
+++ b/package/python-pathpy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PATHPY
 	bool "python-pathpy"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  path.py implements a path objects as first-class
 	  entities, allowing common operations on files to
diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
index de22f6c576..4ff5abb38b 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/path.py/json, sha256 locally computed
-md5	afb4f92e4114b595f50573ecd61c31ee  path.py-10.5.tar.gz
-sha256	63a7af08676668fd51750f111affbd38c1a13c61aba15c6665b16681771c79a8  path.py-10.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/path.py/json
+md5	307098b1827af6031687edb49ce2c39c  path.py-12.0.1.tar.gz
+sha256	9f2169633403aa0423f6ec000e8701dd1819526c62465f5043952f92527fea0f  path.py-12.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index 452331682b..3b7388bdd2 100644
--- a/package/python-pathpy/python-pathpy.mk
+++ b/package/python-pathpy/python-pathpy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PATHPY_VERSION = 10.5
+PYTHON_PATHPY_VERSION = 12.0.1
 PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
-PYTHON_PATHPY_SITE = https://pypi.python.org/packages/a5/7b/7b303dc1b79fc394b67cea351455ec0db8e6ca5d8537687d40cb7c7d70bb
+PYTHON_PATHPY_SITE = https://files.pythonhosted.org/packages/70/63/c01c1bb2df17db4c78f78cc439a2800f55bec5445cabf1f3579a37909f41
 PYTHON_PATHPY_SETUP_TYPE = setuptools
 PYTHON_PATHPY_LICENSE = MIT
+PYTHON_PATHPY_LICENSE_FILES = LICENSE
 PYTHON_PATHPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.20.1
