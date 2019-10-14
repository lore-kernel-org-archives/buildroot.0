From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:20:05 +0200
Subject: [Buildroot] [git commit] package/python-cheroot: bump to version
 8.1.0
Message-ID: <20191014201700.BBED68DF3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eaf2346838bf817054a6e985fbe310538fcd3df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Add host-python-setuptools-scm-git-archive as build-time dependecy.
* Update runtime dependecies list.
* Update license file name (and hash): LICENSE was renamed to LICENSE.md
  with no changes. After that, the copyright year was bumped.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cheroot/Config.in           | 4 ++++
 package/python-cheroot/python-cheroot.hash | 9 +++++----
 package/python-cheroot/python-cheroot.mk   | 8 ++++----
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/python-cheroot/Config.in b/package/python-cheroot/Config.in
index bb85f7bdc7..1185e816ec 100644
--- a/package/python-cheroot/Config.in
+++ b/package/python-cheroot/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_CHEROOT
 	bool "python-cheroot"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
+               if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Cheroot is the high-performance, pure-Python
 	  HTTP server used by CherryPy.
diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index 664ad1002d..4da20fd0fe 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/Cheroot/json, sha256 locally computed
-md5	d256a0ccd28c3426a7764868e98a9020  cheroot-5.10.0.tar.gz
-sha256	a408f1b80a3f93a3b49fc330f68eea40d8d30b9b07084f374607d1a5cc2e824f  cheroot-5.10.0.tar.gz
-sha256  02f4efe6e7dcd218c33cfa065c0552de983b5ad563b053e97697c5abd2ef14f9  LICENSE
+# md5, sha256 from https://pypi.org/pypi/cheroot/json
+md5	202a292846ce9ec84a1aeb2193ec2b35  cheroot-8.1.0.tar.gz
+sha256	3ff64073efa35b39d5e107410f5c79664dc8c6c5990651e970740c80ab8878a8  cheroot-8.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  da6dc218683f6dab91c6367f00bf33095d980fb1f04d430c81c5e6994b8605e0  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index 07775e577b..169962923a 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 5.10.0
+PYTHON_CHEROOT_VERSION = 8.1.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://pypi.python.org/packages/14/dc/afc41e7f7e797973808d8520e6aef21c4efd00550aa32f5b726327d36be0
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/a1/6c/899c7de9323e440f7eda28fead4a84bd0ae5a557e6ebf8f12270cc502043
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
-PYTHON_CHEROOT_LICENSE_FILES = LICENSE
+PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
-PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm host-python-setuptools-scm-git-archive
 
 $(eval $(python-package))
