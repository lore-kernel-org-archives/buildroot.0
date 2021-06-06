From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 22:21:30 +0200
Subject: [Buildroot] [git commit] package/python3-six: add python3 host
 variant
Message-ID: <20210606203301.516F78A615@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=950268102defbf243c09761307987adba5df81cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998 at free.fr: also add sync comment in python-six]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-six/python-six.mk     |  1 +
 package/python3-six/python3-six.hash |  1 +
 package/python3-six/python3-six.mk   | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index e7621f5ecb..7c298d6f89 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-six/python3-six.mk
 PYTHON_SIX_VERSION = 1.15.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
 PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
diff --git a/package/python3-six/python3-six.hash b/package/python3-six/python3-six.hash
new file mode 120000
index 0000000000..ed8cb89a6b
--- /dev/null
+++ b/package/python3-six/python3-six.hash
@@ -0,0 +1 @@
+../python-six/python-six.hash
\ No newline at end of file
diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
new file mode 100644
index 0000000000..debd338a4b
--- /dev/null
+++ b/package/python3-six/python3-six.mk
@@ -0,0 +1,17 @@
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
+$(eval $(host-python-package))
