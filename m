From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:48:54 +0100
Subject: [Buildroot] [PATCHv1 05/26] pkg-python: simplifications after the
	Python 2.x bump
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the Python 2.x bump, it is no longer needed to pass
PYTHONCPREFIX, and CROSS_COMPILING when building third-party Python
modules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b4de56d..9c8767f 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -27,7 +27,6 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
-	CROSS_COMPILING=yes \
 	PYTHONPATH="$(PYTHON_PATH)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
@@ -50,8 +49,6 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH="$(TARGET_PATH)" \
 	PYTHONPATH="$(PYTHON_PATH)" \
-	PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
-	CROSS_COMPILING=yes \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -64,8 +61,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 
 # Host setuptools-based packages
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
-	PATH="$(HOST_PATH)" \
-	PYTHONXCPREFIX="$(HOST_DIR)/usr/"
+	PATH="$(HOST_PATH)"
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 	--prefix=$(HOST_DIR)/usr
-- 
1.8.3.2
