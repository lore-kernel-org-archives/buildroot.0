From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:48:52 +0100
Subject: [Buildroot] [PATCHv1 03/26] pkg-python: also pass PYTHONPATH when
	building distutils packages
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming bump of Python 2.x, it will become important that
the PYTHONPATH is passed whenever we build third-party packages, be
they using the distutils build mechanism, or the setuptools build
mechanism. This is because passing PYTHONPATH is what will allow
Python to find a special Python module that contains all the
compiler/library/headers definitions that are relevant when
cross-compiling.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 2153534..b4de56d 100644
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
-- 
1.8.3.2
