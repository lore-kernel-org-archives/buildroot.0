From: Paul Cercueil <paul@crapouillou.net>
Date: Fri,  4 Sep 2020 16:18:39 +0200
Subject: [Buildroot] [PATCH v2] package/libzip: add patch from upstream to
 fix build
Message-ID: <20200904141839.29071-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cherry-pick a patch from upstream project that fixes the build when used
with a uClibc based toolchain.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Update commit URL

 .../0002-Include-limits.h-for-INT_MAX.patch   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libzip/0002-Include-limits.h-for-INT_MAX.patch

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
-- 
2.28.0
