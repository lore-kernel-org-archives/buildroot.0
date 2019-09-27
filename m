From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:42:14 +0200
Subject: [Buildroot] [git commit] package/python-sqlparse: new package
Message-ID: <20190927214414.9A13F8F950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b11bcfffdfd42721637b650275d261fe542c0958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sqlparse is a non-validating SQL parser for Python. It provides support for
parsing, splitting and formatting SQL statements.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-sqlparse/Config.in            |  8 ++++++++
 package/python-sqlparse/python-sqlparse.hash |  5 +++++
 package/python-sqlparse/python-sqlparse.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 393b617ca0..e572d40d68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -60,6 +60,7 @@ F:	package/python-mutagen/
 F:	package/python-pip/
 F:	package/python-psycopg2/
 F:	package/python-sqlalchemy/
+F:	package/python-sqlparse/
 F:	package/python-visitor/
 F:	package/restorecond/
 F:	package/refpolicy/
diff --git a/package/Config.in b/package/Config.in
index 8515eadbd0..69864df434 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1084,6 +1084,7 @@ menu "External python modules"
 	source "package/python-sortedcontainers/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
+	source "package/python-sqlparse/Config.in"
 	source "package/python-subprocess32/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
diff --git a/package/python-sqlparse/Config.in b/package/python-sqlparse/Config.in
new file mode 100644
index 0000000000..498b33ae00
--- /dev/null
+++ b/package/python-sqlparse/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SQLPARSE
+	bool "python-sqlparse"
+	help
+	  sqlparse is a non-validating SQL parser for Python.
+	  It provides support for parsing, splitting and formatting
+	  SQL statements.
+
+	  https://github.com/andialbrecht/sqlparse
diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
new file mode 100644
index 0000000000..a03abe342b
--- /dev/null
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sqlparse/json
+md5	2ce34181d6b7b234c9f3c0ecd1ffb93e  sqlparse-0.3.0.tar.gz
+sha256	7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873  sqlparse-0.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256	c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
new file mode 100644
index 0000000000..22111dfc41
--- /dev/null
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sqlparse
+#
+################################################################################
+
+PYTHON_SQLPARSE_VERSION = 0.3.0
+PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/63/c8/229dfd2d18663b375975d953e2bdc06d0eed714f93dcb7732f39e349c438
+PYTHON_SQLPARSE_SETUP_TYPE = setuptools
+PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
+PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
