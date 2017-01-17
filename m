From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 17 Jan 2017 11:17:23 +0100
Subject: [Buildroot] [PATCH 6/8] python-jsonschema: new package
In-Reply-To: <20170117101725.19629-1-yegorslists@googlemail.com>
References: <20170117101725.19629-1-yegorslists@googlemail.com>
Message-ID: <20170117101725.19629-6-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-jsonschema/Config.in              |  6 ++++++
 package/python-jsonschema/python-jsonschema.hash |  3 +++
 package/python-jsonschema/python-jsonschema.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-jsonschema/Config.in
 create mode 100644 package/python-jsonschema/python-jsonschema.hash
 create mode 100644 package/python-jsonschema/python-jsonschema.mk

diff --git a/package/Config.in b/package/Config.in
index 0f148af64..e0dbcee9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -705,6 +705,7 @@ menu "External python modules"
 	source "package/python-ipython/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jinja2/Config.in"
+	source "package/python-jsonschema/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
new file mode 100644
index 000000000..700265372
--- /dev/null
+++ b/package/python-jsonschema/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_JSONSCHEMA
+	bool "python-jsonschema"
+	help
+	  An implementation of JSON Schema validation for Python.
+
+	  http://github.com/Julian/jsonschema
diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
new file mode 100644
index 000000000..fc13630d6
--- /dev/null
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/jsonschema/json, sha256 locally computed
+md5	374e848fdb69a3ce8b7e778b47c30640  jsonschema-2.5.1.tar.gz
+sha256	36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41  jsonschema-2.5.1.tar.gz
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
new file mode 100644
index 000000000..0fb2be869
--- /dev/null
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-jsonschema
+#
+################################################################################
+
+PYTHON_JSONSCHEMA_VERSION = 2.5.1
+PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
+PYTHON_JSONSCHEMA_SITE = https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7
+PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools
+PYTHON_JSONSCHEMA_LICENSE = MIT
+PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
+PYTHON_JSONSCHEMA_DEPENDENCIES = host-python-vcversioner
+
+$(eval $(python-package))
-- 
2.11.0
