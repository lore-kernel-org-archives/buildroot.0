From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  4 Jan 2020 15:50:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: new package
Message-ID: <20200104135043.774-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Data validation and settings management using python 3.6
type hinting.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-pydantic/Config.in            |  8 ++++++++
 package/python-pydantic/python-pydantic.hash |  5 +++++
 package/python-pydantic/python-pydantic.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-pydantic/Config.in
 create mode 100644 package/python-pydantic/python-pydantic.hash
 create mode 100644 package/python-pydantic/python-pydantic.mk

diff --git a/package/Config.in b/package/Config.in
index 6aac0f7e26..552a9490c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1045,6 +1045,7 @@ menu "External python modules"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pydal/Config.in"
+	source "package/python-pydantic/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
new file mode 100644
index 0000000000..07b506a20f
--- /dev/null
+++ b/package/python-pydantic/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYDANTIC
+	bool "python-pydantic"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Data validation and settings management using python 3.6
+	  type hinting.
+
+	  https://github.com/samuelcolvin/pydantic
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
new file mode 100644
index 0000000000..7bb076fe2f
--- /dev/null
+++ b/package/python-pydantic/python-pydantic.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pydantic/json
+md5	ce0c1824d1797bc7d67953428c4fe965  pydantic-1.3.tar.gz
+sha256	2eab7d548b0e530bf65bee7855ad8164c2f6a889975d5e9c4eefd1e7c98245dc  pydantic-1.3.tar.gz
+# Locally computed sha256 checksums
+sha256	66badbfe56618ec52ddcbfda62450e43752d16fe1e7cae78d346c7ed10a35306  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
new file mode 100644
index 0000000000..0f9dd66a6f
--- /dev/null
+++ b/package/python-pydantic/python-pydantic.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pydantic
+#
+################################################################################
+
+PYTHON_PYDANTIC_VERSION = 1.3
+PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/3e/69/b22c0eb3157115e1e3d111f574a6a41552539f1e53b064121ef4e9ac1368
+PYTHON_PYDANTIC_SETUP_TYPE = setuptools
+PYTHON_PYDANTIC_LICENSE = MIT
+PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1
