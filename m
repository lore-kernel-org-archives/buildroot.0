From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 14:00:43 +0100
Subject: [Buildroot] [git commit] python-json-schema-validator: new package
Message-ID: <20131215130826.A90D09C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50872e2dbef90a1326430ae8702ca25baf35de8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: convert to the Python package infrastructure, fix license
informations.]
[Peter: there is no LICENSE.txt]
Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/python-json-schema-validator/Config.in     |    8 ++++++++
 .../python-json-schema-validator.mk                |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 097ae79..4d5ae7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -392,6 +392,7 @@ source "package/python-dialog/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
+source "package/python-json-schema-validator/Config.in"
 source "package/python-keyring/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
diff --git a/package/python-json-schema-validator/Config.in b/package/python-json-schema-validator/Config.in
new file mode 100644
index 0000000..6ae1eb1
--- /dev/null
+++ b/package/python-json-schema-validator/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
+	bool "python-json-schema-validator"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_VERSIONTOOLS
+	help
+	  JSON Schema Validator
+
+	  https://pypi.python.org/pypi/json-schema-validator
diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
new file mode 100644
index 0000000..472b1c0
--- /dev/null
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-json-schema-validator
+#
+################################################################################
+
+PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.3
+PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
+PYTHON_JSON_SCHEMA_VALIDATOR_SITE = http://pypi.python.org/packages/source/j/json-schema-validator/
+PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPLv3
+PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
+PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = python-versiontools
+
+$(eval $(python-package))
