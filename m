From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 26 Jun 2020 14:30:50 +0200
Subject: [Buildroot] [PATCH 3/6] python3-m2crypto: move from python-m2crypto
In-Reply-To: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
References: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200626123053.30626-4-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wireless-regdb does not compile using python2.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/python-m2crypto/python-m2crypto.mk    | 21 -------------------
 .../python3-m2crypto.hash}                    |  0
 package/python3-m2crypto/python3-m2crypto.mk  | 21 +++++++++++++++++++
 3 files changed, 21 insertions(+), 21 deletions(-)
 delete mode 100644 package/python-m2crypto/python-m2crypto.mk
 rename package/{python-m2crypto/python-m2crypto.hash => python3-m2crypto/python3-m2crypto.hash} (100%)
 create mode 100644 package/python3-m2crypto/python3-m2crypto.mk

diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
deleted file mode 100644
index b98a2f4040..0000000000
--- a/package/python-m2crypto/python-m2crypto.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# python-m2crypto
-#
-################################################################################
-
-PYTHON_M2CRYPTO_VERSION = 0.35.2
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/74/18/3beedd4ac48b52d1a4d12f2a8c5cf0ae342ce974859fba838cbbc1580249
-PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
-HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
-
-PYTHON_M2CRYPTO_LICENSE = MIT
-PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
-
-HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
-
-
-HOST_PYTHON_M2CRYPTO_BUILD_OPTS = --openssl $(HOST_DIR)
-
-$(eval $(host-python-package))
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python3-m2crypto/python3-m2crypto.hash
similarity index 100%
rename from package/python-m2crypto/python-m2crypto.hash
rename to package/python3-m2crypto/python3-m2crypto.hash
diff --git a/package/python3-m2crypto/python3-m2crypto.mk b/package/python3-m2crypto/python3-m2crypto.mk
new file mode 100644
index 0000000000..17b36fa9aa
--- /dev/null
+++ b/package/python3-m2crypto/python3-m2crypto.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python3-m2crypto
+#
+################################################################################
+
+PYTHON3_M2CRYPTO_VERSION = 0.35.2
+PYTHON3_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/74/18/3beedd4ac48b52d1a4d12f2a8c5cf0ae342ce974859fba838cbbc1580249
+PYTHON3_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON3_M2CRYPTO_VERSION).tar.gz
+PYTHON3_M2CRYPTO_SETUP_TYPE = setuptools
+HOST_PYTHON3_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
+
+PYTHON3_M2CRYPTO_LICENSE = MIT
+PYTHON3_M2CRYPTO_LICENSE_FILES = LICENCE
+
+HOST_PYTHON3_M2CRYPTO_NEEDS_HOST_PYTHON = python3
+
+
+HOST_PYTHON3_M2CRYPTO_BUILD_OPTS = --openssl $(HOST_DIR)
+
+$(eval $(host-python-package))
-- 
2.25.0
