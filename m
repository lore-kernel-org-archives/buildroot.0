From: Chan, Donald <hoiho@lab126.com>
Date: Thu, 20 May 2021 01:48:00 +0000
Subject: [Buildroot] [PATCH 2/5] package/python3-pip: add python3 host
 variant
Message-ID: <1621475279766.55779@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
---
 package/python3-pip/python3-pip.hash |  1 +
 package/python3-pip/python3-pip.mk   | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 120000 package/python3-pip/python3-pip.hash
 create mode 100644 package/python3-pip/python3-pip.mk

diff --git a/package/python3-pip/python3-pip.hash b/package/python3-pip/python3-pip.hash
new file mode 120000
index 0000000..d90fb3d
--- /dev/null
+++ b/package/python3-pip/python3-pip.hash
@@ -0,0 +1 @@
+../python-pip/python-pip.hash
\ No newline at end of file
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
new file mode 100644
index 0000000..098e502
--- /dev/null
+++ b/package/python3-pip/python3-pip.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python3-pip
+#
+################################################################################
+
+# Please keep in sync with package/python-pip/python-pip.mk
+PYTHON3_PIP_VERSION = 20.0.2
+PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
+PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
+PYTHON3_PIP_SETUP_TYPE = setuptools
+PYTHON3_PIP_LICENSE = MIT
+PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
+HOST_PYTHON3_PIP_DL_SUBDIR = python-pip
+HOST_PYTHON3_PIP_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.17.1
