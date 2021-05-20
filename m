From: Chan, Donald <hoiho@lab126.com>
Date: Thu, 20 May 2021 01:48:29 +0000
Subject: [Buildroot] [PATCH 3/5] package/python3-pycparser: add python3 host
 variant
Message-ID: <1621475308301.45348@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
---
 .../python3-pycparser/python3-pycparser.hash    |  1 +
 package/python3-pycparser/python3-pycparser.mk  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 120000 package/python3-pycparser/python3-pycparser.hash
 create mode 100644 package/python3-pycparser/python3-pycparser.mk

diff --git a/package/python3-pycparser/python3-pycparser.hash b/package/python3-pycparser/python3-pycparser.hash
new file mode 120000
index 0000000..7a1912c
--- /dev/null
+++ b/package/python3-pycparser/python3-pycparser.hash
@@ -0,0 +1 @@
+../python-pycparser/python-pycparser.hash
\ No newline at end of file
diff --git a/package/python3-pycparser/python3-pycparser.mk b/package/python3-pycparser/python3-pycparser.mk
new file mode 100644
index 0000000..68769ce
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
-- 
2.17.1
