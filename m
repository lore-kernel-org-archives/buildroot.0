From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:05:34 +0100
Subject: [Buildroot] [git commit] Revert "package/python-ipython: bump to
 version 7.3.0"
Message-ID: <20190318210225.89F4281563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=399d83f780d7cf93a6168185f88b643e7776eb8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit bc516052593947a067c98956931df9df31ee3195.
which adds a dependency on python3 as well as adddtional python runtime
modules. So revert this patch to polish a better bump.

Fixes:
 - http://autobuild.buildroot.org/results/7d765d2b15bfe72b05de62e86a01d57f1696c837
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython/python-ipython.hash | 7 +++----
 package/python-ipython/python-ipython.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index e49ff6b10e..41bdd70feb 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5 2aec01154a78c6075c5b7f1bfea4abd3 ipython-7.3.0.tar.gz
-sha256 06de667a9e406924f97781bda22d5d76bfb39762b678762d86a466e63f65dc39 ipython-7.3.0.tar.gz
+md5 7014b8824981eef2cb893ea5398d6b8d ipython-5.8.0.tar.gz
+sha256 4bac649857611baaaf76bc82c173aa542f7486446c335fe1a6c05d0d491c8906 ipython-5.8.0.tar.gz
 # Locally computed sha256
-sha256 341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
-sha256 e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb LICENSE
+sha256 a5d87689342ec47cebdf623af06cec734c607666c696fe48271f2ff91752443d COPYING.rst
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 048428e83a..79a48bf43d 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.3.0
+PYTHON_IPYTHON_VERSION = 5.8.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/82/0a/146b0f0f1ddf13ab8682aed5c5a42250cddf1082e193ec95b50b03b9f791
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/41/a6/2d25314b1f9375639d8f8e0f8052e8cec5df511d3449f22c4f1c2d8cb3c6
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
-PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
+PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
 PYTHON_IPYTHON_SETUP_TYPE = distutils
 
 $(eval $(python-package))
