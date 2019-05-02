From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  2 May 2019 10:20:07 +0200
Subject: [Buildroot] [PATCH 4/7] package/python-pytest: new package
In-Reply-To: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556785210-18237-5-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bcc requires python-bcc which itself
requires python-pytest.
The pytest framework makes it easy to write
small tests, yet scales to support complex
functional testing for applications and libraries.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/Config.in                        |  1 +
 package/python-pytest/Config.in          |  8 ++++++++
 package/python-pytest/python-pytest.hash |  5 +++++
 package/python-pytest/python-pytest.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-pytest/Config.in
 create mode 100644 package/python-pytest/python-pytest.hash
 create mode 100644 package/python-pytest/python-pytest.mk

diff --git a/package/Config.in b/package/Config.in
index dc63589..6afbe0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1016,6 +1016,7 @@ menu "External python modules"
 	source "package/python-pysocks/Config.in"
 	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
+	source "package/python-pytest/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
new file mode 100644
index 0000000..7db5493
--- /dev/null
+++ b/package/python-pytest/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYTEST
+	bool "python-pytest"
+	help
+	  The pytest framework makes it easy to write small tests,
+	  yet scales to support complex functional testing for
+	  applications and libraries.
+
+	  https://pypi.org/project/pytest/
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
new file mode 100644
index 0000000..43f9f98
--- /dev/null
+++ b/package/python-pytest/python-pytest.hash
@@ -0,0 +1,5 @@
+# sha256 from https://pypi.org/project/pytest/#files
+sha256 b7802283b70ca24d7119b32915efa7c409982f59913c1a6c0640aacf118b95f5 pytest-4.4.1.tar.gz
+
+# Locally calculated
+sha256	4be38574daf05665b6194e4fd84c5ef6ce7c3a2810308a5222d5cdffc2d04d18 LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
new file mode 100644
index 0000000..665951f
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
+PYTHON_PYTEST_DEPENDENCIES = python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.7.4
