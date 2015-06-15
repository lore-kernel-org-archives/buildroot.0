From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 15 Jun 2015 12:06:04 +0200
Subject: [Buildroot] [PATCH 2/3] python-robotframework: New package
In-Reply-To: <1434362765-1074-1-git-send-email-denis.thulin@openwide.fr>
References: <1434362765-1074-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1434362765-1074-3-git-send-email-denis.thulin@openwide.fr>
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
---

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 package/Config.in                                        |  1 +
 package/python-robotframework/Config.in                  |  9 +++++++++
 package/python-robotframework/python-robotframework.hash |  2 ++
 package/python-robotframework/python-robotframework.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk

diff --git a/package/Config.in b/package/Config.in
index 6dbc32d..766b055 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -637,6 +637,7 @@ menu "external python modules"
 	source "package/python-pyxml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-robotframework/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/python-robotframework/Config.in b/package/python-robotframework/Config.in
new file mode 100644
index 0000000..fe95eea
--- /dev/null
+++ b/package/python-robotframework/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
+	depends on BR2_PACKAGE_PYTHON
+	bool "python-robotframework"
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  A generic test automation framework
+	  
+	  http://robotframework.org
diff --git a/package/python-robotframework/python-robotframework.hash b/package/python-robotframework/python-robotframework.hash
new file mode 100644
index 0000000..7d9ec46
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.hash
@@ -0,0 +1,2 @@
+# sha356 calculated by scanpypi
+sha356	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855  robotframework-2.9a2.tar.gz
diff --git a/package/python-robotframework/python-robotframework.mk b/package/python-robotframework/python-robotframework.mk
new file mode 100644
index 0000000..437d5f4
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-robotframework
+#
+################################################################################
+
+PYTHON_ROBOTFRAMEWORK_VERSION = 2.9a2
+PYTHON_ROBOTFRAMEWORK_SOURCE = robotframework-$(PYTHON_ROBOTFRAMEWORK_VERSION).tar.gz
+PYTHON_ROBOTFRAMEWORK_SITE = https://pypi.python.org/packages/source/r/robotframework/
+PYTHON_ROBOTFRAMEWORK_SETUP_TYPE = distutils
+PYTHON_ROBOTFRAMEWORK_LICENSE = Apache License 2.0
+PYTHON_ROBOTFRAMEWORK_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.4.3
