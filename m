From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jul 2020 11:26:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/python3-cython: new package
Message-ID: <20200728092657.2354762-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-setools package needs to be built for the host-python3, even
when the target Python is not necessarily Python 3.x. Since it depends
on host-python-cython, we need a Python 3 variant of it, which this
patch introduces.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-cython/python-cython.mk     |  1 +
 package/python3-cython/python3-cython.hash |  1 +
 package/python3-cython/python3-cython.mk   | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 120000 package/python3-cython/python3-cython.hash
 create mode 100644 package/python3-cython/python3-cython.mk

diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index cf19e35b8b..d2b0812f62 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-cython/python3-cython.mk
 PYTHON_CYTHON_VERSION = 0.29.17
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
 PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/99/36/a3dc962cc6d08749aa4b9d85af08b6e354d09c5468a3e0edc610f44c856b
diff --git a/package/python3-cython/python3-cython.hash b/package/python3-cython/python3-cython.hash
new file mode 120000
index 0000000000..70dde64105
--- /dev/null
+++ b/package/python3-cython/python3-cython.hash
@@ -0,0 +1 @@
+../python-cython/python-cython.hash
\ No newline at end of file
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
new file mode 100644
index 0000000000..473a0f2d40
--- /dev/null
+++ b/package/python3-cython/python3-cython.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python3-cython
+#
+################################################################################
+
+# Please keep in sync with package/python-cython/python-cython.mk
+PYTHON3_CYTHON_VERSION = 0.29.17
+PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
+PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/99/36/a3dc962cc6d08749aa4b9d85af08b6e354d09c5468a3e0edc610f44c856b
+PYTHON3_CYTHON_SETUP_TYPE = setuptools
+PYTHON3_CYTHON_LICENSE = Apache-2.0
+PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
+HOST_PYTHON3_CYTHON_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.27.0
