From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 20 Feb 2021 17:29:16 +0100
Subject: [Buildroot] [PATCH/next] package/libxcrypt: fix conversion error
Message-ID: <20210220162916.3424-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Fixes: http://autobuild.buildroot.net/results/e9a058a8c98daf197cd9d7ac632e0cb5707d524f

Some sensitive compilers may raise a warning that turns into an error on this line.

Patch submitted to mainline, waiting for approval, see:
https://github.com/besser82/libxcrypt/pull/119

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 ...gost3411-core.c-fix-conversion-error.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch

diff --git a/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
new file mode 100644
index 0000000000..5488d15a3d
--- /dev/null
+++ b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
@@ -0,0 +1,26 @@
+From c7bf2cf8e610bb26bece7f3a2bc5b47d7c659c7d Mon Sep 17 00:00:00 2001
+From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
+Date: Sat, 20 Feb 2021 16:51:04 +0100
+Subject: [PATCH] lib/alg-gost3411-core.c: fix conversion error
+
+Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
+---
+ lib/alg-gost3411-2012-core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/alg-gost3411-2012-core.c b/lib/alg-gost3411-2012-core.c
+index 13bb493..af3a36e 100644
+--- a/lib/alg-gost3411-2012-core.c
++++ b/lib/alg-gost3411-2012-core.c
+@@ -92,7 +92,7 @@ add512(const uint512_u *x, const uint512_u *y, uint512_u *r)
+     for (i = 0; i < 64; i++)
+     {
+         buf = xp[i] + yp[i] + (buf >> 8);
+-        rp[i] = (unsigned char) buf & 0xFF;
++        rp[i] = (unsigned char) (buf & 0xFF);
+     }
+ #endif
+ }
+--
+2.20.1
+
-- 
2.20.1
