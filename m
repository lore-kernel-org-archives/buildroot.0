From: Chan, Donald <hoiho@lab126.com>
Date: Wed, 12 May 2021 20:59:09 +0000
Subject: [Buildroot] [PATCH 1/1] package/python3-six: add python3 variant
Message-ID: <1620853148995.76548@lab126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Donald Chan <hoiho@lab126.com>
---
 package/python3-six/python3-six.hash |  1 +
 package/python3-six/python3-six.mk   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 120000 package/python3-six/python3-six.hash
 create mode 100644 package/python3-six/python3-six.mk

diff --git a/package/python3-six/python3-six.hash b/package/python3-six/python3-six.hash
new file mode 120000
index 0000000..ed8cb89
--- /dev/null
+++ b/package/python3-six/python3-six.hash
@@ -0,0 +1 @@
+../python-six/python-six.hash
\ No newline at end of file
diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
new file mode 100644
index 0000000..be64fce
--- /dev/null
+++ b/package/python3-six/python3-six.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python3-six
+#
+################################################################################
+
+# Please keep in sync with package/python-six/python-six.mk
+PYTHON3_SIX_VERSION = 1.15.0
+PYTHON3_SIX_SOURCE = six-$(PYTHON3_SIX_VERSION).tar.gz
+PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
+PYTHON3_SIX_SETUP_TYPE = setuptools
+PYTHON3_SIX_LICENSE = MIT
+PYTHON3_SIX_LICENSE_FILES = LICENSE
+HOST_PYTHON3_SIX_DL_SUBDIR = python-six
+HOST_PYTHON3_SIX_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
--
2.17.1
