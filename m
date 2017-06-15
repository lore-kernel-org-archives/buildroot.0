From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:49:58 +0200
Subject: [Buildroot] [git commit] package/python-pathlib2: New package
Message-ID: <20170615205916.B449780224@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e231e8ae39fa2641d052512cb88bc2a8a21916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'pathlib2'[1] package to Buildroot. Needed by 'pickleshare'
package, which is added in the next patch.

[1] https://pypi.python.org/pypi/pathlib2

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-pathlib2/Config.in            | 14 ++++++++++++++
 package/python-pathlib2/python-pathlib2.hash |  3 +++
 package/python-pathlib2/python-pathlib2.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9d5f51b..3a73917 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -83,6 +83,7 @@ F:	package/wine/
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
 F:	package/python-ipython-genutils/
+F:	package/python-pathlib2/
 F:	package/python-scandir/
 F:	package/python-simplegeneric/
 F:	package/python-traitlets/
diff --git a/package/Config.in b/package/Config.in
index 14315d5..cf41b37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -773,6 +773,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-pathlib2/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
diff --git a/package/python-pathlib2/Config.in b/package/python-pathlib2/Config.in
new file mode 100644
index 0000000..7297f0a
--- /dev/null
+++ b/package/python-pathlib2/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_PATHLIB2
+	bool "python-pathlib2"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_SCANDIR # runtime
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
index 0000000..a9c2949
--- /dev/null
+++ b/package/python-pathlib2/python-pathlib2.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pathlib2/json, sha256 locally computed
+md5 6c75bfde898b6c88627621a48ee8de14 pathlib2-2.2.1.tar.gz
+sha256 ce9007df617ef6b7bd8a31cd2089ed0c1fed1f7c23cf2bf1ba140b3dd563175d pathlib2-2.2.1.tar.gz
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
new file mode 100644
index 0000000..db2df91
--- /dev/null
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -0,0 +1,14 @@
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
+PYTHON_PATHLIB2_LICENSE_FILE = LICENSE.rst
+PYTHON_PATHLIB2_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
