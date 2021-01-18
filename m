From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2021 21:18:37 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/wolfssl: security
 bump to version 4.6.0
Message-ID: <20210118200733.4569A81846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77ed63791279eb98949ffebfa5866b2e7fb951b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

- Fix CVE-2020-36177: RsaPad_PSS in wolfcrypt/src/rsa.c in wolfSSL
  before 4.6.0 has an out-of-bounds write for certain relationships
  between key size and digest size.
- Drop patch (already in version)

https://github.com/wolfSSL/wolfssl/releases/tag/v4.6.0-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6a2d5ab0ae6e36fbfea06f9c08215cdc3a5e5daf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Words-available-for-big-and-little-endian.patch | 32 ----------------------
 package/wolfssl/wolfssl.hash                       |  2 +-
 package/wolfssl/wolfssl.mk                         |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-endian.patch b/package/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-endian.patch
deleted file mode 100644
index 48a318d53e..0000000000
--- a/package/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-endian.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b90acc91d0cd276befe7f08f87ba2dc5ee7122ff Mon Sep 17 00:00:00 2001
-From: Tesfa Mael <tesfa@wolfssl.com>
-Date: Wed, 26 Aug 2020 10:13:06 -0700
-Subject: [PATCH] Make ByteReverseWords available for big and little endian
-
-[Retrieved from:
-https://github.com/wolfSSL/wolfssl/pull/3255/commits/b90acc91d0cd276befe7f08f87ba2dc5ee7122ff]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- wolfcrypt/src/misc.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/wolfcrypt/src/misc.c b/wolfcrypt/src/misc.c
-index fe66ee0a1a..23bfa1adc5 100644
---- a/wolfcrypt/src/misc.c
-+++ b/wolfcrypt/src/misc.c
-@@ -120,7 +120,6 @@ WC_STATIC WC_INLINE word32 ByteReverseWord32(word32 value)
-     return rotlFixed(value, 16U);
- #endif
- }
--#if defined(LITTLE_ENDIAN_ORDER)
- /* This routine performs a byte swap of words array of a given count. */
- WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
-                                     word32 byteCount)
-@@ -131,7 +130,6 @@ WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
-         out[i] = ByteReverseWord32(in[i]);
- 
- }
--#endif /* LITTLE_ENDIAN_ORDER */
- 
- #if defined(WORD64_AVAILABLE) && !defined(WOLFSSL_NO_WORD64_OPS)
- 
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 0ee55276dc..f5a25fe980 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7de62300ce14daa0051bfefc7c4d6302f96cabc768b6ae49eda77523b118250c  wolfssl-4.5.0-stable.tar.gz
+sha256  053aefbb02d0b06b27c5e2df6875b4b587318755b7db9d6aa8d72206b310a848  wolfssl-4.6.0-stable.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index e2833144fb..2023401147 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.5.0-stable
+WOLFSSL_VERSION = 4.6.0-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
