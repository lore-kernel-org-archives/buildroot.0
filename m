From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 12 Jun 2020 07:31:08 +0200
Subject: [Buildroot] [PATCH 1/3] python3-m2crypto: import package
In-Reply-To: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
References: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200612053110.15316-2-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/python3-m2crypto/python3-m2crypto.mk | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/python3-m2crypto/python3-m2crypto.mk

diff --git a/package/python3-m2crypto/python3-m2crypto.mk b/package/python3-m2crypto/python3-m2crypto.mk
new file mode 100644
index 0000000000..4394226067
--- /dev/null
+++ b/package/python3-m2crypto/python3-m2crypto.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python3-m2crypto
+#
+################################################################################
+
+# Please keep in sync with
+PYTHON3_M2CRYPTO_VERSION = 0.35.2
+PYTHON3_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON3_M2CRYPTO_VERSION).tar.gz
+PYTHON3_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/74/18/3beedd4ac48b52d1a4d12f2a8c5cf0ae342ce974859fba838cbbc1580249
+PYTHON3_M2CRYPTO_SETUP_TYPE = setuptools
+PYTHON3_M2CRYPTO_LICENSE = MIT
+PYTHON3_M2CRYPTO_LICENSE_FILES = LICENSE
+HOST_PYTHON3_M2CRYPTO_DL_SUBDIR = python-m2crypto
+HOST_PYTHON3_M2CRYPTO_NEEDS_HOST_PYTHON = python3
+
+HOST_PYTHON3_M2CRYPTO_DEPENDENCIES = host-swig
+
+HOST_PYTHON3_M2CRYPTO_BUILD_OPTS = --openssl $(HOST_DIR)
+
+$(eval $(host-python-package))
-- 
2.25.0
