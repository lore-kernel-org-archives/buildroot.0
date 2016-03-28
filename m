From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 28 Mar 2016 13:37:19 -0700
Subject: [Buildroot] [PATCH 1/1] PyMySQL: new package
Message-ID: <1459197439-25518-1-git-send-email-stevecalfee@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add python to mysql connection software, pure python

Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-pymysql/Config.in           |  7 +++++++
 package/python-pymysql/python-pymysql.hash |  5 +++++
 package/python-pymysql/python-pymysql.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-pymysql/Config.in
 create mode 100644 package/python-pymysql/python-pymysql.hash
 create mode 100644 package/python-pymysql/python-pymysql.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..2543195 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -683,6 +683,7 @@ menu "External python modules"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pymysql/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
diff --git a/package/python-pymysql/Config.in b/package/python-pymysql/Config.in
new file mode 100644
index 0000000..a6de53d
--- /dev/null
+++ b/package/python-pymysql/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYMYSQL
+	bool "python-pymysql"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  python-pymysql is a pure Python binding for mySQL.
+
+	  https://pypi.python.org/
diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
new file mode 100644
index 0000000..37b6299
--- /dev/null
+++ b/package/python-pymysql/python-pymysql.hash
@@ -0,0 +1,5 @@
+#https://pypi.python.org/packages/source/P/PyMySQL/PyMySQL-0.7.2.tar.gz
+#md5 https://pypi.python.org/pypi?:action=show_md5&digest=6d757cda8bfbd312714207f7c0bef5c7
+md5     6d757cda8bfbd312714207f7c0bef5c7 PyMySQL-0.7.2.tar.gz
+# Locally calculated:
+sha256 bd7acb4990dbf097fae3417641f93e25c690e01ed25c3ed32ea638d6c3ac04ba  PyMySQL-0.7.2.tar.gz
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
new file mode 100644
index 0000000..e58ff7e
--- /dev/null
+++ b/package/python-pymysql/python-pymysql.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pymysql
+#
+################################################################################
+
+PYTHON_PYMYSQL_VERSION = 0.7.2
+PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
+PYTHON_PYMYSQL_SITE = https://pypi.python.org/packages/source/P/PyMySQL
+PYTHON_PYMYSQL_LICENSE = MIT
+PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
+PYTHON_PYMYSQL_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.5.0
