From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 May 2020 23:28:07 +0200
Subject: [Buildroot] [PATCH 1/6] package/python3-pyelftools: new package
In-Reply-To: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200502212812.51219-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will need this Python 3.x variant of the host-python-pyelftools
package to be able to build some recent versions of U-Boot (>=
2020.01).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyelftools/python-pyelftools.mk  |  1 +
 .../python3-pyelftools/python3-pyelftools.hash  |  1 +
 .../python3-pyelftools/python3-pyelftools.mk    | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 120000 package/python3-pyelftools/python3-pyelftools.hash
 create mode 100644 package/python3-pyelftools/python3-pyelftools.mk

diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 21b9e409be..71ad49f20c 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-pyelftools/python3-pyelftools.mk
 PYTHON_PYELFTOOLS_VERSION = 0.25
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
 PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/fa/9a/0674cb1725196568bdbca98304f2efb17368b57af1a4bb3fc772c026f474
diff --git a/package/python3-pyelftools/python3-pyelftools.hash b/package/python3-pyelftools/python3-pyelftools.hash
new file mode 120000
index 0000000000..e8eebeda9f
--- /dev/null
+++ b/package/python3-pyelftools/python3-pyelftools.hash
@@ -0,0 +1 @@
+../python-pyelftools/python-pyelftools.hash
\ No newline at end of file
diff --git a/package/python3-pyelftools/python3-pyelftools.mk b/package/python3-pyelftools/python3-pyelftools.mk
new file mode 100644
index 0000000000..ea79aef66d
--- /dev/null
+++ b/package/python3-pyelftools/python3-pyelftools.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python3-pyelftools
+#
+################################################################################
+
+# Please keep in sync with package/python-pyelftools/python-pyelftools.mk
+PYTHON3_PYELFTOOLS_VERSION = 0.25
+PYTHON3_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
+PYTHON3_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/fa/9a/0674cb1725196568bdbca98304f2efb17368b57af1a4bb3fc772c026f474
+PYTHON3_PYELFTOOLS_LICENSE = Public domain
+PYTHON3_PYELFTOOLS_LICENSE_FILES = LICENSE
+PYTHON3_PYELFTOOLS_SETUP_TYPE = setuptools
+HOST_PYTHON3_PYELFTOOLS_DL_SUBDIR = python-pyelftools
+HOST_PYTHON3_PYELFTOOLS_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.26.2
