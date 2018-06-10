From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:57:25 +0200
Subject: [Buildroot] [git commit] libtirpc: bump to version 1.0.3
Message-ID: <20180610125527.82117866CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9475c20a81460b7f16159c7066e5f5a4c9b1107e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove 0006-include-stdint.h-for-uintptr_t.patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0006-include-stdint.h-for-uintptr_t.patch      | 31 ----------------------
 package/libtirpc/libtirpc.hash                     |  5 ++--
 package/libtirpc/libtirpc.mk                       |  2 +-
 3 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/libtirpc/0006-include-stdint.h-for-uintptr_t.patch b/package/libtirpc/0006-include-stdint.h-for-uintptr_t.patch
deleted file mode 100644
index 62031613d6..0000000000
--- a/package/libtirpc/0006-include-stdint.h-for-uintptr_t.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 18f8a605e176f0362da22fd1203eb7cedb136aaf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 20 Jun 2017 22:06:35 +0200
-Subject: [PATCH] include stdint.h for uintptr_t
-
-Fixes
-| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
-|   if (len < (uintptr_t)xdrs->x_base) {
-|              ^~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>
----
- src/xdr_sizeof.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/xdr_sizeof.c b/src/xdr_sizeof.c
-index d23fbd1..79d6707 100644
---- a/src/xdr_sizeof.c
-+++ b/src/xdr_sizeof.c
-@@ -39,6 +39,7 @@
- #include <rpc/xdr.h>
- #include <sys/types.h>
- #include <stdlib.h>
-+#include <stdint.h>
- #include "un-namespace.h"
- 
- /* ARGSUSED */
--- 
-2.9.4
-
diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 35ac6a2278..643a5d2050 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,4 +1,5 @@
 # From sourceforge's info on download page:
-sha1 2a8dc0e6eecc45be6597c8287b1d8e15cbee46e3  libtirpc-1.0.2.tar.bz2
+sha1 48adb32dc7c3b73c66f001c239da76b8398abf11  libtirpc-1.0.3.tar.bz2
 # Locally computed
-sha256 723c5ce92706cbb601a8db09110df1b4b69391643158f20ff587e20e7c5f90f5  libtirpc-1.0.2.tar.bz2
+sha256 86c3a78fc1bddefa96111dd233124c703b22a78884203c55c3e06b3be6a0fd5e  libtirpc-1.0.3.tar.bz2
+sha256 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 319b78c3f0..36f9f7ef21 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.0.2
+LIBTIRPC_VERSION = 1.0.3
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
