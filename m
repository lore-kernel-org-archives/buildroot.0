From: Peter Bouda <pbouda@cidles.eu>
Date: Thu, 28 May 2015 14:57:47 +0100
Subject: [Buildroot] [PATCH 1/1] python-cython: new package for host only
Message-ID: <1432821467-19253-1-git-send-email-pbouda@cidles.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an .mk file for Cython. The package is host-only, as
it is a dependency to pre-process Cython code on the host and
is not needed as Python package on the target. It was tested
with Python packages that require Cython. Packages that require it
can then just use:

PYTHON_FOO_DEPENDENCIES = host-python-cython

Signed-off-by: Peter Bouda <pbouda@cidles.eu>
---
 package/python-cython/python-cython.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/python-cython/python-cython.mk

diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
new file mode 100644
index 0000000..9c34890
--- /dev/null
+++ b/package/python-cython/python-cython.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cython
+#
+################################################################################
+
+PYTHON_CYTHON_VERSION = 0.21.2
+PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
+PYTHON_CYTHON_SITE = http://cython.org/release/
+PYTHON_CYTHON_SETUP_TYPE = distutils
+PYTHON_CYTHON_LICENSE = Apache-2.0
+PYTHON_CYTHON_LICENSE_FILES = LICENSE.txt
+
+$(eval $(host-python-package))
\ No newline at end of file
-- 
2.1.4
