From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Wed, 24 Apr 2019 10:59:39 +0200
Subject: [Buildroot] [PATCH] package/python-pytest: new package
Message-ID: <1556096379-32178-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/python-pytest/Config.in          |  9 +++++++++
 package/python-pytest/python-pytest.hash |  2 ++
 package/python-pytest/python-pytest.mk   | 15 +++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/python-pytest/Config.in
 create mode 100644 package/python-pytest/python-pytest.hash
 create mode 100644 package/python-pytest/python-pytest.mk

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
new file mode 100644
index 0000000..db69027
--- /dev/null
+++ b/package/python-pytest/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYTEST
+	bool "python-pytest"
+    help
+	  The pytest framework makes it easy to write small tests, 
+	  yet scales to support complex functional testing for 
+	  applications and libraries.
+
+	  https://pypi.org/project/pytest/
+
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
new file mode 100644
index 0000000..5e072d7
--- /dev/null
+++ b/package/python-pytest/python-pytest.hash
@@ -0,0 +1,2 @@
+# sha256 from https://pypi.org/project/pytest/#files
+sha256 b7802283b70ca24d7119b32915efa7c409982f59913c1a6c0640aacf118b95f5 pytest-4.4.1.tar.gz
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
new file mode 100644
index 0000000..b6cafda
--- /dev/null
+++ b/package/python-pytest/python-pytest.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pytest
+#
+################################################################################
+
+PYTHON_PYTEST_VERSION = 4.4.1
+PYTHON_PYTEST_SOURCE = pytest-$(PYTHON3_PYTEST_VERSION).tar.gz
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/2b/b1/c9a84f79fc3bad226a9085289da11ecdd9bd2779a2c654195962b37d4110/
+PYTHON_PYTEST_LICENSE = MIT
+PYTHON_PYTEST_LICENSE_FILES = LICENSE
+PYTHON_PYTEST_SETUP_TYPE = setuptools
+PYTHON_DEPENDENCIES = python3-setuptools-scm
+
+$(eval $(python-package))
-- 
2.7.4
