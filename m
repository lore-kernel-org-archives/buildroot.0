From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 25 Oct 2016 20:25:34 +0200
Subject: [Buildroot] [PATCH 1/2] python-jsonschema: new package
Message-ID: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An implementation of JSON Schema validation for Python.

http://github.com/Julian/jsonschema

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in                                |  1 +
 package/python-jsonschema/Config.in              |  6 ++++++
 package/python-jsonschema/python-jsonschema.hash |  3 +++
 package/python-jsonschema/python-jsonschema.mk   | 16 ++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-jsonschema/Config.in
 create mode 100644 package/python-jsonschema/python-jsonschema.hash
 create mode 100644 package/python-jsonschema/python-jsonschema.mk

diff --git a/package/Config.in b/package/Config.in
index 9399f63..c10b577 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -698,6 +698,7 @@ menu "External python modules"
 	source "package/python-ipython/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-jinja2/Config.in"
+	source "package/python-jsonschema/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
new file mode 100644
index 0000000..7002653
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
index 0000000..fc13630
--- /dev/null
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/jsonschema/json, sha256 locally computed
+md5	374e848fdb69a3ce8b7e778b47c30640  jsonschema-2.5.1.tar.gz
+sha256	36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41  jsonschema-2.5.1.tar.gz
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
new file mode 100644
index 0000000..ec34a6e
--- /dev/null
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-jsonschema
+#
+################################################################################
+
+PYTHON_JSONSCHEMA_VERSION = 2.5.1
+PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
+PYTHON_JSONSCHEMA_SITE = \
+	https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7
+PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools
+PYTHON_JSONSCHEMA_LICENSE = MIT
+PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.5.0
