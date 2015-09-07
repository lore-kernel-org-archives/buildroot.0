From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon,  7 Sep 2015 10:36:40 -0300
Subject: [Buildroot] [PATCH] cmake: bump to version 3.3.1
Message-ID: <1441633000-8235-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

xtensa patch is upstream so there's no need for it any longer.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 ...IML-Teach-ABI.h-about-Xtensa-architecture.patch | 30 ----------------------
 package/cmake/cmake.hash                           |  4 +--
 package/cmake/cmake.mk                             |  4 +--
 3 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch

diff --git a/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch b/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch
deleted file mode 100644
index 7d8eec6..0000000
--- a/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ded79a976e2b63bbfd7a63f27ec00bd071410e27 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Tue, 17 Mar 2015 15:51:04 +0300
-Subject: [PATCH] KWIML: Teach ABI.h about Xtensa architecture
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- Utilities/KWIML/ABI.h.in | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/Utilities/KWIML/ABI.h.in b/Utilities/KWIML/ABI.h.in
-index 21c9139..6300ada 100644
---- a/Utilities/KWIML/ABI.h.in
-+++ b/Utilities/KWIML/ABI.h.in
-@@ -432,6 +432,12 @@ suppression macro @KWIML at _ABI_NO_VERIFY was defined.
- #  define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_BIG
- # endif
- 
-+/* Xtensa */
-+#elif defined(__XTENSA_EB__)
-+# define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_BIG
-+#elif defined(__XTENSA_EL__)
-+# define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_LITTLE
-+
- /* Unknown CPU */
- #elif !defined(@KWIML at _ABI_NO_ERROR_ENDIAN)
- # error "Byte order of target CPU unknown."
--- 
-1.8.1.4
-
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 76e03d3..9418b9d 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 45f4d3fa8a2f61cc092ae461aac4cac1bab4ac6706f98274ea7f314dd315c6d0 cmake-3.1.3.tar.gz
+# From http://www.cmake.org/files/v3.3/cmake-3.3.1-SHA-256.txt
+sha256	cd65022c6a0707f1c7112f99e9c981677fdd5518f7ddfa0f778d4cee7113e3d6	cmake-3.3.1.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 9ca6443..da93fb3 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.1
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.4.6
