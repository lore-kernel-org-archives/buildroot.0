From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 30 Apr 2020 00:42:24 +0200
Subject: [Buildroot] [PATCH 3/4] package/python-pytest: new package
In-Reply-To: <20200429224225.2454330-1-m.niestroj@grinn-global.com>
References: <20200429224225.2454330-1-m.niestroj@grinn-global.com>
Message-ID: <20200429224225.2454330-4-m.niestroj@grinn-global.com>
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
index ea53c55d41..2e14053559 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1600,6 +1600,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-packaging/
 F:	package/python-pluggy/
+F:	package/python-pytest/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/test_netdata.py
diff --git a/package/Config.in b/package/Config.in
index 14334e450d..24ad43d36a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1111,6 +1111,7 @@ menu "External python modules"
 	source "package/python-pysocks/Config.in"
 	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
+	source "package/python-pytest/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
new file mode 100644
index 0000000000..a655a9e901
--- /dev/null
+++ b/package/python-pytest/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_PYTEST
+	bool "python-pytest"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_COLORAMA # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
+	select BR2_PACKAGE_PYTHON_PY # runtime
+	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
+	help
+	  pytest is a framework that makes building simple and scalable
+	  tests easy. Tests are expressive and readable?no boilerplate
+	  code required.
+
+	  https://docs.pytest.org/en/latest/
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
new file mode 100644
index 0000000000..ebcac1f910
--- /dev/null
+++ b/package/python-pytest/python-pytest.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pytest/json
+md5	f0d3c0e6f71cfe53e24c736c4ceb7725  pytest-5.4.1.tar.gz
+sha256	84dde37075b8805f3d1f392cc47e38a0e59518fb46a431cfdaf7cf1ce805f970  pytest-5.4.1.tar.gz
+# Locally computer sha256
+sha256	7898b9b164d4f93fd9a562fd0f592935518b48c4745303964110eb7f7fe64faf  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
new file mode 100644
index 0000000000..9d3f271540
--- /dev/null
+++ b/package/python-pytest/python-pytest.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pytest
+#
+################################################################################
+
+PYTHON_PYTEST_VERSION = 5.4.1
+PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/6d/4e/572aed20422dee7fa2bd27995b2a53a32de90c1826e5531c9df6d3ea77ed
+PYTHON_PYTEST_SETUP_TYPE = setuptools
+PYTHON_PYTEST_LICENSE = MIT
+PYTHON_PYTEST_LICENSE_FILES = LICENSE
+PYTHON_PYTEST_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.26.2
