From: Dick Olsson <hi@senzilla.io>
Date: Wed, 22 Jul 2020 07:11:26 +0000
Subject: [Buildroot] [PATCH v2 2/4] package/python3-pycryptodomex: new
 package
Message-ID: <20200722071030.16128-3-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package will ensure that pycryptodomex is built for Python 3.
Comments in both python-pycryptodome and python3-pycryptodomex are added
to ensure they stay in sync.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../python-pycryptodomex.mk                   |  1 +
 package/python3-pycryptodomex/Config.in       |  6 ++++++
 .../python3-pycryptodomex.hash                |  4 ++++
 .../python3-pycryptodomex.mk                  | 21 +++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python3-pycryptodomex/Config.in
 create mode 100644 package/python3-pycryptodomex/python3-pycryptodomex.hash
 create mode 100644 package/python3-pycryptodomex/python3-pycryptodomex.mk

diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 7f93d93131..5123acb8ec 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
 PYTHON_PYCRYPTODOMEX_VERSION = 3.9.8
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
 PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
diff --git a/package/python3-pycryptodomex/Config.in b/package/python3-pycryptodomex/Config.in
new file mode 100644
index 0000000000..4f16333125
--- /dev/null
+++ b/package/python3-pycryptodomex/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON3_PYCRYPTODOMEX
+	bool "python3-pycryptodomex"
+	help
+	  Cryptographic library for Python 3.
+
+	  http://www.pycryptodome.org
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.hash b/package/python3-pycryptodomex/python3-pycryptodomex.hash
new file mode 100644
index 0000000000..dc428fe5f8
--- /dev/null
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.hash
@@ -0,0 +1,4 @@
+# Locally computed sha256 checksums
+sha256	d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
+sha256	8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
+sha256  48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9  pycryptodomex-3.9.8.tar.gz
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
new file mode 100644
index 0000000000..fd6b04e85b
--- /dev/null
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python3-pycryptodomex
+#
+################################################################################
+
+# Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.9.8
+PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
+PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
+PYTHON3_PYCRYPTODOMEX_LICENSE = \
+	BSD-2-Clause, \
+	Public Domain (pycrypto original code), \
+	OCB patent license (OCB mode)
+PYTHON3_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
+HOST_PYTHON3_PYCRYPTODOMEX_DL_SUBDIR = python-pycryptodomex
+HOST_PYTHON3_PYCRYPTODOMEX_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1
