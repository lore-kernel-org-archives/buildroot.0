From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:55:41 +1300
Subject: [Buildroot] [git commit] python-jsonschema: new package
Message-ID: <20170124095724.E2CFC7FB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b949eb5448ea5782911ad2c2e6d8467862c3bc3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/python-jsonschema/Config.in              |  6 ++++++
 package/python-jsonschema/python-jsonschema.hash |  3 +++
 package/python-jsonschema/python-jsonschema.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index cc09fba..809c995 100644
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
index 0000000..0fb2be8
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
