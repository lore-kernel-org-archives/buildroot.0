From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:35:00 +0300
Subject: [Buildroot] [PATCH 18/23] python-pytrie: bump to version 0.3.1
In-Reply-To: <20180926153505.3411-1-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
Message-ID: <20180926153505.3411-19-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason (probably not on purpose) the license file was
removed from MANIFEST.in, and it's not available after package extraction.
I replaced it with PKG-INFO for now, and opened a PR on github:
https://github.com/gsakkis/pytrie/pull/3

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pytrie/Config.in          | 1 +
 package/python-pytrie/python-pytrie.hash | 8 +++++---
 package/python-pytrie/python-pytrie.mk   | 8 ++++----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/python-pytrie/Config.in b/package/python-pytrie/Config.in
index fb1df41d0a..156638476c 100644
--- a/package/python-pytrie/Config.in
+++ b/package/python-pytrie/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYTRIE
 	bool "python-pytrie"
+	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
 	help
 	  A pure Python implementation of the trie data structure.
 
diff --git a/package/python-pytrie/python-pytrie.hash b/package/python-pytrie/python-pytrie.hash
index 88d2542a8d..3bc1f6e9a7 100644
--- a/package/python-pytrie/python-pytrie.hash
+++ b/package/python-pytrie/python-pytrie.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5997b46c854a68bc588f4527c987663a, sha256 locally computed.
-md5	5997b46c854a68bc588f4527c987663a  PyTrie-0.2.tar.gz
-sha256	b272021351efadc6757591aac03ed4794bdfd091122204a4673e94bfb66cc500  PyTrie-0.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pytrie/json
+md5	f7c7184124013abcc18a3e3b638d32ae  PyTrie-0.3.1.tar.gz
+sha256	3bb7d122a549d8006c9cba2feecac20bceda9f8c0e2a3fa99a5584cfe0dec523  PyTrie-0.3.1.tar.gz
+# Locally computed sha256
+sha256	153931d44112319a1e1653752c881fb7ef092f636db31f4c36b252666e95efbd  PKG-INFO
diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
index 0fe78fdb17..b8264fa2be 100644
--- a/package/python-pytrie/python-pytrie.mk
+++ b/package/python-pytrie/python-pytrie.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYTRIE_VERSION = 0.2
-PYTHON_PYTRIE_SITE = https://pypi.python.org/packages/source/P/PyTrie
+PYTHON_PYTRIE_VERSION = 0.3.1
 PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
 PYTHON_PYTRIE_LICENSE = BSD-3-Clause
-PYTHON_PYTRIE_LICENSE_FILES = LICENSE
-PYTHON_PYTRIE_SETUP_TYPE = distutils
+PYTHON_PYTRIE_LICENSE_FILES = PKG-INFO
+PYTHON_PYTRIE_SITE = https://files.pythonhosted.org/packages/e1/eb/ae1f098969c9e9b81e821fb8e916cbf720b900ec1c0f3359e47a427395ec
+PYTHON_PYTRIE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.17.1
