From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:49:25 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/wolfssl: fix
 build with big endian
Message-ID: <20200829174152.6186686E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=797d3cba39c1b4a8cc7a85d1902442a2de7c61a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:
 - http://autobuild.buildroot.org/results/21098180d386890025ed5cdd243bf5a9b444c5cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d0ac6246ca9a42c3e08ecc97b2ddb3fe0267257f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Words-available-for-big-and-little-endian.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-endian.patch b/package/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-endian.patch
new file mode 100644
index 0000000000..48a318d53e
--- /dev/null
+++ b/package/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-endian.patch
@@ -0,0 +1,32 @@
+From b90acc91d0cd276befe7f08f87ba2dc5ee7122ff Mon Sep 17 00:00:00 2001
+From: Tesfa Mael <tesfa@wolfssl.com>
+Date: Wed, 26 Aug 2020 10:13:06 -0700
+Subject: [PATCH] Make ByteReverseWords available for big and little endian
+
+[Retrieved from:
+https://github.com/wolfSSL/wolfssl/pull/3255/commits/b90acc91d0cd276befe7f08f87ba2dc5ee7122ff]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ wolfcrypt/src/misc.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/wolfcrypt/src/misc.c b/wolfcrypt/src/misc.c
+index fe66ee0a1a..23bfa1adc5 100644
+--- a/wolfcrypt/src/misc.c
++++ b/wolfcrypt/src/misc.c
+@@ -120,7 +120,6 @@ WC_STATIC WC_INLINE word32 ByteReverseWord32(word32 value)
+     return rotlFixed(value, 16U);
+ #endif
+ }
+-#if defined(LITTLE_ENDIAN_ORDER)
+ /* This routine performs a byte swap of words array of a given count. */
+ WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
+                                     word32 byteCount)
+@@ -131,7 +130,6 @@ WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
+         out[i] = ByteReverseWord32(in[i]);
+ 
+ }
+-#endif /* LITTLE_ENDIAN_ORDER */
+ 
+ #if defined(WORD64_AVAILABLE) && !defined(WOLFSSL_NO_WORD64_OPS)
+ 
