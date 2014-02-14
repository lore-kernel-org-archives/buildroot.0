From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:41:15 +0100
Subject: [Buildroot] [git commit branch/next] pkg-python: also pass
	PYTHONPATH when building distutils packages
Message-ID: <20140214210327.875FE9CA1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=577e52ac087a1a3c63837d0da37c93949c455941
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the upcoming bump of Python 2.x, it will become important that
the PYTHONPATH is passed whenever we build third-party packages, be
they using the distutils build mechanism, or the setuptools build
mechanism. This is because passing PYTHONPATH is what will allow
Python to find a special Python module that contains all the
compiler/library/headers definitions that are relevant when
cross-compiling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 65c9b4a..c423f7a 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -28,6 +28,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	CROSS_COMPILING=yes \
+	PYTHONPATH="$(PYTHON_PATH)" \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
