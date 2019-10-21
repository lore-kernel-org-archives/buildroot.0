From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 21 Oct 2019 16:40:30 +0300
Subject: [Buildroot] [PATCH 2/2] package/python-cherrypy: bump to version
 18.3.0
In-Reply-To: <20191021134031.20586-1-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
Message-ID: <20191021134031.20586-10-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* The package doesn't support Python 2 anymore.
* License change: copyright year bump and removing bold style from
  one line.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cherrypy/Config.in            | 11 +++++------
 package/python-cherrypy/python-cherrypy.hash |  9 +++++----
 package/python-cherrypy/python-cherrypy.mk   |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index 622dd1f49b..c25befe9ad 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,13 +1,12 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
-	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_PORTEND # runtime
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON_ZC_LOCKFILE # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  A minimalist web framework
 
diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index d8f97af0f7..ffad848fc8 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/CherryPy/json, sha256 locally computed
-md5	e21fd0c5706504a8f26c46d808a14255  CherryPy-12.0.1.tar.gz
-sha256	6a3a90a43b1e05bd4634c60acfdcf34efe74f9f8746aca14dbe95a9b69db30ea  CherryPy-12.0.1.tar.gz
-sha256  02f4efe6e7dcd218c33cfa065c0552de983b5ad563b053e97697c5abd2ef14f9  LICENSE.md
+# md5, sha256 from https://pypi.org/pypi/CherryPy/json
+md5	1c0141ba4173ded6e69f67a3b2e28738  CherryPy-18.3.0.tar.gz
+sha256	683e687e7c7b1ba31ef86a113b1eafd0407269fed175bf488d3c839d37d1cc60  CherryPy-18.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256	6c7f90d4b7c6e08184f88ac12750b94d6bf254eee345a18d26178717be5c27d2  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 72b17bc876..8c1b7a7995 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 12.0.1
+PYTHON_CHERRYPY_VERSION = 18.3.0
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://pypi.python.org/packages/be/d8/a8ef56bfe1c39d466b8d55b496b64459cc43dec71361d88edf904901637f
+PYTHON_CHERRYPY_SITE = https://files.pythonhosted.org/packages/b1/f8/1bc6457ff1d2c1221eded1e693b867478eda8e32b4c7e5238f4810bb81a0
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
-- 
2.20.1
