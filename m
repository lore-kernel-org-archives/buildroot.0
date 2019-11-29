From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 13:29:07 -0800
Subject: [Buildroot] [PATCH/next 1/4] package/python-gitdb2: new package
Message-ID: <20191129212910.2537303-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

GitDB allows you to access bare git repositories for reading and writing.
It aims at allowing full access to loose objects as well as packs with
performance and scalability in mind. It operates exclusively on streams,
allowing to handle large objects with a small memory footprint.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-gitdb2/Config.in          | 13 +++++++++++++
 package/python-gitdb2/python-gitdb2.hash |  5 +++++
 package/python-gitdb2/python-gitdb2.mk   | 14 ++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/python-gitdb2/Config.in
 create mode 100644 package/python-gitdb2/python-gitdb2.hash
 create mode 100644 package/python-gitdb2/python-gitdb2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16e8510b0a..7397c80a83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -61,6 +61,7 @@ F:	package/python-channels-redis/
 F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
+F:	package/python-gitdb2/
 F:	package/python-mutagen/
 F:	package/python-pip/
 F:	package/python-psycopg2/
diff --git a/package/Config.in b/package/Config.in
index 37861387e8..15abe0871c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -923,6 +923,7 @@ menu "External python modules"
 	source "package/python-future/Config.in"
 	source "package/python-futures/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-gitdb2/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hiredis/Config.in"
diff --git a/package/python-gitdb2/Config.in b/package/python-gitdb2/Config.in
new file mode 100644
index 0000000000..a5962e7b77
--- /dev/null
+++ b/package/python-gitdb2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_GITDB2
+	bool "python-gitdb2"
+	select BR2_PACKAGE_PYTHON_SMMAP2 # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON  # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3  # runtime
+	help
+	  GitDB allows you to access bare git repositories for reading
+	  and writing. It aims at allowing full access to loose objects
+	  as well as packs with performance and scalability in mind. It
+	  operates exclusively on streams, allowing to handle large
+	  objects with a small memory footprint.
+
+	  https://github.com/gitpython-developers/gitdb
diff --git a/package/python-gitdb2/python-gitdb2.hash b/package/python-gitdb2/python-gitdb2.hash
new file mode 100644
index 0000000000..e97d25cf4f
--- /dev/null
+++ b/package/python-gitdb2/python-gitdb2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gitdb2/json
+md5	1a7ea3362e405f8a5634f7ee53636094  gitdb2-2.0.6.tar.gz
+sha256	1b6df1433567a51a4a9c1a5a0de977aa351a405cc56d7d35f3388bad1f630350  gitdb2-2.0.6.tar.gz
+# Locally computed sha256 checksums
+sha256	efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
diff --git a/package/python-gitdb2/python-gitdb2.mk b/package/python-gitdb2/python-gitdb2.mk
new file mode 100644
index 0000000000..d5293a2bd1
--- /dev/null
+++ b/package/python-gitdb2/python-gitdb2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gitdb2
+#
+################################################################################
+
+PYTHON_GITDB2_VERSION = 2.0.6
+PYTHON_GITDB2_SOURCE = gitdb2-$(PYTHON_GITDB2_VERSION).tar.gz
+PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/c5/62/ed7205331e8d7cc377e2512cb32f8f8f075c0defce767551d0a76e102ce2
+PYTHON_GITDB2_SETUP_TYPE = setuptools
+PYTHON_GITDB2_LICENSE = Sebastian Thiel and contributors
+PYTHON_GITDB2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.23.0
