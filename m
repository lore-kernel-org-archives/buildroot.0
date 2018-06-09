From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Jun 2018 10:41:39 +0200
Subject: [Buildroot] [PATCH 1/1] json-c: bump to version 0.13.1
Message-ID: <20180609084139.16732-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch, issue has been properly fixed by:
https://github.com/json-c/json-c/commit/0f814e52dd22ee959a29ffcce36923aff62147b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../json-c/0001-configure.ac-remove-Werror.patch   | 32 ----------------------
 package/json-c/json-c.hash                         |  2 +-
 package/json-c/json-c.mk                           |  5 +---
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/json-c/0001-configure.ac-remove-Werror.patch

diff --git a/package/json-c/0001-configure.ac-remove-Werror.patch b/package/json-c/0001-configure.ac-remove-Werror.patch
deleted file mode 100644
index e877671519..0000000000
--- a/package/json-c/0001-configure.ac-remove-Werror.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 79d862ccaabc6620ce4b2783a44d6014ae837df9 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 31 Dec 2017 00:01:37 +0200
-Subject: [PATCH] configure.ac: remove -Werror
-
-The unconditional _REENTRANT macro causes a warning when building with a
-no-threads toolchain. Remove -Werror to fix the build.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: not upstreamable
-Issue reported upstream: https://github.com/json-c/json-c/issues/396
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 024c5aa0d687..74caa4d99e15 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -165,7 +165,7 @@ AS_IF([test "x$enable_Bsymbolic" = "xcheck"],
- AS_IF([test "x$enable_Bsymbolic" = "xyes"], [JSON_BSYMBOLIC_LDFLAGS=-Wl[,]-Bsymbolic-functions])
- AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
- 
--AX_APPEND_COMPILE_FLAGS([-Wall -Werror -Wcast-qual -Wno-error=deprecated-declarations])
-+AX_APPEND_COMPILE_FLAGS([-Wall -Wcast-qual -Wno-error=deprecated-declarations])
- AX_APPEND_COMPILE_FLAGS([-Wextra -Wwrite-string -Wno-unused-parameter])
- AX_APPEND_COMPILE_FLAGS([-D_GNU_SOURCE -D_REENTRANT])
- 
--- 
-2.15.1
-
diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index 41e614d6dc..0e03007476 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256 0316780be9ad16c42d7c26b015a784fd5df4b0909fef0aba51cfb13e492ac24d  json-c-0.13.tar.gz
+sha256 b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873  json-c-0.13.1.tar.gz
 # Locally calculated
 sha256 74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 450ee8b27b..57d8c35dd5 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.13
+JSON_C_VERSION = 0.13.1
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
-# Patching configure.ac
-JSON_C_AUTORECONF = YES
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
