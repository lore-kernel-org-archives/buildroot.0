From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  4 Sep 2017 08:21:23 +0200
Subject: [Buildroot] [PATCH 2/5] python-pytablereader: bump to version 0.13.3
In-Reply-To: <20170904062126.3274-1-yegorslists@googlemail.com>
References: <20170904062126.3274-1-yegorslists@googlemail.com>
Message-ID: <20170904062126.3274-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytablereader/Config.in                 | 5 ++++-
 package/python-pytablereader/python-pytablereader.hash | 4 ++--
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index 050ff65c1..fa3dd29f1 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -2,14 +2,17 @@ config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	bool "python-pytablereader"
 	select BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4 # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
 	select BR2_PACKAGE_PYTHON_MARKDOWN2 # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
 	select BR2_PACKAGE_PYTHON_PATHPY # runtime
+	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
+	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	select BR2_PACKAGE_PYTHON_XLRD # runtime
 	help
 	  A python library to load structured table data from
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index 7d1438a1d..568277927 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablereader/json, sha256 locally computed
-md5	ae95462a1a982186d1307ee0d6e275e2  pytablereader-0.8.8.tar.gz
-sha256	6ba95dc699d2c7ab7bc4b3f0224a17404255d110a3ece8ba12217d650aa7de79  pytablereader-0.8.8.tar.gz
+md5	60a00cb5ca16aaa16cc4813ef094f803  pytablereader-0.13.3.tar.gz
+sha256	96d5eb060f5ab3bc9072e98c3dbeb22b152ce4ce64f33502e7c2cc394526c60b  pytablereader-0.13.3.tar.gz
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index 2b6f2d46b..a2dd1b989 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.8.8
+PYTHON_PYTABLEREADER_VERSION = 0.13.3
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://pypi.python.org/packages/05/0c/7801617e60ce0d9b4cc57cb542cc431a95b9f43ac1ac14030017163da29d
+PYTHON_PYTABLEREADER_SITE = https://pypi.python.org/packages/c3/47/550949034950f43d3db3b60b94aa8ee60d548d9f657612d816ad4420f24b
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
-- 
2.11.0
