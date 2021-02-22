From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Mon, 22 Feb 2021 19:35:14 +0100
Subject: [Buildroot] [PATCH/next] package/libxcrypt: this patch has been
 merged into mainline
Message-ID: <20210222183514.1878-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---

Sorry guys, forgot the 'PATCH/next' on my previous submission title

 ...gost3411-core.c-fix-conversion-error.patch | 30 -------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch

diff --git a/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
deleted file mode 100644
index 1245216aad..0000000000
--- a/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c7bf2cf8e610bb26bece7f3a2bc5b47d7c659c7d Mon Sep 17 00:00:00 2001
-From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
-Date: Sat, 20 Feb 2021 16:51:04 +0100
-Subject: [PATCH] lib/alg-gost3411-core.c: fix conversion error seen by
- sensitive compilers
-
-Some compiler might be sensitive and raise an Warning/error on this line.
-
-Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
-[backported from upstream]
----
- lib/alg-gost3411-2012-core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/alg-gost3411-2012-core.c b/lib/alg-gost3411-2012-core.c
-index 13bb493..af3a36e 100644
---- a/lib/alg-gost3411-2012-core.c
-+++ b/lib/alg-gost3411-2012-core.c
-@@ -92,7 +92,7 @@ add512(const uint512_u *x, const uint512_u *y, uint512_u *r)
-     for (i = 0; i < 64; i++)
-     {
-         buf = xp[i] + yp[i] + (buf >> 8);
--        rp[i] = (unsigned char) buf & 0xFF;
-+        rp[i] = (unsigned char) (buf & 0xFF);
-     }
- #endif
- }
---
-2.20.1
-
-- 
2.20.1
