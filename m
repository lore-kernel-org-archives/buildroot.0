From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 26 Jun 2020 14:30:49 +0200
Subject: [Buildroot] [PATCH 2/6] python-m2crypto: bump version
In-Reply-To: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
References: <20200626123053.30626-1-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200626123053.30626-3-dev.kurt@vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/python-m2crypto/python-m2crypto.hash |  5 ++---
 package/python-m2crypto/python-m2crypto.mk   | 16 +++-------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 4ac180f870..91a6f722ca 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,3 +1,2 @@
-# md5 from https://pypi.python.org/pypi/M2Crypto/, sha256 locally computed
-md5 8e87235942c76d1ba9f999ee33764fdb M2Crypto-0.24.0.tar.gz
-sha256 80a56441a1d2c0cf27e725be7554c92598b938fc8767ee2c71fdbc2fdc055ee8 M2Crypto-0.24.0.tar.gz
+# sha256 locally computed
+sha256 4c6ad45ffb88670c590233683074f2440d96aaccb05b831371869fc387cbd127  M2Crypto-0.35.2.tar.gz
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 3d0e54eb4e..b98a2f4040 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.24.0
-PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
+PYTHON_M2CRYPTO_VERSION = 0.35.2
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/74/18/3beedd4ac48b52d1a4d12f2a8c5cf0ae342ce974859fba838cbbc1580249
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
@@ -13,19 +13,9 @@ HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
 
-# We need to use python2 because m2crypto is not python3 compliant.
 HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
 
-# The --openssl option that allows to specify a custom path to OpenSSL
-# can only be used with the non-default build_ext setup.py command,
-# and calling this command directly fails. To work around this, simply
-# hardcode the path to OpenSSL in setup.py.
-# Bug reported at https://gitlab.com/m2crypto/m2crypto/issues/89
-define HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
-	$(SED) "s%self.openssl = '/usr'%self.openssl = '$(HOST_DIR)/usr'%" \
-		$(@D)/setup.py
-endef
 
-HOST_PYTHON_M2CRYPTO_POST_PATCH_HOOKS += HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
+HOST_PYTHON_M2CRYPTO_BUILD_OPTS = --openssl $(HOST_DIR)
 
 $(eval $(host-python-package))
-- 
2.25.0
