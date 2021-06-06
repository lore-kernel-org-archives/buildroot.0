From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 22:42:10 +0200
Subject: [Buildroot] [git commit] package/python3-pycparser: add python3
 host variant
Message-ID: <20210606203301.7DFDF80480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e2f12ae1cf68c4b8edb736f7d68ba159f34f1dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998 at free.fr: also add sync comment to python-pycparser]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycparser/python-pycparser.mk     |  1 +
 package/python3-pycparser/python3-pycparser.hash |  1 +
 package/python3-pycparser/python3-pycparser.mk   | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 8af37fce98..5f44a562af 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-pycparser/python3-pycparser.mk
 PYTHON_PYCPARSER_VERSION = 2.20
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
 PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
diff --git a/package/python3-pycparser/python3-pycparser.hash b/package/python3-pycparser/python3-pycparser.hash
new file mode 120000
index 0000000000..7a1912cad2
--- /dev/null
+++ b/package/python3-pycparser/python3-pycparser.hash
@@ -0,0 +1 @@
+../python-pycparser/python-pycparser.hash
\ No newline at end of file
diff --git a/package/python3-pycparser/python3-pycparser.mk b/package/python3-pycparser/python3-pycparser.mk
new file mode 100644
index 0000000000..68769ceb46
--- /dev/null
+++ b/package/python3-pycparser/python3-pycparser.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python3-pycparser
+#
+################################################################################
+
+# Please keep in sync with package/python-pycparser/python-pycparser.mk
+PYTHON3_PYCPARSER_VERSION = 2.20
+PYTHON3_PYCPARSER_SOURCE = pycparser-$(PYTHON3_PYCPARSER_VERSION).tar.gz
+PYTHON3_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
+PYTHON3_PYCPARSER_SETUP_TYPE = setuptools
+PYTHON3_PYCPARSER_LICENSE = BSD-3-Clause
+PYTHON3_PYCPARSER_LICENSE_FILES = LICENSE
+HOST_PYTHON3_PYCPARSER_DL_SUBDIR = python-pycparser
+HOST_PYTHON3_PYCPARSER_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
