From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 21 Oct 2019 16:40:31 +0300
Subject: [Buildroot] [PATCH 2/2] package/python-keyring: bump to version
 19.2.0
In-Reply-To: <20191021134031.20586-1-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
Message-ID: <20191021134031.20586-11-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* The package doesn't support Python 2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-keyring/Config.in           | 2 ++
 package/python-keyring/python-keyring.hash | 7 ++++---
 package/python-keyring/python-keyring.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 23d86a4822..d1f9d31b10 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_KEYRING
 	bool "python-keyring"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # python-secretstorage
+	select BR2_PACKAGE_PYTHON_ENTRYPOINTS
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
 	  The Python keyring lib provides a easy way to access the
diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index a57419039e..159579f79c 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/keyring/json, sha256 locally computed
-md5	9c53e4f2427ebaa59d304a826311fbcf  keyring-10.5.0.tar.gz
-sha256	0e6129e8c5bc80da34cc1942d30daad79ed40419fcaaa538278c3b2ff235b313  keyring-10.5.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/keyring/json
+md5	1eb6d586ee5794de4bf39c1f513a3139  keyring-19.2.0.tar.gz
+sha256	91037ccaf0c9a112a76f7740e4a416b9457a69b66c2799421581bee710a974b3  keyring-19.2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 27db2802ed..2f6ee8497f 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 10.5.0
+PYTHON_KEYRING_VERSION = 19.2.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://pypi.python.org/packages/42/2e/51bd1739fe335095a2174db3f2f230346762e7e572471059540146a521f6
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/ee/46/77fdb7cd2b0f1f684afbc35a59b3d7ebb6961fe528f97b86900002968914
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.20.1
