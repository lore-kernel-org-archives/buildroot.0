From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:43:21 +0200
Subject: [Buildroot] [git commit branch/next] package/python3-cython: new
 package
Message-ID: <20200812144329.28F4F85F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aab7139c2524277d54780ebd467a5f4465bfa8c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The host-setools package needs to be built for the host-python3, even
when the target Python is not necessarily Python 3.x. Since it depends
on host-python-cython, we need a Python 3 variant of it, which this
patch introduces.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/python-cython.mk     |  1 +
 package/python3-cython/python3-cython.hash |  1 +
 package/python3-cython/python3-cython.mk   | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 308b01e5b2..c8dcf382ff 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-cython/python3-cython.mk
 PYTHON_CYTHON_VERSION = 0.29.21
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
 PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/6c/9f/f501ba9d178aeb1f5bf7da1ad5619b207c90ac235d9859961c11829d0160
diff --git a/package/python3-cython/python3-cython.hash b/package/python3-cython/python3-cython.hash
new file mode 120000
index 0000000000..70dde64105
--- /dev/null
+++ b/package/python3-cython/python3-cython.hash
@@ -0,0 +1 @@
+../python-cython/python-cython.hash
\ No newline at end of file
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
new file mode 100644
index 0000000000..6e3bd1422a
--- /dev/null
+++ b/package/python3-cython/python3-cython.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python3-cython
+#
+################################################################################
+
+# Please keep in sync with package/python-cython/python-cython.mk
+PYTHON3_CYTHON_VERSION = 0.29.21
+PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
+PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/6c/9f/f501ba9d178aeb1f5bf7da1ad5619b207c90ac235d9859961c11829d0160
+PYTHON3_CYTHON_SETUP_TYPE = setuptools
+PYTHON3_CYTHON_LICENSE = Apache-2.0
+PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
+HOST_PYTHON3_CYTHON_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
