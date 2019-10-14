From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 14 Oct 2019 22:12:25 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version 0.6.0
In-Reply-To: <20191014191228.13432-1-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
Message-ID: <20191014191228.13432-10-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* Add hash for license file.
* Add patch to avoid creation of wheel file (which breaks the build).
  The patch is taken from an upstream commit which doesn't apply since
  Makefile isn't provided in the tarball.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 .../0001-setup.cfg-remove-build-alias.patch   | 23 +++++++++++++++++++
 package/python-typepy/Config.in               |  2 --
 package/python-typepy/python-typepy.hash      |  8 ++++---
 package/python-typepy/python-typepy.mk        |  4 ++--
 4 files changed, 30 insertions(+), 7 deletions(-)
 create mode 100644 package/python-typepy/0001-setup.cfg-remove-build-alias.patch

diff --git a/package/python-typepy/0001-setup.cfg-remove-build-alias.patch b/package/python-typepy/0001-setup.cfg-remove-build-alias.patch
new file mode 100644
index 0000000000..9173c7ba0b
--- /dev/null
+++ b/package/python-typepy/0001-setup.cfg-remove-build-alias.patch
@@ -0,0 +1,23 @@
+From 3f69251b73d5d7f0c2ce86f435c63d8ce4a93d99 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Mon, 14 Oct 2019 17:30:43 +0300
+Subject: [PATCH 1/1] setup.cfg: remove build alias
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ setup.cfg | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index b2f5605..1b9e3a3 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -1,5 +1,4 @@
+ [aliases]
+-build = sdist bdist_wheel
+ test = pytest
+ 
+ [bdist_wheel]
+-- 
+2.20.1
+
diff --git a/package/python-typepy/Config.in b/package/python-typepy/Config.in
index 6079857070..d9bf043790 100644
--- a/package/python-typepy/Config.in
+++ b/package/python-typepy/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_PYTHON_TYPEPY
 	bool "python-typepy"
-	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  A Python library for variable type
diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 9ecac881e2..6e3630e208 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/typepy/json, sha256 locally computed
-md5	b9abd4d661dabe512e95ca69ddb65d55  typepy-0.0.20.tar.gz
-sha256	a1a5b9438670d4a5d9f882b7499ea85d06dc384577bb7636cb29d903288bca8c  typepy-0.0.20.tar.gz
+# md5, sha256 from https://pypi.org/pypi/typepy/json
+md5	75c99d2c6285e2c8248c4e3c25e281bd  typepy-0.6.0.tar.gz
+sha256	e27669952a679b91a8f33f85e669a6ace4d953133ebc57bfc09fbac941d98f50  typepy-0.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256	cbce2ac14dd81b6a1155029034512a304505692cc63b625538916cf93bee8ca2  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 33d8091998..26a2933032 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 0.0.20
+PYTHON_TYPEPY_VERSION = 0.6.0
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://pypi.python.org/packages/88/98/c79a19ae571d713fa0b10bc7e0fe611e53c542720b5a9dd2691ca15b3dd8
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/39/d3/c80faf53d068856d774bee8b99305aa1ebdb63c5051e9f54291207a49239
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
-- 
2.20.1
