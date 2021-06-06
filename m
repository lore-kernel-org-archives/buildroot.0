From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 22:42:10 +0200
Subject: [Buildroot] [git commit] package/python3-cryptography: add python3
 host variant
Message-ID: <20210606203301.AD5D380480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cee1f6eecc5d36921fa99d69ef4bbe007549bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a python3 host variant since another downstream OSS component
(OP-TEE) uses buildroot and it will depend on a python3 host variant
of python-cryptography.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998 at free.fr:
  - drop target _DEPENDENCIES since this is a host-only package
  - instead, add host-openssl to dependencies
  - add CPE variables
  - also add sync comment for python-pip
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cryptography/python-cryptography.mk |  1 +
 .../python3-cryptography/python3-cryptography.hash |  1 +
 .../python3-cryptography/python3-cryptography.mk   | 24 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index bc7a9f8027..eff0fa14a5 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-cryptography/python3-cryptography.mk
 PYTHON_CRYPTOGRAPHY_VERSION = 3.0
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
diff --git a/package/python3-cryptography/python3-cryptography.hash b/package/python3-cryptography/python3-cryptography.hash
new file mode 120000
index 0000000000..73fa25f572
--- /dev/null
+++ b/package/python3-cryptography/python3-cryptography.hash
@@ -0,0 +1 @@
+../python-cryptography/python-cryptography.hash
\ No newline at end of file
diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
new file mode 100644
index 0000000000..03112e41d4
--- /dev/null
+++ b/package/python3-cryptography/python3-cryptography.mk
@@ -0,0 +1,24 @@
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
+PYTHON3_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
+PYTHON3_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
+HOST_PYTHON3_CRYPTOGRAPHY_DL_SUBDIR = python-cryptography
+HOST_PYTHON3_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-openssl \
+	host-python3-cffi \
+	host-python3-pip \
+	host-python3-six
+
+$(eval $(host-python-package))
