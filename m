From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:45 +0200
Subject: [Buildroot] [RFC v4 11/16] pkg-python: add GCC_SYSROOT variable to
	add pps support
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-12-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging feature, add the GCC_SYSROOT
environment variable to the python packages.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-python.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 426301a..126846e 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -27,6 +27,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
+	GCC_SYSROOT="$(STAGING_DIR)" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -51,6 +52,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH) \
+	GCC_SYSROOT="$(STAGING_DIR)" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
-- 
2.4.3
