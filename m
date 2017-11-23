From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:02:04 +0100
Subject: [Buildroot] [git commit] python-jaraco-classes: new package
Message-ID: <20171201205334.5746C7FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf51842fcb6d8f9ce44536b46d7341a3b6cb5db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                        |  1 +
 package/python-jaraco-classes/Config.in                  |  7 +++++++
 package/python-jaraco-classes/python-jaraco-classes.hash |  4 ++++
 package/python-jaraco-classes/python-jaraco-classes.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4a7327c..54f6f57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -789,6 +789,7 @@ menu "External python modules"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-iso8601/Config.in"
 	source "package/python-itsdangerous/Config.in"
+	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-json-schema-validator/Config.in"
diff --git a/package/python-jaraco-classes/Config.in b/package/python-jaraco-classes/Config.in
new file mode 100644
index 0000000..05c1123
--- /dev/null
+++ b/package/python-jaraco-classes/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_JARACO_CLASSES
+	bool "python-jaraco-classes"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Utility functions for Python class constructs.
+
+	  https://github.com/jaraco/jaraco.classes
diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
new file mode 100644
index 0000000..bc30c5f
--- /dev/null
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/jaraco.classes/json, sha256 locally computed
+md5     c0cb1a0ce529e3cdbca9d99742071a04  jaraco.classes-1.4.3.tar.gz
+sha256  e347f2b502521bfc35c57ab4695e8b6d7371625c392a0ca0d46742ee93359d3e  jaraco.classes-1.4.3.tar.gz
+sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
new file mode 100644
index 0000000..4251452
--- /dev/null
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jaraco-classes
+#
+################################################################################
+
+PYTHON_JARACO_CLASSES_VERSION = 1.4.3
+PYTHON_JARACO_CLASSES_SOURCE = jaraco.classes-$(PYTHON_JARACO_CLASSES_VERSION).tar.gz
+PYTHON_JARACO_CLASSES_SITE = https://pypi.python.org/packages/b3/ce/031a6004619c2a3744b977b4a8414d7e8087afe6247110efcac797fee7f1
+PYTHON_JARACO_CLASSES_LICENSE = MIT
+PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
+PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
