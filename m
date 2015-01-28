From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 28 Jan 2015 22:05:43 +0100
Subject: [Buildroot] [PATCH] python-six: new package
Message-ID: <1422479143-21137-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |  1 +
 package/python-six/Config.in       |  9 +++++++++
 package/python-six/python-six.hash |  2 ++
 package/python-six/python-six.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-six/Config.in
 create mode 100644 package/python-six/python-six.hash
 create mode 100644 package/python-six/python-six.mk

diff --git a/package/Config.in b/package/Config.in
index 940e93a..c81ef4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -547,6 +547,7 @@ menu "external python modules"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
+	source "package/python-six/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-six/Config.in b/package/python-six/Config.in
new file mode 100644
index 0000000..0a8b69a
--- /dev/null
+++ b/package/python-six/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_SIX
+	bool "python-six"
+	help
+	  Six is a Python 2 and 3 compatibility library. It provides
+	  utility functions for smoothing over the differences between
+	  the Python versions with the goal of writing Python code that
+	  is compatible on both Python versions.
+
+	  http://pythonhosted.org/six
diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
new file mode 100644
index 0000000..6121a08
--- /dev/null
+++ b/package/python-six/python-six.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5  six-1.9.0.tar.gz
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
new file mode 100644
index 0000000..e9f78ec
--- /dev/null
+++ b/package/python-six/python-six.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-six
+#
+################################################################################
+
+PYTHON_SIX_VERSION = 1.9.0
+PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
+PYTHON_SIX_SITE = https://pypi.python.org/packages/source/s/six/
+PYTHON_SIX_SETUP_TYPE = setuptools
+PYTHON_SIX_LICENSE = MIT
+PYTHON_SIX_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+
-- 
2.1.0
