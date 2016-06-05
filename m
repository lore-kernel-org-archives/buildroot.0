From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:26:02 +0200
Subject: [Buildroot] [PATCH 3/4] package/lcdapi: bump version to v0.10
In-Reply-To: <1465161963-32681-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465161963-32681-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465161963-32681-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch to fix docs install after upstream fixed the problem:
https://github.com/spdawson/lcdapi/commit/34e1d3b26055b02cecb7e738574b8fddcc2ab5eb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-Remove-installation-of-docs-examples.patch | 39 ----------------------
 package/lcdapi/lcdapi.mk                           |  2 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 package/lcdapi/0001-Remove-installation-of-docs-examples.patch

diff --git a/package/lcdapi/0001-Remove-installation-of-docs-examples.patch b/package/lcdapi/0001-Remove-installation-of-docs-examples.patch
deleted file mode 100644
index dcadcf4..0000000
--- a/package/lcdapi/0001-Remove-installation-of-docs-examples.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ede0fa7d410be407164b68570a1540378bf0bd09 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 19 Jul 2014 10:40:59 +0200
-Subject: [PATCH] Remove installation of docs/examples
-
-They get installed in the wrong directory, i.e if DESTDIR is
-/path/to/output/target, they will be installed in
-/path/to/output/target./examples and /path/to/output/target./docs.
-
-Since we don't need docs and examples in Buildroot anyway, simply get
-rid of them.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c56860a..6b1267b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -69,14 +69,3 @@ liblcdapi_la_CXXFLAGS = \
- 	-g0 -DNODEBUG -Os
- 
- ACLOCAL_AMFLAGS = -I m4
--
--docsdir = $(top_srcdir)/docs
--exampledir = $(top_srcdir)/example
--dist_docs_DATA = \
--	docs/Makefile.am \
--	docs/Makefile.in \
--	docs/Doxyfile.in
--dist_example_DATA = \
--	example/client.cpp \
--	example/Makefile.am \
--	example/Makefile.in
--- 
-2.0.0
-
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index bcf5c47..5d8c2ee 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCDAPI_VERSION = dbbdca06f271b8cf81b4817a9da3d558cfe59905
+LCDAPI_VERSION = v0.10
 LCDAPI_SITE = $(call github,spdawson,lcdapi,$(LCDAPI_VERSION))
 LCDAPI_LICENSE = LGPLv2.1+
 LCDAPI_LICENSE_FILES = COPYING
-- 
2.8.1
