From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:18:28 +0200
Subject: [Buildroot] [git commit] python-pymysql: new package
Message-ID: <20160413201842.091A581DDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d06ec8b514cd593c71cbf624f127c7bd65af2fd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add python to MySQL connection software, written in pure python

Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-pymysql/Config.in           |  7 +++++++
 package/python-pymysql/python-pymysql.hash |  4 ++++
 package/python-pymysql/python-pymysql.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 64822bf..72ce1ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -701,6 +701,7 @@ menu "External python modules"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pymysql/Config.in"
 	source "package/python-pynacl/Config.in"
 	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
diff --git a/package/python-pymysql/Config.in b/package/python-pymysql/Config.in
new file mode 100644
index 0000000..75b447c
--- /dev/null
+++ b/package/python-pymysql/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYMYSQL
+	bool "python-pymysql"
+	help
+	  PyMySQL is a pure-Python MySQL client library. It follows
+	  the DB-API 2.0.
+
+	  https://pypi.python.org/pypi/PyMySQL/
diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
new file mode 100644
index 0000000..fc7e5e3
--- /dev/null
+++ b/package/python-pymysql/python-pymysql.hash
@@ -0,0 +1,4 @@
+#md5 from https://pypi.python.org/pypi?:action=show_md5&digest=6d757cda8bfbd312714207f7c0bef5c7
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
