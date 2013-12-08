From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:15:01 +0100
Subject: [Buildroot] [PATCH 32/38] python-json-schema-validator: new package
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-33-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

[Thomas: convert to the Python package infrastructure, fix license
informations.]

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                         |  1 +
 package/python-json-schema-validator/Config.in            |  8 ++++++++
 .../python-json-schema-validator.mk                       | 15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/python-json-schema-validator/Config.in
 create mode 100644 package/python-json-schema-validator/python-json-schema-validator.mk

diff --git a/package/Config.in b/package/Config.in
index d4819cf..1f45ea0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,6 +391,7 @@ source "package/python-dialog/Config.in"
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
index 0000000..55afcce
--- /dev/null
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-json-schema-validator
+#
+################################################################################
+
+PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.3
+PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE  = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
+PYTHON_JSON_SCHEMA_VALIDATOR_SITE = http://pypi.python.org/packages/source/j/json-schema-validator/
+PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPLv3
+PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE_FILES = LICENSE.txt
+PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
+PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = python-versiontools
+
+$(eval $(python-package))
-- 
1.8.1.2
