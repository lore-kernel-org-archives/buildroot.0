From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:40:38 +0100
Subject: [Buildroot] [git commit branch/next] pkg-python: use the newly
	defined PYTHON_PATH variable
Message-ID: <20140214210327.6E8549C9B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa50b8eee17600d328ad661d17252c7f7cc3dac4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that the Python package exposes its PYTHON_PATH variable, we can
use it in the package infrastructure. This prepares both the upcoming
bump of Python 2.x, and the introduction of Python 3 support in the
Python package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index f33980a..65c9b4a 100644
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
