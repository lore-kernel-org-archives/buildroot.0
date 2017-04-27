From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:36 -0700
Subject: [Buildroot] [PATCH v2 06/10] package/python-pathlib2: New package
In-Reply-To: <20170427213340.26917-1-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
Message-ID: <20170427213340.26917-7-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 'pathlib2'[1] package to Buildroot. Needed by 'pickleshare'
package, which is added in the next patch.

[1] https://pypi.python.org/pypi/pathlib2

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-pathlib2/Config.in            | 14 ++++++++++++++
 package/python-pathlib2/python-pathlib2.hash |  2 ++
 package/python-pathlib2/python-pathlib2.mk   | 13 +++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-pathlib2/Config.in
 create mode 100644 package/python-pathlib2/python-pathlib2.hash
 create mode 100644 package/python-pathlib2/python-pathlib2.mk

diff --git a/package/Config.in b/package/Config.in
index c64105e..d8880df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -768,6 +768,7 @@ menu "External python modules"
 	source "package/python-paramiko/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
+	source "package/python-pathlib2/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-pillow/Config.in"
diff --git a/package/python-pathlib2/Config.in b/package/python-pathlib2/Config.in
new file mode 100644
index 0000000..71cd27e
--- /dev/null
+++ b/package/python-pathlib2/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_PATHLIB2
+	bool "python-pathlib2"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_SCANDIR
+	help
+	  Object-oriented filesystem paths.
+
+	  The goal of pathlib2 is to provide a backport of standard
+	  pathlib module which tracks the standard library module, so
+	  all the newest features of the standard pathlib can be used
+	  also on older Python versions.
+
+	  https://pypi.python.org/pypi/pathlib2
diff --git a/package/python-pathlib2/python-pathlib2.hash b/package/python-pathlib2/python-pathlib2.hash
new file mode 100644
index 0000000..e09496a
--- /dev/null
+++ b/package/python-pathlib2/python-pathlib2.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 ce9007df617ef6b7bd8a31cd2089ed0c1fed1f7c23cf2bf1ba140b3dd563175d pathlib2-2.2.1.tar.gz
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
new file mode 100644
index 0000000..d3b0d68
--- /dev/null
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pathlib2
+#
+################################################################################
+
+PYTHON_PATHLIB2_VERSION = 2.2.1
+PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
+PYTHON_PATHLIB2_SITE = https://pypi.python.org/packages/ab/d8/ac7489d50146f29d0a14f65545698f4545d8a6b739b24b05859942048b56
+PYTHON_PATHLIB2_LICENSE = MIT
+PYTHON_PATHLIB2_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.9.3
