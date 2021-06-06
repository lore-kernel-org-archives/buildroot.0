From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 22:42:00 +0200
Subject: [Buildroot] [git commit] package/python3-pip: add python3 host
 variant
Message-ID: <20210606203301.633CD815DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5864b40faccd6a5f5e7a5441ccc820e2b5ee72f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998 at free.fr:
  - add CPE variables
  - also add sync comment for python-pip
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pip/python-pip.mk     |  1 +
 package/python3-pip/python3-pip.hash |  1 +
 package/python3-pip/python3-pip.mk   | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index f881a3ce55..71f76e2842 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-pip/python3-pip.mk
 PYTHON_PIP_VERSION = 20.0.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
 PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
diff --git a/package/python3-pip/python3-pip.hash b/package/python3-pip/python3-pip.hash
new file mode 120000
index 0000000000..d90fb3d005
--- /dev/null
+++ b/package/python3-pip/python3-pip.hash
@@ -0,0 +1 @@
+../python-pip/python-pip.hash
\ No newline at end of file
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
new file mode 100644
index 0000000000..58e3c06c39
--- /dev/null
+++ b/package/python3-pip/python3-pip.mk
@@ -0,0 +1,19 @@
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
+PYTHON3_PIP_CPE_ID_VENDOR = pypa
+PYTHON3_PIP_CPE_ID_PRODUCT = pip
+HOST_PYTHON3_PIP_DL_SUBDIR = python-pip
+HOST_PYTHON3_PIP_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
