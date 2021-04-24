From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 18:15:49 +0200
Subject: [Buildroot] [git commit] package/python-pytrie: bump to version
 0.4.0
Message-ID: <20210424154859.6D95083D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c81a1a833b43afefef7d8172a59cd0d67f81bc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- python 2 support has been dropped since
  https://github.com/gsakkis/pytrie/commit/a60a601d85a660976f4aaab4cb0efcb15b91263b
- Use LICENSE instead of PKG-INFO which is available in the official
  tarball since
  https://github.com/gsakkis/pytrie/commit/1ba5d547dfbf0d384dd16cf78a2cce91ef69fce8
- Update indentation in hash file (two spaces)

https://github.com/gsakkis/pytrie/blob/0.4.0/README.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytrie/Config.in          | 1 +
 package/python-pytrie/python-pytrie.hash | 8 ++++----
 package/python-pytrie/python-pytrie.mk   | 6 +++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-pytrie/Config.in b/package/python-pytrie/Config.in
index 156638476c..722d263d7e 100644
--- a/package/python-pytrie/Config.in
+++ b/package/python-pytrie/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYTRIE
 	bool "python-pytrie"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
 	help
 	  A pure Python implementation of the trie data structure.
diff --git a/package/python-pytrie/python-pytrie.hash b/package/python-pytrie/python-pytrie.hash
index 3bc1f6e9a7..ead479ee1a 100644
--- a/package/python-pytrie/python-pytrie.hash
+++ b/package/python-pytrie/python-pytrie.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytrie/json
-md5	f7c7184124013abcc18a3e3b638d32ae  PyTrie-0.3.1.tar.gz
-sha256	3bb7d122a549d8006c9cba2feecac20bceda9f8c0e2a3fa99a5584cfe0dec523  PyTrie-0.3.1.tar.gz
-# Locally computed sha256
-sha256	153931d44112319a1e1653752c881fb7ef092f636db31f4c36b252666e95efbd  PKG-INFO
+md5  0cbe20db2361dcc99bdcba7acacd34e6  PyTrie-0.4.0.tar.gz
+sha256  8f4488f402d3465993fb6b6efa09866849ed8cda7903b50647b7d0342b805379  PyTrie-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  97f85c2ba0d856cf5f7e5db587af7299233db2e502980eb655ace28343541d50  LICENSE
diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
index b8264fa2be..7e55579d2d 100644
--- a/package/python-pytrie/python-pytrie.mk
+++ b/package/python-pytrie/python-pytrie.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYTRIE_VERSION = 0.3.1
+PYTHON_PYTRIE_VERSION = 0.4.0
 PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
 PYTHON_PYTRIE_LICENSE = BSD-3-Clause
-PYTHON_PYTRIE_LICENSE_FILES = PKG-INFO
-PYTHON_PYTRIE_SITE = https://files.pythonhosted.org/packages/e1/eb/ae1f098969c9e9b81e821fb8e916cbf720b900ec1c0f3359e47a427395ec
+PYTHON_PYTRIE_LICENSE_FILES = LICENSE
+PYTHON_PYTRIE_SITE = https://files.pythonhosted.org/packages/d3/19/15ec77ab9c85f7c36eb590d6ab7dd529f8c8516c0e2219f1a77a99d7ee77
 PYTHON_PYTRIE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
