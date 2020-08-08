From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:58:01 +0200
Subject: [Buildroot] [git commit] package/python3-pycryptodomex: new package
Message-ID: <20200808220819.89F74813C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd78244174d42e7970b28044326c3f438da841cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package will ensure that pycryptodomex is built for Python 3.
Comments in both python-pycryptodome and python3-pycryptodomex are
added to ensure they stay in sync.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycryptodomex/python-pycryptodomex.mk |  1 +
 .../python3-pycryptodomex/python3-pycryptodomex.hash |  1 +
 .../python3-pycryptodomex/python3-pycryptodomex.mk   | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 7f93d93131..5123acb8ec 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
 PYTHON_PYCRYPTODOMEX_VERSION = 3.9.8
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
 PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.hash b/package/python3-pycryptodomex/python3-pycryptodomex.hash
new file mode 120000
index 0000000000..0c6761d8a4
--- /dev/null
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.hash
@@ -0,0 +1 @@
+../python-pycryptodomex/python-pycryptodomex.hash
\ No newline at end of file
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
new file mode 100644
index 0000000000..92ac248d51
--- /dev/null
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python3-pycryptodomex
+#
+################################################################################
+
+# Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.9.8
+PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
+PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
+PYTHON3_PYCRYPTODOMEX_LICENSE = \
+	BSD-2-Clause, \
+	Public Domain (pycrypto original code), \
+	OCB patent license (OCB mode)
+PYTHON3_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
+HOST_PYTHON3_PYCRYPTODOMEX_DL_SUBDIR = python-pycryptodomex
+HOST_PYTHON3_PYCRYPTODOMEX_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
