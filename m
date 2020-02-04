From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 19:25:52 +0100
Subject: [Buildroot] [git commit] package/python-pydantic: new package
Message-ID: <20200204181858.17C788B6D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c686556324c9f50262bca2f2acd86121c631899a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Data validation and settings management using python 3.6
type hinting.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |  1 +
 package/python-pydantic/Config.in            |  8 ++++++++
 package/python-pydantic/python-pydantic.hash |  5 +++++
 package/python-pydantic/python-pydantic.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6f2c278af9..c444a17737 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1057,6 +1057,7 @@ menu "External python modules"
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
