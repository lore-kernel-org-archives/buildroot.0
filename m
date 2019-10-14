From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 14 Oct 2019 22:12:26 +0300
Subject: [Buildroot] [PATCH 2/2] package/python-beautifulsoup4: bumo to
 version 4.8.1
In-Reply-To: <20191014191228.13432-1-asafka7@gmail.com>
References: <20191014191228.13432-1-asafka7@gmail.com>
Message-ID: <20191014191228.13432-11-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Add runtime dependency (soupsieve).
* Add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-beautifulsoup4/Config.in                  | 1 +
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 8 +++++---
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-beautifulsoup4/Config.in b/package/python-beautifulsoup4/Config.in
index 76f6d9471c..eb7d2ba673 100644
--- a/package/python-beautifulsoup4/Config.in
+++ b/package/python-beautifulsoup4/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4
 	bool "python-beautifulsoup4"
+	select BR2_PACKAGE_PYTHON_SOUPSIEVE # runtime
 	help
 	  Beautiful Soup is a Python library for pulling data out of
 	  HTML and XML files. It works with your favorite parser to
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index dd0c3e4312..8b8c51de4f 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/beautifulsoup4/json, sha256 locally computed
-md5 937e0df0d699a1237646f38fd567f0c6 beautifulsoup4-4.5.3.tar.gz
-sha256 b21ca09366fa596043578fd4188b052b46634d22059e68dd0077d9ee77e08a3e beautifulsoup4-4.5.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
+md5	be03d778cf61cf6734a480e2010d6657  beautifulsoup4-4.8.1.tar.gz
+sha256	6135db2ba678168c07950f9a16c4031822c6f4aec75a65e0a97bc5ca09789931  beautifulsoup4-4.8.1.tar.gz
+# Locally computed sha256 checksums
+sha256	a47ea51236098464fe0b4f559743590b533056d9e00f49ecbf80299fab47e231  COPYING.txt
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index ccec30fb40..6364a36677 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.5.3
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.8.1
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://pypi.python.org/packages/9b/a5/c6fa2d08e6c671103f9508816588e0fb9cec40444e8e72993f3d4c325936
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/86/cd/495c68f0536dcd25f016e006731ba7be72e072280305ec52590012c1e6f2
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = COPYING.txt
-- 
2.20.1
