From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  6 Mar 2018 22:03:25 +0200
Subject: [Buildroot] [PATCH 1/1] python-jsonmodels: new package
Message-ID: <20180306200325.9532-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package to create and handle json structures in Python,
with very easy and convenient API.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                                       |  3 +++
 package/Config.in                                |  1 +
 package/python-jsonmodels/Config.in              |  9 +++++++++
 package/python-jsonmodels/python-jsonmodels.hash |  4 ++++
 package/python-jsonmodels/python-jsonmodels.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-jsonmodels/Config.in
 create mode 100644 package/python-jsonmodels/python-jsonmodels.hash
 create mode 100644 package/python-jsonmodels/python-jsonmodels.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1baa933ee3..f3590f8b52 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -178,6 +178,9 @@ F:	package/python-bottle/
 F:	package/sqlcipher/
 F:	package/stress/
 
+N:	Asaf Kahlon <asafka7@gmail.com>
+F:	package/python-jsonmodels/
+
 N:	Ash Charles <ash.charles@savoirfairelinux.com>
 F:	package/pru-software-support/
 F:	package/ti-cgt-pru/
diff --git a/package/Config.in b/package/Config.in
index 12d3d2bbff..6abbb43e38 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -805,6 +805,7 @@ menu "External python modules"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jinja2/Config.in"
+	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
diff --git a/package/python-jsonmodels/Config.in b/package/python-jsonmodels/Config.in
new file mode 100644
index 0000000000..d840e2acfe
--- /dev/null
+++ b/package/python-jsonmodels/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_JSONMODELS
+	bool "python-jsonmodels"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Models to make easier to deal with structures that are converted
+	  to, or read from JSON.
+
+	  https://github.com/beregond/jsonmodels
diff --git a/package/python-jsonmodels/python-jsonmodels.hash b/package/python-jsonmodels/python-jsonmodels.hash
new file mode 100644
index 0000000000..f5b1ac5ef1
--- /dev/null
+++ b/package/python-jsonmodels/python-jsonmodels.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/jsonmodels/json, sha256 locally computed
+md5	e42b6c0078e731035ec3f1bf8a6cdc92  jsonmodels-2.3.tar.gz
+sha256	09e9639c85531e0f37991bb23a363494e37a2e89fb480dbc03d9556258f4ea47  jsonmodels-2.3.tar.gz
+sha256	3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
diff --git a/package/python-jsonmodels/python-jsonmodels.mk b/package/python-jsonmodels/python-jsonmodels.mk
new file mode 100644
index 0000000000..4d4da87969
--- /dev/null
+++ b/package/python-jsonmodels/python-jsonmodels.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jsonmodels
+#
+################################################################################
+
+PYTHON_JSONMODELS_VERSION = 2.3
+PYTHON_JSONMODELS_SOURCE = jsonmodels-$(PYTHON_JSONMODELS_VERSION).tar.gz
+PYTHON_JSONMODELS_SITE = https://pypi.python.org/packages/ab/0f/e214845b49881d3b2bebd1f387eedc5b26ac5580353a0a38074e94439957
+PYTHON_JSONMODELS_SETUP_TYPE = setuptools
+PYTHON_JSONMODELS_LICENSE = BSD-3-Clause
+PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.14.1
