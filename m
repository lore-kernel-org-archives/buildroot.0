From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:40:22 +0100
Subject: [Buildroot] [git commit] package/python3-ply: add special host
 variant
Message-ID: <20210119213844.76B1580845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d7c614252c3b8b92671108bf3883d15b846e216
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ply/python-ply.mk     |  1 +
 package/python3-ply/python3-ply.hash |  1 +
 package/python3-ply/python3-ply.mk   | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/package/python-ply/python-ply.mk b/package/python-ply/python-ply.mk
index 5dc7964d5f..50a3e32bc2 100644
--- a/package/python-ply/python-ply.mk
+++ b/package/python-ply/python-ply.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-ply/python3-ply.mk
 PYTHON_PLY_VERSION = 3.11
 PYTHON_PLY_SOURCE = ply-$(PYTHON_PLY_VERSION).tar.gz
 PYTHON_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
diff --git a/package/python3-ply/python3-ply.hash b/package/python3-ply/python3-ply.hash
new file mode 120000
index 0000000000..5e07165c93
--- /dev/null
+++ b/package/python3-ply/python3-ply.hash
@@ -0,0 +1 @@
+../python-ply/python-ply.hash
\ No newline at end of file
diff --git a/package/python3-ply/python3-ply.mk b/package/python3-ply/python3-ply.mk
new file mode 100644
index 0000000000..15f66a49db
--- /dev/null
+++ b/package/python3-ply/python3-ply.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python3-ply
+#
+################################################################################
+
+PYTHON3_PLY_VERSION = 3.11
+PYTHON3_PLY_SOURCE = ply-$(PYTHON3_PLY_VERSION).tar.gz
+PYTHON3_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
+PYTHON3_PLY_SETUP_TYPE = setuptools
+PYTHON3_PLY_LICENSE = BSD-3-Clause
+PYTHON3_PLY_LICENSE_FILES = README.md
+
+HOST_PYTHON3_PLY_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
