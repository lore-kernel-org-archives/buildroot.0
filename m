From: Koen Martens <gmc@sonologic.nl>
Date: Thu, 15 Aug 2019 11:58:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 0.7.0
Message-ID: <20190815095804.GA28418@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch against 0.6.1 has been merged upstream,
and has been removed from this package.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
---
 ...01-Do-not-use-execinfo-h-with-uclibc.patch | 30 -------------------
 package/capnproto/capnproto.hash              |  2 +-
 package/capnproto/capnproto.mk                |  2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch

diff --git a/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
deleted file mode 100644
index 6bb7702a58..0000000000
--- a/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e651ac5febc59e3e2b5d3365ededbe5362756da2 Mon Sep 17 00:00:00 2001
-From: Koen Martens <gmc@sonologic.nl>
-Date: Wed, 12 Jul 2017 18:49:32 +0200
-Subject: [PATCH] Do not use execinfo.h with uclibc (#511)
-
-Upstream commit: https://github.com/capnproto/capnproto/commit/e651ac5febc59e3e2b5d3365ededbe5362756da2
-
-Signed-off-by: Koen Martens <gmc@sonologic.nl>
-Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
-
----
- c++/src/kj/exception.c++ | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/c++/src/kj/exception.c++ b/c++/src/kj/exception.c++
-index 218f1db..339601a 100644
---- a/c++/src/kj/exception.c++
-+++ b/c++/src/kj/exception.c++
-@@ -33,7 +33,7 @@
- #endif
- #include "io.h"
- 
--#if (__linux__ && __GLIBC__) || __APPLE__
-+#if (__linux__ && __GLIBC__ && !__UCLIBC__) || __APPLE__
- #define KJ_HAS_BACKTRACE 1
- #include <execinfo.h>
- #endif
--- 
-2.7.4
-
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index bc6a27684b..869390f2c3 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	85210424c09693d8fe158c1970a2bca37af3a0424f02b263f566a1b8a5451a2d  capnproto-0.6.1.tar.gz
+sha256	76c7114a3d142ad08b7208b3964a26e72a6320ee81331d3f0b87569fc9c47a28  capnproto-0.7.0.tar.gz
 sha256	16194222e9412c3aa14d2287953f7fc89a1dcbcdd266d1534ba35060d4cde5b6  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 3c7965d60c..34fb885914 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.6.1
+CAPNPROTO_VERSION = 0.7.0
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
-- 
2.17.1
