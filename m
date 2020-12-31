From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:10:16 +0100
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: new package
Message-ID: <20201231135240.17AC484533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c4ad5ba2476b552698eaeb12a9f99e445478958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-pytest-asyncio/Config.in                  |  8 ++++++++
 package/python-pytest-asyncio/python-pytest-asyncio.hash |  5 +++++
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 263b57c308..104f44d40c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1604,6 +1604,7 @@ F:	package/python-intelhex/
 F:	package/python-packaging/
 F:	package/python-pluggy/
 F:	package/python-pytest/
+F:	package/python-pytest-asyncio/
 F:	package/python-typing-extensions/
 F:	package/python-xmodem/
 F:	package/rs485conf/
diff --git a/package/Config.in b/package/Config.in
index 30bb5814d2..1a85a891aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1137,6 +1137,7 @@ menu "External python modules"
 	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytest/Config.in"
+	source "package/python-pytest-asyncio/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
diff --git a/package/python-pytest-asyncio/Config.in b/package/python-pytest-asyncio/Config.in
new file mode 100644
index 0000000000..3fa90e4e18
--- /dev/null
+++ b/package/python-pytest-asyncio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYTEST_ASYNCIO
+	bool "python-pytest-asyncio"
+	depends on BR2_PACKAGE_PYTHON3 # pytest
+	select BR2_PACKAGE_PYTHON_PYTEST # runtime
+	help
+	  Pytest support for asyncio.
+
+	  https://github.com/pytest-dev/pytest-asyncio
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
new file mode 100644
index 0000000000..40541f54ba
--- /dev/null
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
+md5  b63593bc08f445f6e3f14c34128a68ed  pytest-asyncio-0.14.0.tar.gz
+sha256  9882c0c6b24429449f5f969a5158b528f39bde47dc32e85b9f0403965017e700  pytest-asyncio-0.14.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
new file mode 100644
index 0000000000..0645db3eb7
--- /dev/null
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pytest-asyncio
+#
+################################################################################
+
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.14.0
+PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/65/09/9472d4db0625cf56d40f4e405f955faf6469be00858a273b71332f3fcd1f
+PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
+PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
+PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
