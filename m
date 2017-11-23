From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 23 Nov 2017 11:55:01 +0100
Subject: [Buildroot] [PATCH 3/3] python-cherrypy: bump version to 12.0.1
In-Reply-To: <20171123105501.14505-1-yegorslists@googlemail.com>
References: <20171123105501.14505-1-yegorslists@googlemail.com>
Message-ID: <20171123105501.14505-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence file checksum and new runtime dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cherrypy/Config.in            | 1 +
 package/python-cherrypy/python-cherrypy.hash | 5 +++--
 package/python-cherrypy/python-cherrypy.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index c04997269b..622dd1f49b 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
 	select BR2_PACKAGE_PYTHON_PORTEND # runtime
 	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index ac3b982ba8..d8f97af0f7 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/CherryPy/json, sha256 locally computed
-md5	105cbcd4f7cd139ab4107f1b0e39afe3  CherryPy-10.2.2.tar.gz
-sha256	32d93334df765c7fd5d22815ab643333e850f0cc4f6d51fee62a68f23eea8ff8  CherryPy-10.2.2.tar.gz
+md5	e21fd0c5706504a8f26c46d808a14255  CherryPy-12.0.1.tar.gz
+sha256	6a3a90a43b1e05bd4634c60acfdcf34efe74f9f8746aca14dbe95a9b69db30ea  CherryPy-12.0.1.tar.gz
+sha256  02f4efe6e7dcd218c33cfa065c0552de983b5ad563b053e97697c5abd2ef14f9  LICENSE.md
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 2820b69828..72b17bc876 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 10.2.2
+PYTHON_CHERRYPY_VERSION = 12.0.1
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = https://pypi.python.org/packages/a2/de/dddea0c4d4be436724bfc2d1486c99368541d93c269bfa2a7fa3d132021e
+PYTHON_CHERRYPY_SITE = https://pypi.python.org/packages/be/d8/a8ef56bfe1c39d466b8d55b496b64459cc43dec71361d88edf904901637f
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
 PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
 PYTHON_CHERRYPY_SETUP_TYPE = setuptools
-- 
2.11.0
