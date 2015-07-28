From: Denis THULIN <denis.thulin@openwide.fr>
Date: Tue, 28 Jul 2015 15:15:30 +0200
Subject: [Buildroot] [PATCH 2/2] python-robotframework: New package
In-Reply-To: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
References: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1438089330-18923-2-git-send-email-denis.thulin@openwide.fr>
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
v3:
    - Changed the hash file

---
 package/Config.in                                        |  1 +
 package/python-robotframework/Config.in                  |  9 +++++++++
 package/python-robotframework/python-robotframework.hash |  4 ++++
 package/python-robotframework/python-robotframework.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-robotframework/Config.in
 create mode 100644 package/python-robotframework/python-robotframework.hash
 create mode 100644 package/python-robotframework/python-robotframework.mk

diff --git a/package/Config.in b/package/Config.in
index 1e39c74..84e7f43 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -655,6 +655,7 @@ menu "external python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-robotframework/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/python-robotframework/Config.in b/package/python-robotframework/Config.in
new file mode 100644
index 0000000..9523893
--- /dev/null
+++ b/package/python-robotframework/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ROBOTFRAMEWORK
+	bool "python-robotframework"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  A generic test automation framework
+
+	  http://robotframework.org
diff --git a/package/python-robotframework/python-robotframework.hash b/package/python-robotframework/python-robotframework.hash
new file mode 100644
index 0000000..60c21a9
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/robotframework/json
+md5	85f5d20f5ef8cb7fe6f102985b209bf6  robotframework-2.9rc1.tar.gz
+# sha256 calculated by scanpypi
+sha256	4786e7d31822e9dd8427098ea2cd38068b69af46fb29c0337193cde41ef5d78f  robotframework-2.9rc1.tar.gz
diff --git a/package/python-robotframework/python-robotframework.mk b/package/python-robotframework/python-robotframework.mk
new file mode 100644
index 0000000..ba948d2
--- /dev/null
+++ b/package/python-robotframework/python-robotframework.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-robotframework
+#
+################################################################################
+
+PYTHON_ROBOTFRAMEWORK_VERSION = 2.9rc1
+PYTHON_ROBOTFRAMEWORK_SOURCE = robotframework-$(PYTHON_ROBOTFRAMEWORK_VERSION).tar.gz
+PYTHON_ROBOTFRAMEWORK_SITE = https://pypi.python.org/packages/source/r/robotframework
+PYTHON_ROBOTFRAMEWORK_SETUP_TYPE = distutils
+PYTHON_ROBOTFRAMEWORK_LICENSE = Apache-2.0
+PYTHON_ROBOTFRAMEWORK_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.4.6
