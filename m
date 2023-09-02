Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116DDCA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B990B40574;
	Sat,  2 Sep 2023 07:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B990B40574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DYKljPoSfyF; Sat,  2 Sep 2023 07:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF2604060D;
	Sat,  2 Sep 2023 07:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2604060D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAA9D1BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C51CC8219A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51CC8219A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IEkn9Ka8ZPjU for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE9FD82154
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE9FD82154
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B4CA867E8; Sat,  2 Sep 2023 07:46:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:44:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ff6fae8bc1e995681cc906c4595205b5dc3f5586
X-Git-Newrev: de9187eca28adc3733b1842d97666c7eb1c6b380
X-Patchwork-Hint: ignore
Message-Id: <20230902074620.9B4CA867E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsrtp: bump to
 version 2.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de9187eca28adc3733b1842d97666c7eb1c6b380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/cisco/libsrtp/releases/tag/v2.5.0

See detailed change log:
https://github.com/cisco/libsrtp/blob/v2.5.0/CHANGES#L3-L43

Dropped patch wich was already upstream.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch | 86 ----------------------
 package/libsrtp/libsrtp.hash                       |  2 +-
 package/libsrtp/libsrtp.mk                         |  2 +-
 4 files changed, 2 insertions(+), 89 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e652742f25..fea8530518 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -781,7 +781,6 @@ package/libsoxr/0001-Add-Libs.private-for-static-linking.patch Upstream
 package/libspatialindex/0001-allow-building-static-libs.patch Upstream
 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch Upstream
 package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch Upstream
-package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch Upstream
 package/libsvg/0001-fix-expat-static-declaration.patch Upstream
 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch Upstream
 package/libsvgtiny/0001-disable-debug-printfs.patch Upstream
diff --git a/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
deleted file mode 100644
index 68bfb085f7..0000000000
--- a/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 16483b18a9980575bee23898b2dbfbe2a4675d84 Mon Sep 17 00:00:00 2001
-From: Klemens Nanni <kn@openbsd.org>
-Date: Sat, 15 Jan 2022 23:19:35 +0300
-Subject: [PATCH] Remove compatibility code for legacy OpenSSL to fix LibreSSL
- build
-
-In current LibreSSL, `HMAC_CTX` aka. `struct hmac_ctx_st` is an opaque
-structure as of LibreSSL hmac.h revision 1.15 (14.01.2022) [0], thus
-`sizeof(HMAC_CTX)` fails to compile.
-
-The non-legacy code path should compile with LibreSSL versions as old
-as 2.7.0 (21.03.2018).
-
-Found while building https://github.com/desktop-app/tg_owt which bundles
-libsrtp 2.2.0 [1] on OpenBSD 7.0 -CURRENT/with latest LibreSSL.
-
-Suggestion to remove the legacy code from Theo Buehler, thanks.
-
-0: http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/lib/libcrypto/hmac/hmac.h?rev=1.15&content-type=text/x-cvsweb-markup
-1: https://github.com/desktop-app/tg_owt/blob/6708e0d31a73e64fe12f54829bf4060c41b2658e/src/third_party/libsrtp/crypto/hash/hmac_ossl.c#L85
-
-[Retrieved from:
-https://github.com/cisco/libsrtp/commit/16483b18a9980575bee23898b2dbfbe2a4675d84]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- crypto/hash/hmac_ossl.c | 29 -----------------------------
- 1 file changed, 29 deletions(-)
-
-diff --git a/crypto/hash/hmac_ossl.c b/crypto/hash/hmac_ossl.c
-index ee6b0b58..c23c7f21 100644
---- a/crypto/hash/hmac_ossl.c
-+++ b/crypto/hash/hmac_ossl.c
-@@ -78,26 +78,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
-         return srtp_err_status_bad_param;
-     }
- 
--/* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
--   using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
--    {
--        /* allocate memory for auth and HMAC_CTX structures */
--        uint8_t *pointer;
--        HMAC_CTX *new_hmac_ctx;
--        pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
--                                               sizeof(srtp_auth_t));
--        if (pointer == NULL) {
--            return srtp_err_status_alloc_fail;
--        }
--        *a = (srtp_auth_t *)pointer;
--        (*a)->state = pointer + sizeof(srtp_auth_t);
--        new_hmac_ctx = (HMAC_CTX *)((*a)->state);
--
--        HMAC_CTX_init(new_hmac_ctx);
--    }
--
--#else
-     *a = (srtp_auth_t *)srtp_crypto_alloc(sizeof(srtp_auth_t));
-     if (*a == NULL) {
-         return srtp_err_status_alloc_fail;
-@@ -109,7 +89,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
-         *a = NULL;
-         return srtp_err_status_alloc_fail;
-     }
--#endif
- 
-     /* set pointers */
-     (*a)->type = &srtp_hmac;
-@@ -126,18 +105,10 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
- 
-     hmac_ctx = (HMAC_CTX *)a->state;
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
--    HMAC_CTX_cleanup(hmac_ctx);
--
--    /* zeroize entire state*/
--    octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
--
--#else
-     HMAC_CTX_free(hmac_ctx);
- 
-     /* zeroize entire state*/
-     octet_string_set_to_zero(a, sizeof(srtp_auth_t));
--#endif
- 
-     /* free memory */
-     srtp_crypto_free(a);
diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 8e51e68ac2..f95dc2e7b0 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3b1bcb14ebda572b04b9bdf07574a449c84cb924905414e4d94e62837d22b628  libsrtp-2.4.2.tar.gz
+sha256  8a43ef8e9ae2b665292591af62aa1a4ae41e468b6d98d8258f91478735da4e09  libsrtp-2.5.0.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index e7a771c6b2..0ffdd98283 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.4.2
+LIBSRTP_VERSION = 2.5.0
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
