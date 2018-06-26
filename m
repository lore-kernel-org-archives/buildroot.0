From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jun 2018 13:28:22 +0300
Subject: [Buildroot] [PATCH 1/2] libnss: drop obsolete patch
Message-ID: <d20e1c9116d8625fce1f4db9b44c4ab009fbba40.1530008903.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc implements RTLD_NOLOAD for quite some time now. Remove the patch
adding a dummy definition of RTLD_NOLOAD.

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnss/0001-uclibc.patch | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 package/libnss/0001-uclibc.patch

diff --git a/package/libnss/0001-uclibc.patch b/package/libnss/0001-uclibc.patch
deleted file mode 100644
index b81db930bed0..000000000000
--- a/package/libnss/0001-uclibc.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-uCLibc does not define RTLD_NOLOAD.
-
-[Gustavo: update for nss 3.16.1]
-Signed-off-by: Will Newton <will.newton@imgtec.com>
-
-diff -Nura nss-3.16.1.orig/nss/lib/freebl/stubs.c nss-3.16.1/nss/lib/freebl/stubs.c
---- nss-3.16.1.orig/nss/lib/freebl/stubs.c	2014-06-18 10:34:30.529997002 -0300
-+++ nss-3.16.1/nss/lib/freebl/stubs.c	2014-06-18 10:36:25.508882650 -0300
-@@ -594,6 +594,11 @@
-     return SECSuccess;
- }
- 
-+/* uClibc does not define RTLD_NOLOAD. */
-+#ifndef RTLD_NOLOAD
-+#define RTLD_NOLOAD 0
-+#endif
-+
- /*
-  * fetch the library if it's loaded. For NSS it should already be loaded
-  */
-- 
2.18.0
