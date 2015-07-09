From: Denis THULIN <denis.thulin@openwide.fr>
Date: Thu,  9 Jul 2015 15:31:57 +0200
Subject: [Buildroot] [PATCH 2/2] python-robotframework: New package
In-Reply-To: <1436448717-6088-1-git-send-email-denis.thulin@openwide.fr>
References: <1436448717-6088-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1436448717-6088-3-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A generic test automation framework written in python.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
v0:
    - Generated using python-package-generator.py
    - Dependencies on python-zlib and python-pyexpat were added manually
    - Modification of packages/Config.in done manually.
v1:
    - fixed indentation error on dependencies (was 4 spaces instead of tab)
    - Changed hash from md5 to sha256 (modification of scanpypi)
    - Fixed typos (modification of scanpypi)
v2:
    - Added the md5 hash from pypi
    - Fixed typos

---

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 package/Config.in                                        |  1 +
 package/python-robotframework/Config.in                  | 10 ++++++++++
 package/python-robotframework/python-robotframework.hash |  3 +++
 package/python-robotframework/python-robotframework.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk

diff --git a/package/Config.in b/package/Config.in
index d9b0794..a14ba4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -640,6 +640,7 @@ menu "external python modules"
 	source "package/python-pyxml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-robotframework/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/python-robotframework/Config.in b/package/python-robotframework/Config.in
new file mode 100644
index 0000000..9adda53
--- /dev/null
+++ b/package/python-robotframework/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
+	bool "python-robotframework"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  A generic test automation framework
+	  Only works with Python 2
+
+	  http://robotframework.org
diff --git a/package/python-robotframework/python-robotframework.hash b/package/python-robotframework/python-robotframework.hash
new file mode 100644
index 0000000..1ad9dc5
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/packages/source/r/robotframework/robotframework-2.9b2.tar.gz, sha256 calculated by scanpypi
+md5	723c30c827bb1f66e0fb032eff0c01cf  robotframework-2.9b2.tar.gz
+sha256	188db920cdedfd1b5e29adb284c410ab3711ebc3035f8f439d342d361fbda3d3  robotframework-2.9b2.tar.gz
diff --git a/package/python-robotframework/python-robotframework.mk b/package/python-robotframework/python-robotframework.mk
new file mode 100644
index 0000000..1327a7e
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-robotframework
+#
+################################################################################
+
+PYTHON_ROBOTFRAMEWORK_VERSION = 2.9b2
+PYTHON_ROBOTFRAMEWORK_SOURCE = robotframework-$(PYTHON_ROBOTFRAMEWORK_VERSION).tar.gz
+PYTHON_ROBOTFRAMEWORK_SITE = https://pypi.python.org/packages/source/r/robotframework
+PYTHON_ROBOTFRAMEWORK_SETUP_TYPE = distutils
+PYTHON_ROBOTFRAMEWORK_LICENSE = Apache-2.0
+PYTHON_ROBOTFRAMEWORK_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.4.4
