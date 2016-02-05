From: Mauro Condarelli <mc5686@mclink.it>
Date: Fri,  5 Feb 2016 19:18:49 +0100
Subject: [Buildroot] [PATCH v3 09/17] python-treq: new package
In-Reply-To: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454696337-9692-10-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                    |  1 +
 package/python-treq/Config.in        | 12 ++++++++++++
 package/python-treq/python-treq.hash |  3 +++
 package/python-treq/python-treq.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-treq/Config.in
 create mode 100644 package/python-treq/python-treq.hash
 create mode 100644 package/python-treq/python-treq.mk

diff --git a/package/Config.in b/package/Config.in
index 6db2fe4..fb285d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -721,6 +721,7 @@ menu "External python modules"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
new file mode 100644
index 0000000..a03d4e3
--- /dev/null
+++ b/package/python-treq/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_TREQ
+	bool "python-treq"
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	help
+	  treq is an HTTP library inspired by requests but written on top of Twisted's Agents.
+	  It provides a simple, higher level API for making HTTP requests when using Twisted.
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
-- 
2.1.4
