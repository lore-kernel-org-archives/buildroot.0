From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  1 Sep 2020 19:16:44 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/python-pytest: new package
In-Reply-To: <20200901171645.708587-1-m.niestroj@grinn-global.com>
References: <20200901171645.708587-1-m.niestroj@grinn-global.com>
Message-ID: <20200901171645.708587-4-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pytest/Config.in          | 16 ++++++++++++++++
 package/python-pytest/python-pytest.hash |  5 +++++
 package/python-pytest/python-pytest.mk   | 15 +++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/python-pytest/Config.in
 create mode 100644 package/python-pytest/python-pytest.hash
 create mode 100644 package/python-pytest/python-pytest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bdbaf551f3..928b259428 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1614,6 +1614,7 @@ F:	package/python-ansicolors/
 F:	package/python-iniconfig/
 F:	package/python-packaging/
 F:	package/python-pluggy/
+F:	package/python-pytest/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/test_netdata.py
diff --git a/package/Config.in b/package/Config.in
index 3c5b5cb255..4c64a0e944 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1118,6 +1118,7 @@ menu "External python modules"
 	source "package/python-pysocks/Config.in"
 	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
+	source "package/python-pytest/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
new file mode 100644
index 0000000000..ad57547a1b
--- /dev/null
+++ b/package/python-pytest/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_PYTEST
+	bool "python-pytest"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
+	select BR2_PACKAGE_PYTHON_PY # runtime
+	select BR2_PACKAGE_PYTHON_TOML # runtime
+	help
+	  pytest is a framework that makes building simple and scalable
+	  tests easy. Tests are expressive and readable?no boilerplate
+	  code required.
+
+	  https://docs.pytest.org/en/latest/
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
new file mode 100644
index 0000000000..6f3532a590
--- /dev/null
+++ b/package/python-pytest/python-pytest.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pytest/json
+md5	c3e7c811b2b74c60bb5fb951229ebce9  pytest-6.0.1.tar.gz
+sha256	85228d75db9f45e06e57ef9bf4429267f81ac7c0d742cc9ed63d09886a9fe6f4  pytest-6.0.1.tar.gz
+# Locally computer sha256
+sha256	7898b9b164d4f93fd9a562fd0f592935518b48c4745303964110eb7f7fe64faf  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
new file mode 100644
index 0000000000..c17d579f8c
--- /dev/null
+++ b/package/python-pytest/python-pytest.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pytest
+#
+################################################################################
+
+PYTHON_PYTEST_VERSION = 6.0.1
+PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/20/4c/d7b19b8661be78461fff0392e33943784340424921578fe1bf300ef59831
+PYTHON_PYTEST_SETUP_TYPE = setuptools
+PYTHON_PYTEST_LICENSE = MIT
+PYTHON_PYTEST_LICENSE_FILES = LICENSE
+PYTHON_PYTEST_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.28.0
