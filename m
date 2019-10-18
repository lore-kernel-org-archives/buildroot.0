From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:16 +0300
Subject: [Buildroot] [PATCH 1/2] package/python-sqliteschema: new package
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-19-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-sqliteschema/Config.in              | 12 ++++++++++++
 .../python-sqliteschema/python-sqliteschema.hash   |  5 +++++
 package/python-sqliteschema/python-sqliteschema.mk | 14 ++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-sqliteschema/Config.in
 create mode 100644 package/python-sqliteschema/python-sqliteschema.hash
 create mode 100644 package/python-sqliteschema/python-sqliteschema.mk

diff --git a/package/Config.in b/package/Config.in
index a51313235c..ac02b84db4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1093,6 +1093,7 @@ menu "External python modules"
 	source "package/python-soupsieve/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
+	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
 	source "package/python-subprocess32/Config.in"
 	source "package/python-systemd/Config.in"
diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
new file mode 100644
index 0000000000..b9568adbea
--- /dev/null
+++ b/package/python-sqliteschema/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_SQLITESCHEMA
+	bool "python-sqliteschema"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
+	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
+	help
+	  A Python library to dump table schema of a SQLite database
+	  file.
+
+	  https://github.com/thombashi/sqliteschema
diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
new file mode 100644
index 0000000000..b25b0ae17a
--- /dev/null
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/sqliteschema/json
+md5	175afa008a628f6dc32392a72d4c6b74  sqliteschema-0.16.2.tar.gz
+sha256	023a443abdc12796928c04441fabbbe12e1fe8608f562b4650ae1f9a19504139  sqliteschema-0.16.2.tar.gz
+# Locally computed sha256 checksums
+sha256	7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
new file mode 100644
index 0000000000..890bfb9dc7
--- /dev/null
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sqliteschema
+#
+################################################################################
+
+PYTHON_SQLITESCHEMA_VERSION = 0.16.2
+PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/91/b6/87a9218d37afd061a8b26c0ec058299b85c3f859f1c80aff10752188e056
+PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
+PYTHON_SQLITESCHEMA_LICENSE = MIT
+PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
