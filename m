From: Chan, Donald <hoiho@lab126.com>
Date: Thu, 20 May 2021 01:49:43 +0000
Subject: [Buildroot] [PATCH 5/5] package/python3-cryptography: add python3
 host variant
Message-ID: <1621475383746.46545@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a python3 host variant since another downstream OSS component
(OP-TEE) uses buildroot and it will depend on a python3 host variant
of python-cryptography.

Signed-off-by: Donald Chan <hoiho@lab126.com>
---
 .../python3-cryptography.hash                 |  1 +
 .../python3-cryptography.mk                   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 120000 package/python3-cryptography/python3-cryptography.hash
 create mode 100644 package/python3-cryptography/python3-cryptography.mk

diff --git a/package/python3-cryptography/python3-cryptography.hash b/package/python3-cryptography/python3-cryptography.hash
new file mode 120000
index 0000000..73fa25f
--- /dev/null
+++ b/package/python3-cryptography/python3-cryptography.hash
@@ -0,0 +1 @@
+../python-cryptography/python-cryptography.hash
\ No newline at end of file
diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
new file mode 100644
index 0000000..ce8e9e6
--- /dev/null
+++ b/package/python3-cryptography/python3-cryptography.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python3-cryptography
+#
+################################################################################
+
+# Please keep in sync with package/python-cryptography/python-cryptography.mk
+PYTHON3_CRYPTOGRAPHY_VERSION = 3.0
+PYTHON3_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION).tar.gz
+PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
+PYTHON3_CRYPTOGRAPHY_SETUP_TYPE = setuptools
+PYTHON3_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
+PYTHON3_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = openssl
+HOST_PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python3-pip host-python3-six
+HOST_PYTHON3_CRYPTOGRAPHY_DL_SUBDIR = python-cryptography
+HOST_PYTHON3_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.17.1
