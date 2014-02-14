From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:50:59 +0100
Subject: [Buildroot] [git commit] pkg-python: simplifications after the
	Python 2.x bump
Message-ID: <20140228133413.6BAE49BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f8c85569739492ffc8c3b1e04b4ae007e5cb02a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to the Python 2.x bump, it is no longer needed to pass
PYTHONCPREFIX, and CROSS_COMPILING when building third-party Python
modules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index c423f7a..a862895 100644
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
