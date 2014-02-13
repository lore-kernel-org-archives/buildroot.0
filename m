From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:48:51 +0100
Subject: [Buildroot] [PATCHv1 02/26] pkg-python: use the newly defined
	PYTHON_PATH variable
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the Python package exposes its PYTHON_PATH variable, we can
use it in the package infrastructure. This prepares both the upcoming
bump of Python 2.x, and the introduction of Python 3 support in the
Python package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 9b3c97a..2153534 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -48,7 +48,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH="$(TARGET_PATH)" \
-	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	PYTHONPATH="$(PYTHON_PATH)" \
 	PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
 	CROSS_COMPILING=yes \
 	_python_sysroot=$(STAGING_DIR) \
-- 
1.8.3.2
