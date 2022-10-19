Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15839C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 08:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A011E41B99;
	Wed, 19 Oct 2022 08:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A011E41B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piroLoujnejg; Wed, 19 Oct 2022 08:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53DDA4197C;
	Wed, 19 Oct 2022 08:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53DDA4197C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C02021BF2C7
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BE5C402F3
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE5C402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 440dUFmcy6a7 for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 08:05:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D77400F1
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D77400F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 635CF86EEF; Wed, 19 Oct 2022 08:05:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 09:59:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ec14fbf8ecb600274c7431d4992b50adcc1c8bee
X-Git-Newrev: 9dbeb7d0d9a70d30677ff49eb0b80f0cf19f7cec
X-Patchwork-Hint: ignore
Message-Id: <20221019080510.635CF86EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/freerdp: bump to
 version 2.8.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9dbeb7d0d9a70d30677ff49eb0b80f0cf19f7cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop fourth patch (already in version)

https://github.com/FreeRDP/FreeRDP/releases/tag/2.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a223802adb2c6d0aca45de78ce246421a270044e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-building-with-LibreSSL-2.7.0-or-newer.patch | 126 ---------------------
 package/freerdp/freerdp.hash                       |   4 +-
 package/freerdp/freerdp.mk                         |   2 +-
 3 files changed, 3 insertions(+), 129 deletions(-)

diff --git a/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch b/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch
deleted file mode 100644
index 3edf1ff3b3..0000000000
--- a/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 55a5a0a14ecef81c8ece1fea4a5a6004aebfeaff Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 27 Jun 2022 11:45:44 +0200
-Subject: [PATCH] Fix building with LibreSSL 2.7.0 or newer
-
-With LibreSSL 2.7.0 (or newer versions) some more structs have made
-opaque, which requires a few changes:
-
-- BIO_meth_new() and related functions are now defined by LibreSSL, the
-  versions from opensslcompat.{h,c} does not need to be used anymore.
-- HMAC_CTX is now opaque, HMAC_CTX_new(), EVP_MD_CTX_new, and related
-  functions should be used instead in winpr's hash.c.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://github.com/FreeRDP/FreeRDP/commit/436f212be3950917e4bb209aa5064e423f0dd882]
----
- libfreerdp/crypto/opensslcompat.c |  3 ++-
- libfreerdp/crypto/opensslcompat.h |  3 ++-
- winpr/libwinpr/crypto/hash.c      | 21 ++++++++++++++-------
- 3 files changed, 18 insertions(+), 9 deletions(-)
-
-diff --git a/libfreerdp/crypto/opensslcompat.c b/libfreerdp/crypto/opensslcompat.c
-index 701902dc2..314d6b51f 100644
---- a/libfreerdp/crypto/opensslcompat.c
-+++ b/libfreerdp/crypto/opensslcompat.c
-@@ -19,7 +19,8 @@
- 
- #include "opensslcompat.h"
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 
- BIO_METHOD* BIO_meth_new(int type, const char* name)
- {
-diff --git a/libfreerdp/crypto/opensslcompat.h b/libfreerdp/crypto/opensslcompat.h
-index 169e8e4c2..3ad5b6bd4 100644
---- a/libfreerdp/crypto/opensslcompat.h
-+++ b/libfreerdp/crypto/opensslcompat.h
-@@ -30,7 +30,8 @@
- 
- #include <openssl/opensslv.h>
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 
- #include <openssl/bio.h>
- #include <openssl/rsa.h>
-diff --git a/winpr/libwinpr/crypto/hash.c b/winpr/libwinpr/crypto/hash.c
-index 8265b2e90..5e94039e7 100644
---- a/winpr/libwinpr/crypto/hash.c
-+++ b/winpr/libwinpr/crypto/hash.c
-@@ -151,7 +151,8 @@ WINPR_HMAC_CTX* winpr_HMAC_New(void)
- 	WINPR_HMAC_CTX* ctx = NULL;
- #if defined(WITH_OPENSSL)
- 	HMAC_CTX* hmac = NULL;
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 
- 	if (!(hmac = (HMAC_CTX*)calloc(1, sizeof(HMAC_CTX))))
- 		return NULL;
-@@ -185,7 +186,8 @@ BOOL winpr_HMAC_Init(WINPR_HMAC_CTX* ctx, WINPR_MD_TYPE md, const BYTE* key, siz
- 	if (!evp || !hmac)
- 		return FALSE;
- 
--#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	HMAC_Init_ex(hmac, key, keylen, evp, NULL); /* no return value on OpenSSL 0.9.x */
- 	return TRUE;
- #else
-@@ -221,7 +223,8 @@ BOOL winpr_HMAC_Update(WINPR_HMAC_CTX* ctx, const BYTE* input, size_t ilen)
- {
- #if defined(WITH_OPENSSL)
- 	HMAC_CTX* hmac = (HMAC_CTX*)ctx;
--#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	HMAC_Update(hmac, input, ilen); /* no return value on OpenSSL 0.9.x */
- 	return TRUE;
- #else
-@@ -253,7 +256,8 @@ BOOL winpr_HMAC_Final(WINPR_HMAC_CTX* ctx, BYTE* output, size_t olen)
- 
- #if defined(WITH_OPENSSL)
- 	hmac = (HMAC_CTX*)ctx;
--#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	HMAC_Final(hmac, output, NULL); /* no return value on OpenSSL 0.9.x */
- 	return TRUE;
- #else
-@@ -279,7 +283,8 @@ void winpr_HMAC_Free(WINPR_HMAC_CTX* ctx)
- 
- 	if (hmac)
- 	{
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 		HMAC_CTX_cleanup(hmac);
- 		free(hmac);
- #else
-@@ -332,7 +337,8 @@ WINPR_DIGEST_CTX* winpr_Digest_New(void)
- 	WINPR_DIGEST_CTX* ctx = NULL;
- #if defined(WITH_OPENSSL)
- 	EVP_MD_CTX* mdctx;
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	mdctx = EVP_MD_CTX_create();
- #else
- 	mdctx = EVP_MD_CTX_new();
-@@ -464,7 +470,8 @@ void winpr_Digest_Free(WINPR_DIGEST_CTX* ctx)
- 
- 	if (mdctx)
- 	{
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 		EVP_MD_CTX_destroy(mdctx);
- #else
- 		EVP_MD_CTX_free(mdctx);
--- 
-2.36.1
-
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 2b7aa25999..a600a96172 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.7.0.tar.gz.sha256
-sha256  89000728b6e66ac37db018d6dc5f0981b530fd550ab748877ff42892dd0c166b  freerdp-2.7.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.8.0.tar.gz.sha256
+sha256  fd26a41c367ea1f23a06716725d19efa41fd572c4536348d39b3465b116b3703  freerdp-2.8.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index f4636724d3..c7e01fa541 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.7.0
+FREERDP_VERSION = 2.8.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
