From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 21:06:54 +0200
Subject: [Buildroot] [git commit] libnss: drop obsolete patch
Message-ID: <20180626190430.A037482B70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9100d3f20dd87bbd8de473b0b0321db5f31f83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc implements RTLD_NOLOAD for quite some time now. Remove the patch
adding a dummy definition of RTLD_NOLOAD.

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnss/0001-uclibc.patch | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/package/libnss/0001-uclibc.patch b/package/libnss/0001-uclibc.patch
deleted file mode 100644
index b81db930be..0000000000
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
