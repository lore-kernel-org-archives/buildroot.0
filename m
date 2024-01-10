Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9457C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BEC3437A1;
	Wed, 10 Jan 2024 20:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BEC3437A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjC2RTzMOlda; Wed, 10 Jan 2024 20:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 342AB437FE;
	Wed, 10 Jan 2024 20:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342AB437FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3352F1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A75183C14
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A75183C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEsaL-fuQ0Qj for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 377B883C67
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 377B883C67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 350BE85D62; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:13:17 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 555bf35d3a88a572132e6c1e16f2776611160c29
X-Git-Newrev: 80757aadd0d73af48cdcbe1d942f420a17da4c58
X-Patchwork-Hint: ignore
Message-Id: <20240110202204.350BE85D62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libssh2: fix
 build with mbedtls
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

commit: https://git.buildroot.net/buildroot/commit/?id=80757aadd0d73af48cdcbe1d942f420a17da4c58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/3f2/3f295deaee31266f394035924ec0192edcca4b1e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a932fbed9c230310189f72a1f4f5c0cbe173a17e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-use-more-size_t-to-sync-up-with-crypto-h.patch | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch b/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch
new file mode 100644
index 0000000000..3cac133864
--- /dev/null
+++ b/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch
@@ -0,0 +1,106 @@
+From 1153ebdeba563ac657b525edd6bf6da68b1fe5e2 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Tue, 30 May 2023 17:28:03 +0000
+Subject: [PATCH] mbedtls: use more `size_t` to sync up with `crypto.h`
+
+Ref: 5a96f494ee0b00282afb2db2e091246fc5e1774a #846 #879
+
+Fixes #1053
+Closes #1054
+
+Upstream: https://github.com/libssh2/libssh2/commit/1153ebdeba563ac657b525edd6bf6da68b1fe5e2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mbedtls.c | 14 ++++++++------
+ src/mbedtls.h | 13 ++++++-------
+ 2 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/mbedtls.c b/src/mbedtls.c
+index e387cdb19..cd14a4bd8 100644
+--- a/src/mbedtls.c
++++ b/src/mbedtls.c
+@@ -186,7 +186,7 @@ _libssh2_mbedtls_cipher_dtor(_libssh2_cipher_ctx *ctx)
+ int
+ _libssh2_mbedtls_hash_init(mbedtls_md_context_t *ctx,
+                            mbedtls_md_type_t mdtype,
+-                           const unsigned char *key, unsigned long keylen)
++                           const unsigned char *key, size_t keylen)
+ {
+     const mbedtls_md_info_t *md_info;
+     int ret, hmac;
+@@ -221,7 +221,7 @@ _libssh2_mbedtls_hash_final(mbedtls_md_context_t *ctx, unsigned char *hash)
+ }
+ 
+ int
+-_libssh2_mbedtls_hash(const unsigned char *data, unsigned long datalen,
++_libssh2_mbedtls_hash(const unsigned char *data, size_t datalen,
+                       mbedtls_md_type_t mdtype, unsigned char *hash)
+ {
+     const mbedtls_md_info_t *md_info;
+@@ -497,8 +497,9 @@ int
+ _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
+                                  size_t hash_len,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m, unsigned long m_len)
++                                 size_t sig_len,
++                                 const unsigned char *m,
++                                 size_t m_len)
+ {
+     int ret;
+     int md_type;
+@@ -548,8 +549,9 @@ _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
+ int
+ _libssh2_mbedtls_rsa_sha1_verify(libssh2_rsa_ctx * rsactx,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m, unsigned long m_len)
++                                 size_t sig_len,
++                                 const unsigned char *m,
++                                 size_t m_len)
+ {
+     return _libssh2_mbedtls_rsa_sha2_verify(rsactx, SHA_DIGEST_LENGTH,
+                                             sig, sig_len, m, m_len);
+diff --git a/src/mbedtls.h b/src/mbedtls.h
+index d9592f721..03484da17 100644
+--- a/src/mbedtls.h
++++ b/src/mbedtls.h
+@@ -478,12 +478,12 @@ _libssh2_mbedtls_cipher_dtor(_libssh2_cipher_ctx *ctx);
+ int
+ _libssh2_mbedtls_hash_init(mbedtls_md_context_t *ctx,
+                            mbedtls_md_type_t mdtype,
+-                           const unsigned char *key, unsigned long keylen);
++                           const unsigned char *key, size_t keylen);
+ 
+ int
+ _libssh2_mbedtls_hash_final(mbedtls_md_context_t *ctx, unsigned char *hash);
+ int
+-_libssh2_mbedtls_hash(const unsigned char *data, unsigned long datalen,
++_libssh2_mbedtls_hash(const unsigned char *data, size_t datalen,
+                       mbedtls_md_type_t mdtype, unsigned char *hash);
+ 
+ _libssh2_bn *
+@@ -526,9 +526,8 @@ _libssh2_mbedtls_rsa_new_private_frommemory(libssh2_rsa_ctx **rsa,
+ int
+ _libssh2_mbedtls_rsa_sha1_verify(libssh2_rsa_ctx *rsa,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m,
+-                                 unsigned long m_len);
++                                 size_t sig_len,
++                                 const unsigned char *m, size_t m_len);
+ int
+ _libssh2_mbedtls_rsa_sha1_sign(LIBSSH2_SESSION *session,
+                                libssh2_rsa_ctx *rsa,
+@@ -540,8 +539,8 @@ int
+ _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
+                                  size_t hash_len,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m, unsigned long m_len);
++                                 size_t sig_len,
++                                 const unsigned char *m, size_t m_len);
+ int
+ _libssh2_mbedtls_rsa_sha2_sign(LIBSSH2_SESSION *session,
+                                libssh2_rsa_ctx *rsa,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
