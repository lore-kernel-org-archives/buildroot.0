From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Nov 2020 23:34:34 +0100
Subject: [Buildroot] [PATCH/next v1 3/5] package/python3-ply: add special
 host variant
In-Reply-To: <20201117223436.24036-1-ps.report@gmx.net>
References: <20201117223436.24036-1-ps.report@gmx.net>
Message-ID: <20201117223436.24036-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-ply/python-ply.mk     |  1 +
 package/python3-ply/python3-ply.hash |  5 +++++
 package/python3-ply/python3-ply.mk   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python3-ply/python3-ply.hash
 create mode 100644 package/python3-ply/python3-ply.mk

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
new file mode 100644
index 0000000000..1eba3b0ffe
--- /dev/null
+++ b/package/python3-ply/python3-ply.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ply/json
+md5	6465f602e656455affcd7c5734c638f8  ply-3.11.tar.gz
+sha256	00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3  ply-3.11.tar.gz
+# Locally computed sha256 checksums
+sha256	1095b93b81d2043c5c55e0859875b416f75edb6d5eccb4bf2ace1b5445d1c84f  README.md
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
-- 
2.29.2
