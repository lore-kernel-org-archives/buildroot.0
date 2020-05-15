From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 22:59:21 +0200
Subject: [Buildroot] [git commit] package/python3-pyelftools: new package
Message-ID: <20200515204314.1F6759194F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0704168abf839cce688d342d86235ed8e27e76ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will need this Python 3.x variant of the host-python-pyelftools
package to be able to build some recent versions of U-Boot (>=
2020.01).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyelftools/python-pyelftools.mk     |  1 +
 package/python3-pyelftools/python3-pyelftools.hash |  1 +
 package/python3-pyelftools/python3-pyelftools.mk   | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

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
