From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 21:56:00 +0200
Subject: [Buildroot] [git commit] python-cherrypy: bump to version 10.2.2
Message-ID: <20170620200317.BA7917FDF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdd213170c2a61bde07ac07f1f288f8d75216478
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix license info, add new dependencies and change setup type.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cherrypy/Config.in            | 7 +++++--
 package/python-cherrypy/python-cherrypy.hash | 6 +++---
 package/python-cherrypy/python-cherrypy.mk   | 9 +++++----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
index 6e32ec2..c049972 100644
--- a/package/python-cherrypy/Config.in
+++ b/package/python-cherrypy/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_PYTHON_CHERRYPY
 	bool "python-cherrypy"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
+	select BR2_PACKAGE_PYTHON_PORTEND # runtime
 	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  A minimalist web framework
 
diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
index 6befa45..ac3b982 100644
--- a/package/python-cherrypy/python-cherrypy.hash
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=4b765329b0b4b65ec25811e3febb6c93, sha256 locally computed
-md5	4b765329b0b4b65ec25811e3febb6c93  CherryPy-4.0.0.tar.gz
-sha256	73ad4f8870b5a3e9988a7778b5d3003a390d440527ec3458a0c7e58865d2611a  CherryPy-4.0.0.tar.gz
+# md5 from https://pypi.python.org/pypi/CherryPy/json, sha256 locally computed
+md5	105cbcd4f7cd139ab4107f1b0e39afe3  CherryPy-10.2.2.tar.gz
+sha256	32d93334df765c7fd5d22815ab643333e850f0cc4f6d51fee62a68f23eea8ff8  CherryPy-10.2.2.tar.gz
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
index 54742b9..2820b69 100644
--- a/package/python-cherrypy/python-cherrypy.mk
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CHERRYPY_VERSION = 4.0.0
+PYTHON_CHERRYPY_VERSION = 10.2.2
 PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
-PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
+PYTHON_CHERRYPY_SITE = https://pypi.python.org/packages/a2/de/dddea0c4d4be436724bfc2d1486c99368541d93c269bfa2a7fa3d132021e
 PYTHON_CHERRYPY_LICENSE = BSD-3-Clause
-PYTHON_CHERRYPY_LICENSE_FILES = cherrypy/LICENSE.txt
-PYTHON_CHERRYPY_SETUP_TYPE = distutils
+PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.md
+PYTHON_CHERRYPY_SETUP_TYPE = setuptools
+PYTHON_CHERRYPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
