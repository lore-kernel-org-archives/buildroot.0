From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:34:20 +0200
Subject: [Buildroot] [git commit] package/linknx: drop a musl-compatibility
	patch
Message-ID: <20160819093442.17EBF8226F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39812f5dfd09c1f48b7b2f403235debf69ced786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now always have a sys/cdefs.h, so we can drop this patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linknx/0002-musl-cdefs.patch | 37 ------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/package/linknx/0002-musl-cdefs.patch b/package/linknx/0002-musl-cdefs.patch
deleted file mode 100644
index 59e28ca..0000000
--- a/package/linknx/0002-musl-cdefs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Do not use the non-standard <sys/cdefs.h> header
-
-<sys/cdefs.h> is glibc-specific, and should be used only internally by
-glibc, not by external libraries/programs. It is not available in all
-standard C libraries.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(Patch sent upstream: https://sourceforge.net/p/linknx/patches/21/)
-
-diff -uNr linknx-0.0.1.32.org/include/eibclient.h linknx-0.0.1.32/include/eibclient.h
---- linknx-0.0.1.32.org/include/eibclient.h	2007-10-11 01:55:33.000000000 +0200
-+++ linknx-0.0.1.32/include/eibclient.h	2016-01-23 23:21:17.315006629 +0100
-@@ -27,11 +27,12 @@
- #ifndef EIBCLIENT_H
- #define EIBCLIENT_H
- 
--#include "sys/cdefs.h"
- #include "stdint.h"
- #include <pthsem.h>
- 
--__BEGIN_DECLS;
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- #include "eibloadresult.h"
- 
-@@ -705,5 +706,8 @@
-  */
- int EIB_LoadImage_async (EIBConnection * con, const uint8_t * image, int len);
- 
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
-+
- #endif
