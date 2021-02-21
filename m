From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2021 22:54:55 +0100
Subject: [Buildroot] [git commit] package/libxcrypt: fix conversion error
Message-ID: <20210308072134.E209E81607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04f0ed0a444292075dfcd6abf0f8e1b10e492e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.net/results/e9a058a8c98daf197cd9d7ac632e0cb5707d524f

Some sensitive compilers may raise a warning that turns into an error on this line.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[yann.morin.1998 at free.fr: backport the actual commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-alg-gost3411-core.c-fix-conversion-error.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
new file mode 100644
index 0000000000..1245216aad
--- /dev/null
+++ b/package/libxcrypt/0001-lib-alg-gost3411-core.c-fix-conversion-error.patch
@@ -0,0 +1,30 @@
+From c7bf2cf8e610bb26bece7f3a2bc5b47d7c659c7d Mon Sep 17 00:00:00 2001
+From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
+Date: Sat, 20 Feb 2021 16:51:04 +0100
+Subject: [PATCH] lib/alg-gost3411-core.c: fix conversion error seen by
+ sensitive compilers
+
+Some compiler might be sensitive and raise an Warning/error on this line.
+
+Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
+[backported from upstream]
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
