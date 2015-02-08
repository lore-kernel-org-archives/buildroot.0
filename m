From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun,  8 Feb 2015 10:59:19 -0500
Subject: [Buildroot] [PATCH v3] python-cherrypy: new package
Message-ID: <1423411159-4560-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v2 -> v3:
  - Add runtime dependencies on zlib and expat
  - Add hash file
Changes v1 -> v2:
  - removed depends statement in Config.in per Yegor's comment
    that it wasn't needed if it runs on both Python 2 and 3.

 package/Config.in                            |  1 +
 package/python-cherrypy/Config.in            | 10 ++++++++++
 package/python-cherrypy/python-cherrypy.hash |  3 +++
 package/python-cherrypy/python-cherrypy.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-cherrypy/Config.in
 create mode 100644 package/python-cherrypy/python-cherrypy.hash
 create mode 100644 package/python-cherrypy/python-cherrypy.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..a5d1be5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ menu "external python modules"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-cheetah/Config.in"
+	source "package/python-cherrypy/Config.in"
 	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
new file mode 100644
index 0000000..6e32ec2
--- /dev/null
+++ b/package/python-cherrypy/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_CHERRYPY
+	bool "python-cherrypy"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  A minimalist web framework
+
+	  http://www.cherrypy.org
diff --git a/package/python-cherrypy/python-cherrypy.hash b/package/python-cherrypy/python-cherrypy.hash
new file mode 100644
index 0000000..08fa075
--- /dev/null
+++ b/package/python-cherrypy/python-cherrypy.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9772dbee426d656f01a13881e2b139d8, sha256 locally computed
+md5	9772dbee426d656f01a13881e2b139d8  CherryPy-3.6.0.tar.gz
+sha256	a149271819a15417104aa8f641ad5b96287070f0153e6ef2832a87e2c693d75d  CherryPy-3.6.0.tar.gz
diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
new file mode 100644
index 0000000..a08b21a
--- /dev/null
+++ b/package/python-cherrypy/python-cherrypy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cherrypy
+#
+################################################################################
+
+PYTHON_CHERRYPY_VERSION = 3.6.0
+PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
+PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
+PYTHON_CHERRYPY_LICENSE = BSD-3c
+PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.txt
+PYTHON_CHERRYPY_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
1.9.1
