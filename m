From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:18 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-tempora: bump to version
 1.14.1
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-21-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license file and hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-tempora/Config.in           | 1 +
 package/python-tempora/python-tempora.hash | 8 +++++---
 package/python-tempora/python-tempora.mk   | 5 +++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
index ab5c57f6cd..508cbae3f3 100644
--- a/package/python-tempora/Config.in
+++ b/package/python-tempora/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TEMPORA
 	bool "python-tempora"
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index a8367b942e..e959246138 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/tempora/json, sha256 locally computed
-md5	cd0dd5c51c9645285ff505ec531cbcc8  tempora-1.7.tar.gz
-sha256	a264672b7f39198eb90b531490ade4e873f6e13839253636c3bd6a5549be1984  tempora-1.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/tempora/json
+md5	f8b2b0df1adf3f83b829a85e31bddb2d  tempora-1.14.1.tar.gz
+sha256	cb60b1d2b1664104e307f8e5269d7f4acdb077c82e35cd57246ae14a3427d2d6  tempora-1.14.1.tar.gz
+# Locally computed sha256 checksums
+sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index 0bae36a2c6..b2f1b6b309 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 1.7
+PYTHON_TEMPORA_VERSION = 1.14.1
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://pypi.python.org/packages/db/2d/c838e9e553d774962a71b832b2c6390194904bfe49fd0d9d792ce8091e8a
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/2f/b5/5b0464385454c5ca93a39a1c6acefdf574aeb10ef45fa8958b3832cc7d96
 PYTHON_TEMPORA_LICENSE = MIT
+PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
 PYTHON_TEMPORA_DEPENDENCIES = host-python-setuptools-scm
 
-- 
2.20.1
