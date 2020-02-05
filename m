From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed,  5 Feb 2020 15:11:48 +0100
Subject: [Buildroot] [PATCH 2/3] package/crudini: bump to version 0.9.3
In-Reply-To: <20200205141149.20749-1-titouan.christophe@railnova.eu>
References: <20200205141149.20749-1-titouan.christophe@railnova.eu>
Message-ID: <20200205141149.20749-3-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release hasn't been published to pypi, so we switch
to the Github release archive instead.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/crudini/Config.in    | 2 +-
 package/crudini/crudini.hash | 5 +----
 package/crudini/crudini.mk   | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/crudini/Config.in b/package/crudini/Config.in
index e4e26e52da..240848dffc 100644
--- a/package/crudini/Config.in
+++ b/package/crudini/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CRUDINI
 	bool "crudini"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_INIPARSE # runtime
 	help
 	  A utility for handling ini files from the command line and
diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index 6c08223b83..6f2563dfdd 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,6 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9b8500c90467f0a61c714fbe852c2a66
-md5    9b8500c90467f0a61c714fbe852c2a66 crudini-0.9.tar.gz
-
 # locally computed
-sha256  10512a5a2f7b54b42e48a1d00f0c6398947c2ba6c264b9fdef86677f0e949fd3  crudini-0.9.tar.gz
+sha256  e1b8125ac4373ece3bb0bb047ba9336e5bd55ed5d56b9729968058c9385ab546  crudini-0.9.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index c03f55c374..7141e2b2a0 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRUDINI_VERSION = 0.9
-CRUDINI_SITE = https://pypi.python.org/packages/b5/65/5588903472f30fa01ca4951be00c03a317b27bac4cd1e945bd16b2c1b6d3
+CRUDINI_VERSION = 0.9.3
+CRUDINI_SITE = $(call github,pixelb,crudini,$(CRUDINI_VERSION))
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
-- 
2.24.1
