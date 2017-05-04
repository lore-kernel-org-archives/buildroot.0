From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:46:40 +0200
Subject: [Buildroot] [git commit] package/python-decorator: new package
Message-ID: <20170504194659.9B50381E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e816c8243fa6d7a72d5a2dbc01464071d8d68c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'decorator'[1] package to Buildroot. Needed by 'traitlets'
package, which is added in the next patch.

[1] https://pypi.python.org/pypi/decorator

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
[Thomas: download from PyPi, add hash file, add entry in DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                     |  3 +++
 package/Config.in                              |  1 +
 package/python-decorator/Config.in             |  6 ++++++
 package/python-decorator/python-decorator.hash |  3 +++
 package/python-decorator/python-decorator.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82eb819..a3da397 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -71,6 +71,9 @@ F:	package/openal/
 F:	package/p7zip/
 F:	package/wine/
 
+N:	Andrey Smirnov <andrew.smirnov at gmail.com
+F:	package/python-decorator/
+
 N:	Andrew Ruder <andrew.ruder@elecsyscorp.com>
 F:	package/expect/
 
diff --git a/package/Config.in b/package/Config.in
index acaf43c..e38a934 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -698,6 +698,7 @@ menu "External python modules"
 	source "package/python-daemon/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
+	source "package/python-decorator/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
diff --git a/package/python-decorator/Config.in b/package/python-decorator/Config.in
new file mode 100644
index 0000000..e7ec00c
--- /dev/null
+++ b/package/python-decorator/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DECORATOR
+	bool "python-decorator"
+	help
+	  Better living through Python with decorators
+
+	  https://github.com/micheles/decorator
diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
new file mode 100644
index 0000000..293f1ca
--- /dev/null
+++ b/package/python-decorator/python-decorator.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/decorator/json, sha256 locally calculated
+md5 73644c8f0bd4983d1b6a34b49adec0ae decorator-4.0.11.tar.gz
+sha256 953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76 decorator-4.0.11.tar.gz
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
new file mode 100644
index 0000000..c0c43f6
--- /dev/null
+++ b/package/python-decorator/python-decorator.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-decorator
+#
+################################################################################
+
+PYTHON_DECORATOR_VERSION = 4.0.11
+PYTHON_DECORATOR_SITE = https://pypi.python.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570
+PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
+PYTHON_DECORATOR_LICENSE = BSD-2-Clause
+PYTHON_DECORATOR_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
