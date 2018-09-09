From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:01:38 +0200
Subject: [Buildroot] [git commit] python-pexpect: bump to version 4.6.0
Message-ID: <20180909130045.31E0C8387A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1207b6c301058c7bfb4eda9fe51580b9ab74c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license.
Adjust post-patch for 4.6.0 (async.py was renamed to _async.py).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pexpect/python-pexpect.hash | 8 +++++---
 package/python-pexpect/python-pexpect.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
index e3836074ec..bdeedefaa0 100644
--- a/package/python-pexpect/python-pexpect.hash
+++ b/package/python-pexpect/python-pexpect.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pexpect/json, sha256 locally computed
-md5	3694410001a99dff83f0b500a1ca1c95  pexpect-4.2.1.tar.gz
-sha256	3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92  pexpect-4.2.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pexpect/json
+md5	d4f3372965a996238d57d19b95d2e03a  pexpect-4.6.0.tar.gz
+sha256	2a8e88259839571d1251d278476f3eec5db26deb73a70be5ed5dc5435e418aba  pexpect-4.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256	4a483ae1c4dc738a6c8b73feb49074e1835da02ab5aa686f2675029906fa364d  LICENSE
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index f1f9903946..5c385cefb0 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEXPECT_VERSION = 4.2.1
+PYTHON_PEXPECT_VERSION = 4.6.0
 PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
-PYTHON_PEXPECT_SITE = https://pypi.python.org/packages/e8/13/d0b0599099d6cd23663043a2a0bb7c61e58c6ba359b2656e6fb000ef5b98
+PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/89/43/07d07654ee3e25235d8cea4164cdee0ec39d1fda8e9203156ebe403ffda4
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = distutils
@@ -16,7 +16,7 @@ PYTHON_PEXPECT_SETUP_TYPE = distutils
 # https://github.com/pexpect/pexpect/issues/290
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 define PYTHON_PEXPECT_REMOVE_ASYNC_PY
-	$(RM) $(@D)/pexpect/async.py
+	$(RM) $(@D)/pexpect/_async.py
 endef
 PYTHON_PEXPECT_POST_PATCH_HOOKS += PYTHON_PEXPECT_REMOVE_ASYNC_PY
 endif
