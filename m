From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 11 Oct 2019 11:35:27 +0300
Subject: [Buildroot] [PATCH 2/2] package/python-arrow: bump to version 0.15.2
In-Reply-To: <20191011083527.26140-1-asafka7@gmail.com>
References: <20191011083527.26140-1-asafka7@gmail.com>
Message-ID: <20191011083527.26140-6-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* Add hash for license file.
* Remove docs/_themes/COPYING.txt from _LICENSE_FILES (the whole
  _themes directory was removed)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-arrow/Config.in         | 2 ++
 package/python-arrow/python-arrow.hash | 8 +++++---
 package/python-arrow/python-arrow.mk   | 6 +++---
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
index 244956879c..1458556830 100644
--- a/package/python-arrow/Config.in
+++ b/package/python-arrow/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_ARROW
 	bool "python-arrow"
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
+	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Better dates and times for Python.
 
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 0b5076aa96..90e0533232 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/arrow/json, sha256 locally computed
-md5	5d00592200050ad58284d45a4ee147c6  arrow-0.10.0.tar.gz
-sha256	805906f09445afc1f0fc80187db8fe07670e3b25cdafa09b8d8ac264a8c0c722  arrow-0.10.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/arrow/json
+md5	554f18b0e23182ee0e8cb2a882d2f607  arrow-0.15.2.tar.gz
+sha256	10257c5daba1a88db34afa284823382f4963feca7733b9107956bed041aff24f  arrow-0.15.2.tar.gz
+# Locally computed sha256 checksums
+sha256	a4b7601be50569c2c96a9818fc809b0149410c84c99714d60c9d4fb0ae861fa2  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index 6e2e331e3c..f8326288b2 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 0.10.0
+PYTHON_ARROW_VERSION = 0.15.2
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://pypi.python.org/packages/54/db/76459c4dd3561bbe682619a5c576ff30c42e37c2e01900ed30a501957150
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/43/0e/47416c54ad7742981bf77fdfc405987551ab14b181a6140c8cd2a5823872
 PYTHON_ARROW_SETUP_TYPE = setuptools
 PYTHON_ARROW_LICENSE = Apache-2.0
-PYTHON_ARROW_LICENSE_FILES = LICENSE docs/_themes/COPYING.txt
+PYTHON_ARROW_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.20.1
