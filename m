From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 23:38:04 +0100
Subject: [Buildroot] [git commit branch/next] python-treq: new package
Message-ID: <20160219223823.97DA281952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=357b945957dacec8a0bf3aa425d9b40f45f5a487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-treq/Config.in        | 13 +++++++++++++
 package/python-treq/python-treq.hash |  3 +++
 package/python-treq/python-treq.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d9da232..7a88d5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -722,6 +722,7 @@ menu "External python modules"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
new file mode 100644
index 0000000..a8590a9
--- /dev/null
+++ b/package/python-treq/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_TREQ
+	bool "python-treq"
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	help
+	  treq is an HTTP library inspired by requests but written on
+	  top of Twisted's Agents.  It provides a simple, higher level
+	  API for making HTTP requests when using Twisted.
+
+	  https://github.com/twisted/treq
diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
new file mode 100644
index 0000000..f4cc4d6
--- /dev/null
+++ b/package/python-treq/python-treq.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b1fb60759ad5a885cb8ea562553f2d4c, sha256 locally computed
+md5	b1fb60759ad5a885cb8ea562553f2d4c  treq-15.1.0.tar.gz
+sha256	425a47d5d52a993d51211028fb6ade252e5fbea094e878bb4b644096a7322de8  treq-15.1.0.tar.gz
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
new file mode 100644
index 0000000..dbf0e14
--- /dev/null
+++ b/package/python-treq/python-treq.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-treq
+#
+################################################################################
+
+PYTHON_TREQ_VERSION = 15.1.0
+PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
+PYTHON_TREQ_SITE = http://pypi.python.org/packages/source/t/treq
+PYTHON_TREQ_LICENSE = MIT
+PYTHON_TREQ_LICENSE_FILES = LICENSE
+PYTHON_TREQ_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
