From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 23:26:27 +0200
Subject: [Buildroot] [git commit] python-visitor: new package
Message-ID: <20180427212715.1DAA788EE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=145d79732a09b859629a127282964dc91e9664c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A tiny library to facilitate visitor implementation in Python

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-visitor/Config.in           |  6 ++++++
 package/python-visitor/python-visitor.hash |  4 ++++
 package/python-visitor/python-visitor.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bc7ee95584..9685a53886 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -55,6 +55,7 @@ F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
 F:	package/python-psycopg2/
 F:	package/python-sqlalchemy/
+F:	package/python-visitor/
 F:	package/restorecond/
 F:	package/refpolicy/
 F:	package/selinux-python/
diff --git a/package/Config.in b/package/Config.in
index 4b8249ad3d..bdc02025cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -959,6 +959,7 @@ menu "External python modules"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
+	source "package/python-visitor/Config.in"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-web2py/Config.in"
diff --git a/package/python-visitor/Config.in b/package/python-visitor/Config.in
new file mode 100644
index 0000000000..f8be5ec9be
--- /dev/null
+++ b/package/python-visitor/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_VISITOR
+	bool "python-visitor"
+	help
+	  A tiny pythonic visitor implementation.
+
+	  http://github.com/mbr/visitor
diff --git a/package/python-visitor/python-visitor.hash b/package/python-visitor/python-visitor.hash
new file mode 100644
index 0000000000..6e0cffbd95
--- /dev/null
+++ b/package/python-visitor/python-visitor.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/visitor/json, sha256 locally computed
+md5    94a024ed0ec1b02b4497c15267d319ca  visitor-0.1.3.tar.gz
+sha256 2c737903b2b6864ebc6167eef7cf3b997126f1aa94bdf590f90f1436d23e480a  visitor-0.1.3.tar.gz
+sha256 184d1ebb65da97ada36447f3c028f2fd4890b874f17b18c023ce200dd96639af  LICENSE
diff --git a/package/python-visitor/python-visitor.mk b/package/python-visitor/python-visitor.mk
new file mode 100644
index 0000000000..1313491c96
--- /dev/null
+++ b/package/python-visitor/python-visitor.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-visitor
+#
+################################################################################
+
+PYTHON_VISITOR_VERSION = 0.1.3
+PYTHON_VISITOR_SOURCE = visitor-$(PYTHON_VISITOR_VERSION).tar.gz
+PYTHON_VISITOR_SITE = https://pypi.python.org/packages/d7/58/785fcd6de4210049da5fafe62301b197f044f3835393594be368547142b0
+PYTHON_VISITOR_SETUP_TYPE = setuptools
+PYTHON_VISITOR_LICENSE = MIT
+PYTHON_VISITOR_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
