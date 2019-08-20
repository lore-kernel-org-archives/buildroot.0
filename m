From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Aug 2019 20:48:02 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/protobuf: bump to version 3.9.1
Message-ID: <20190820184804.28911-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ompilation-under-mips-big-endian-wit.patch | 38 -------------------
 package/protobuf/protobuf.hash                |  2 +-
 package/protobuf/protobuf.mk                  |  2 +-
 package/python-protobuf/python-protobuf.hash  |  2 +-
 4 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch

diff --git a/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch b/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch
deleted file mode 100644
index d2b34f15e6..0000000000
--- a/package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d105213bccfa4392eda889a95f808dd9cdf84494 Mon Sep 17 00:00:00 2001
-From: Charles Hardin <charles.hardin@storagecraft.com>
-Date: Mon, 21 May 2018 09:19:30 -0700
-Subject: [PATCH] Fix to allow a compilation under mips big endian with gcc
-
-The __MIPSEL__ is mips little endian specific, but we needed to
-compile for a big endian mips target that also happened to be a
-mips64. This commit replaces the __MIPSEL__ test with a __mips__ test
-which preserves the build on little endian and allows building for a
-big endian setup.
-
-	$ echo | mips64-linux-gcc -E -dM -
-	... snip snip ...
-	#define __mips__ 1
-	#define __MIPSEB__ 1
-
-Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
-Upstream-status: https://github.com/google/protobuf/pull/4657
----
- src/google/protobuf/stubs/platform_macros.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/google/protobuf/stubs/platform_macros.h b/src/google/protobuf/stubs/platform_macros.h
-index c3a64dd2..f9e2bff6 100644
---- a/src/google/protobuf/stubs/platform_macros.h
-+++ b/src/google/protobuf/stubs/platform_macros.h
-@@ -56,7 +56,7 @@
- #elif defined(__aarch64__)
- #define GOOGLE_PROTOBUF_ARCH_AARCH64 1
- #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
--#elif defined(__MIPSEL__)
-+#elif defined(__mips__)
- #if defined(__LP64__)
- #define GOOGLE_PROTOBUF_ARCH_MIPS64 1
- #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
--- 
-2.15.1 (Apple Git-101)
-
diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index bcd1f64de0..5856cf2852 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c3cab055964d554e4fd85067fe3e9eb45c9915cebcf537e97fafaa245376bce1  protobuf-cpp-3.6.0.tar.gz
+sha256 29a1db3b9bebcf054c540f13400563120ff29fbdd849b2c7a097ffe9d3d508eb  protobuf-cpp-3.9.1.tar.gz
 sha256 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 9caf87ed93..e698bac228 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.6.0
+PROTOBUF_VERSION = 3.9.1
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 652751c7b6..a6cd1b2f60 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6b399412cd68c7efe64d31824ad0db44f803aed91d0c6a9ea94272682c3da2df  protobuf-python-3.6.0.tar.gz
+sha256 d07934c7e78d424e5f0f2182c2f3bed47214481005b9614a7480d6aaac97e7ef  protobuf-python-3.9.1.tar.gz
 sha256 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.20.1
