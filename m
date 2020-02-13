From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 23:26:14 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: new package
Message-ID: <20200213062614.17118-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pure Python CBOR (de)serializer with extensive tag support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-cbor2/Config.in         |  6 ++++++
 package/python-cbor2/python-cbor2.hash |  5 +++++
 package/python-cbor2/python-cbor2.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-cbor2/Config.in
 create mode 100644 package/python-cbor2/python-cbor2.hash
 create mode 100644 package/python-cbor2/python-cbor2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cb13035bc4..e509f14dc2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1164,6 +1164,7 @@ F:	package/python-aiozipkin/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
+F:	package/python-cbor2/
 F:	package/python-cchardet/
 F:	package/python-frozenlist/
 F:	package/python-janus/
diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..ebebf3e572 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -882,6 +882,7 @@ menu "External python modules"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-cbor/Config.in"
+	source "package/python-cbor2/Config.in"
 	source "package/python-cchardet/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
diff --git a/package/python-cbor2/Config.in b/package/python-cbor2/Config.in
new file mode 100644
index 0000000000..ba9383f787
--- /dev/null
+++ b/package/python-cbor2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CBOR2
+	bool "python-cbor2"
+	help
+	  Pure Python CBOR (de)serializer with extensive tag support.
+
+	  https://cbor2.readthedocs.io/
diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
new file mode 100644
index 0000000000..abc049b82e
--- /dev/null
+++ b/package/python-cbor2/python-cbor2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cbor2/json
+md5	47653309cff623382c770841847dafaf  cbor2-5.0.1.tar.gz
+sha256	4299db69e5ac7b3026abb2a639737c72804511130ced81f660a9cb9222352dba  cbor2-5.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
new file mode 100644
index 0000000000..d504e33d2d
--- /dev/null
+++ b/package/python-cbor2/python-cbor2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cbor2
+#
+################################################################################
+
+PYTHON_CBOR2_VERSION = 5.0.1
+PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/3e/2c/188d040bd4cf99012d0e847a3d95bf1ef1f783859b09eb9f736950af84f0
+PYTHON_CBOR2_SETUP_TYPE = setuptools
+PYTHON_CBOR2_LICENSE = MIT
+PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.20.1
