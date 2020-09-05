From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 14:34:41 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/libzip: add patch
 from upstream to fix build
Message-ID: <20200905123344.F1B638028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=927ee70ed1ea35a2b901005a2a069d9b2ea1027a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Cherry-pick a patch from upstream project that fixes the build when used
with a uClibc based toolchain.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0e3febb75fe234b2f3a3a2fb11a99eeff1814a36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libzip/0002-Include-limits.h-for-INT_MAX.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/libzip/0002-Include-limits.h-for-INT_MAX.patch b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
new file mode 100644
index 0000000000..c488f05289
--- /dev/null
+++ b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
@@ -0,0 +1,27 @@
+From fd89e242d16128dedef08f47d99ae56aa19b0591 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C3=98rjan=20Malde?= <red@foxi.me>
+Date: Wed, 15 Jul 2020 12:16:16 +0200
+Subject: [PATCH] Include limits.h for INT_MAX
+
+[Retrieved from:
+https://github.com/nih-at/libzip/commit/fd89e242d16128dedef08f47d99ae56aa19b0591]
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+---
+ lib/zip_crypto_openssl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/zip_crypto_openssl.c b/lib/zip_crypto_openssl.c
+index 1cb00479..60f92758 100644
+--- a/lib/zip_crypto_openssl.c
++++ b/lib/zip_crypto_openssl.c
+@@ -38,6 +38,7 @@
+ #include "zip_crypto.h"
+ 
+ #include <openssl/rand.h>
++#include <limits.h>
+ 
+ #if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
+ #define USE_OPENSSL_1_0_API
+-- 
+2.28.0
+
