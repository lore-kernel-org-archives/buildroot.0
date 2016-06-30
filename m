From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 30 Jun 2016 16:38:58 +0200
Subject: [Buildroot] [PATCH] python-meld3: bump to version 1.0.2
Message-ID: <1467297538-31952-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

meld3 1.0.2 supports Python 3, so drop Python 2 only dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-meld3/Config.in         | 4 ++--
 package/python-meld3/python-meld3.hash | 5 +++--
 package/python-meld3/python-meld3.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
index 8dee723..9366b3c 100644
--- a/package/python-meld3/Config.in
+++ b/package/python-meld3/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_MELD3
 	bool "python-meld3"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
 	help
 	  A HTML/XML templating system.
 
diff --git a/package/python-meld3/python-meld3.hash b/package/python-meld3/python-meld3.hash
index 1525aca..c7d9025 100644
--- a/package/python-meld3/python-meld3.hash
+++ b/package/python-meld3/python-meld3.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  a425e9a9e0d9e3d69a2f5c1451d582f1222a7be94a957ca1e5301fd4045b5dbe  meld3-0.6.8.tar.gz
+# md5 from https://pypi.python.org/pypi/meld3/json, sha256 locally computed
+md5     3ccc78cd79cffd63a751ad7684c02c91  meld3-1.0.2.tar.gz
+sha256  f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558  meld3-1.0.2.tar.gz
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index 3c8acbc..268263d 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MELD3_VERSION = 0.6.8
+PYTHON_MELD3_VERSION = 1.0.2
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3
+PYTHON_MELD3_SITE = https://pypi.python.org/packages/45/a0/317c6422b26c12fe0161e936fc35f36552069ba8e6f7ecbd99bbffe32a5f
 PYTHON_MELD3_LICENSE = ZPLv2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
 PYTHON_MELD3_SETUP_TYPE = distutils
-- 
2.8.1
