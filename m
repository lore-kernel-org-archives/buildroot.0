Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7542FC54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 21:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1707380EEA;
	Fri, 23 May 2025 21:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl_yveVoXU5o; Fri, 23 May 2025 21:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 677A280CF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677A280CF0;
	Fri, 23 May 2025 21:50:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 399A1119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 21:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AD2B6087F
 for <buildroot@buildroot.org>; Fri, 23 May 2025 21:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfaBw4cBxwY0 for <buildroot@buildroot.org>;
 Fri, 23 May 2025 21:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B686C6080C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B686C6080C
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B686C6080C
 for <buildroot@buildroot.org>; Fri, 23 May 2025 21:50:55 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id B4B61E00196;
 Fri, 23 May 2025 23:50:51 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Fri, 23 May 2025 23:50:45 +0200
Message-ID: <20250523215050.28908-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748037051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VkdEDJUKaf1Ve3l3areucv+9JDuLyrWxzD8Hc46YOB4=;
 b=Vohw8kFsdTfFnbPcQnQuEXYwFW30kiA++qAAsagGoSb05yZ8cbWLz3K0StvhFGatFuUq7C
 GZJmAnlg5REOr0G/ZIHbaFVLYfRmr0Xv5s1nK0r72QlfivV47kwMQNvWS55RPuyY3Dzea7
 2EtsdnGXS/hmODSOByQNZdDilhfhPfU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=Vohw8kFs
Subject: [Buildroot] [PATCH 1/1] package/libssh2: bump to version 1.11.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://libssh2.org/changes.html#1.11.1

Among other things, this release includes the patches previously carried
by Buildroot and also has fixes for build issues with mbedTLS 3.6.x. It
also includes a purely cosmetic copyright bump[1].

Builds with test-pkg against all three crypto providers.

Fixes: https://autobuild.buildroot.org/results/306/30699f986c6bcd1ab247d92c4ba0999f09aa226f

[1] https://github.com/libssh2/libssh2/commit/187d89bb0740400e8fa0b5f1441d089392797f53

Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...more-size_t-to-sync-up-with-crypto-h.patch | 106 ----
 ...o-fix-CVE-2023-48795-Terrapin-Attack.patch | 467 ------------------
 package/libssh2/libssh2.hash                  |   4 +-
 package/libssh2/libssh2.mk                    |   5 +-
 4 files changed, 3 insertions(+), 579 deletions(-)
 delete mode 100644 package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch
 delete mode 100644 package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch

diff --git a/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch b/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch
deleted file mode 100644
index 3cac133864..0000000000
--- a/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 1153ebdeba563ac657b525edd6bf6da68b1fe5e2 Mon Sep 17 00:00:00 2001
-From: Viktor Szakats <commit@vsz.me>
-Date: Tue, 30 May 2023 17:28:03 +0000
-Subject: [PATCH] mbedtls: use more `size_t` to sync up with `crypto.h`
-
-Ref: 5a96f494ee0b00282afb2db2e091246fc5e1774a #846 #879
-
-Fixes #1053
-Closes #1054
-
-Upstream: https://github.com/libssh2/libssh2/commit/1153ebdeba563ac657b525edd6bf6da68b1fe5e2
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/mbedtls.c | 14 ++++++++------
- src/mbedtls.h | 13 ++++++-------
- 2 files changed, 14 insertions(+), 13 deletions(-)
-
-diff --git a/src/mbedtls.c b/src/mbedtls.c
-index e387cdb19..cd14a4bd8 100644
---- a/src/mbedtls.c
-+++ b/src/mbedtls.c
-@@ -186,7 +186,7 @@ _libssh2_mbedtls_cipher_dtor(_libssh2_cipher_ctx *ctx)
- int
- _libssh2_mbedtls_hash_init(mbedtls_md_context_t *ctx,
-                            mbedtls_md_type_t mdtype,
--                           const unsigned char *key, unsigned long keylen)
-+                           const unsigned char *key, size_t keylen)
- {
-     const mbedtls_md_info_t *md_info;
-     int ret, hmac;
-@@ -221,7 +221,7 @@ _libssh2_mbedtls_hash_final(mbedtls_md_context_t *ctx, unsigned char *hash)
- }
- 
- int
--_libssh2_mbedtls_hash(const unsigned char *data, unsigned long datalen,
-+_libssh2_mbedtls_hash(const unsigned char *data, size_t datalen,
-                       mbedtls_md_type_t mdtype, unsigned char *hash)
- {
-     const mbedtls_md_info_t *md_info;
-@@ -497,8 +497,9 @@ int
- _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
-                                  size_t hash_len,
-                                  const unsigned char *sig,
--                                 unsigned long sig_len,
--                                 const unsigned char *m, unsigned long m_len)
-+                                 size_t sig_len,
-+                                 const unsigned char *m,
-+                                 size_t m_len)
- {
-     int ret;
-     int md_type;
-@@ -548,8 +549,9 @@ _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
- int
- _libssh2_mbedtls_rsa_sha1_verify(libssh2_rsa_ctx * rsactx,
-                                  const unsigned char *sig,
--                                 unsigned long sig_len,
--                                 const unsigned char *m, unsigned long m_len)
-+                                 size_t sig_len,
-+                                 const unsigned char *m,
-+                                 size_t m_len)
- {
-     return _libssh2_mbedtls_rsa_sha2_verify(rsactx, SHA_DIGEST_LENGTH,
-                                             sig, sig_len, m, m_len);
-diff --git a/src/mbedtls.h b/src/mbedtls.h
-index d9592f721..03484da17 100644
---- a/src/mbedtls.h
-+++ b/src/mbedtls.h
-@@ -478,12 +478,12 @@ _libssh2_mbedtls_cipher_dtor(_libssh2_cipher_ctx *ctx);
- int
- _libssh2_mbedtls_hash_init(mbedtls_md_context_t *ctx,
-                            mbedtls_md_type_t mdtype,
--                           const unsigned char *key, unsigned long keylen);
-+                           const unsigned char *key, size_t keylen);
- 
- int
- _libssh2_mbedtls_hash_final(mbedtls_md_context_t *ctx, unsigned char *hash);
- int
--_libssh2_mbedtls_hash(const unsigned char *data, unsigned long datalen,
-+_libssh2_mbedtls_hash(const unsigned char *data, size_t datalen,
-                       mbedtls_md_type_t mdtype, unsigned char *hash);
- 
- _libssh2_bn *
-@@ -526,9 +526,8 @@ _libssh2_mbedtls_rsa_new_private_frommemory(libssh2_rsa_ctx **rsa,
- int
- _libssh2_mbedtls_rsa_sha1_verify(libssh2_rsa_ctx *rsa,
-                                  const unsigned char *sig,
--                                 unsigned long sig_len,
--                                 const unsigned char *m,
--                                 unsigned long m_len);
-+                                 size_t sig_len,
-+                                 const unsigned char *m, size_t m_len);
- int
- _libssh2_mbedtls_rsa_sha1_sign(LIBSSH2_SESSION *session,
-                                libssh2_rsa_ctx *rsa,
-@@ -540,8 +539,8 @@ int
- _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
-                                  size_t hash_len,
-                                  const unsigned char *sig,
--                                 unsigned long sig_len,
--                                 const unsigned char *m, unsigned long m_len);
-+                                 size_t sig_len,
-+                                 const unsigned char *m, size_t m_len);
- int
- _libssh2_mbedtls_rsa_sha2_sign(LIBSSH2_SESSION *session,
-                                libssh2_rsa_ctx *rsa,
diff --git a/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch b/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
deleted file mode 100644
index 8187719477..0000000000
--- a/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
+++ /dev/null
@@ -1,467 +0,0 @@
-From 3a80751dce7b7d98b9d9006fb37213a1e4af7ac5 Mon Sep 17 00:00:00 2001
-From: Michael Buckley <michael@buckleyisms.com>
-Date: Thu, 30 Nov 2023 15:08:02 -0800
-Subject: [PATCH] src: add 'strict KEX' to fix CVE-2023-48795 "Terrapin Attack"
-
-Refs:
-https://terrapin-attack.com/
-https://seclists.org/oss-sec/2023/q4/292
-https://osv.dev/list?ecosystem=&q=CVE-2023-48795
-https://github.com/advisories/GHSA-45x7-px36-x8w8
-https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-48795
-
-Fixes #1290
-Closes #1291
-
-Upstream: https://github.com/libssh2/libssh2/commit/d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/kex.c          | 63 +++++++++++++++++++++++------------
- src/libssh2_priv.h | 18 +++++++---
- src/packet.c       | 83 +++++++++++++++++++++++++++++++++++++++++++---
- src/packet.h       |  2 +-
- src/session.c      |  3 ++
- src/transport.c    | 12 ++++++-
- 6 files changed, 149 insertions(+), 32 deletions(-)
-
-diff --git a/src/kex.c b/src/kex.c
-index d4034a0a953e..b4b748cac4ee 100644
---- a/src/kex.c
-+++ b/src/kex.c
-@@ -3037,6 +3037,13 @@ kex_method_extension_negotiation = {
-     0,
- };
- 
-+static const LIBSSH2_KEX_METHOD
-+kex_method_strict_client_extension = {
-+    "kex-strict-c-v00@openssh.com",
-+    NULL,
-+    0,
-+};
-+
- static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
- #if LIBSSH2_ED25519
-     &kex_method_ssh_curve25519_sha256,
-@@ -3055,6 +3062,7 @@ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
-     &kex_method_diffie_helman_group1_sha1,
-     &kex_method_diffie_helman_group_exchange_sha1,
-     &kex_method_extension_negotiation,
-+    &kex_method_strict_client_extension,
-     NULL
- };
- 
-@@ -3307,13 +3315,13 @@ static int kexinit(LIBSSH2_SESSION * session)
-     return 0;
- }
- 
--/* kex_agree_instr
-+/* _libssh2_kex_agree_instr
-  * Kex specific variant of strstr()
-  * Needle must be preceded by BOL or ',', and followed by ',' or EOL
-  */
--static unsigned char *
--kex_agree_instr(unsigned char *haystack, size_t haystack_len,
--                const unsigned char *needle, size_t needle_len)
-+unsigned char *
-+_libssh2_kex_agree_instr(unsigned char *haystack, size_t haystack_len,
-+                         const unsigned char *needle, size_t needle_len)
- {
-     unsigned char *s;
-     unsigned char *end_haystack;
-@@ -3398,7 +3406,7 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
-         while(s && *s) {
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
--            if(kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
-                 const LIBSSH2_HOSTKEY_METHOD *method =
-                     (const LIBSSH2_HOSTKEY_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3432,9 +3440,9 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
-     }
- 
-     while(hostkeyp && (*hostkeyp) && (*hostkeyp)->name) {
--        s = kex_agree_instr(hostkey, hostkey_len,
--                            (unsigned char *) (*hostkeyp)->name,
--                            strlen((*hostkeyp)->name));
-+        s = _libssh2_kex_agree_instr(hostkey, hostkey_len,
-+                                     (unsigned char *) (*hostkeyp)->name,
-+                                     strlen((*hostkeyp)->name));
-         if(s) {
-             /* So far so good, but does it suit our purposes? (Encrypting vs
-                Signing) */
-@@ -3468,6 +3476,12 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
- {
-     const LIBSSH2_KEX_METHOD **kexp = libssh2_kex_methods;
-     unsigned char *s;
-+    const unsigned char *strict =
-+        (unsigned char *)"kex-strict-s-v00@openssh.com";
-+
-+    if(_libssh2_kex_agree_instr(kex, kex_len, strict, 28)) {
-+        session->kex_strict = 1;
-+    }
- 
-     if(session->kex_prefs) {
-         s = (unsigned char *) session->kex_prefs;
-@@ -3475,7 +3489,7 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
-         while(s && *s) {
-             unsigned char *q, *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
--            q = kex_agree_instr(kex, kex_len, s, method_len);
-+            q = _libssh2_kex_agree_instr(kex, kex_len, s, method_len);
-             if(q) {
-                 const LIBSSH2_KEX_METHOD *method = (const LIBSSH2_KEX_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3509,9 +3523,9 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
-     }
- 
-     while(*kexp && (*kexp)->name) {
--        s = kex_agree_instr(kex, kex_len,
--                            (unsigned char *) (*kexp)->name,
--                            strlen((*kexp)->name));
-+        s = _libssh2_kex_agree_instr(kex, kex_len,
-+                                     (unsigned char *) (*kexp)->name,
-+                                     strlen((*kexp)->name));
-         if(s) {
-             /* We've agreed on a key exchange method,
-              * Can we agree on a hostkey that works with this kex?
-@@ -3555,7 +3569,7 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
- 
--            if(kex_agree_instr(crypt, crypt_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(crypt, crypt_len, s, method_len)) {
-                 const LIBSSH2_CRYPT_METHOD *method =
-                     (const LIBSSH2_CRYPT_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3577,9 +3591,9 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
-     }
- 
-     while(*cryptp && (*cryptp)->name) {
--        s = kex_agree_instr(crypt, crypt_len,
--                            (unsigned char *) (*cryptp)->name,
--                            strlen((*cryptp)->name));
-+        s = _libssh2_kex_agree_instr(crypt, crypt_len,
-+                                     (unsigned char *) (*cryptp)->name,
-+                                     strlen((*cryptp)->name));
-         if(s) {
-             endpoint->crypt = *cryptp;
-             return 0;
-@@ -3619,7 +3633,7 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
- 
--            if(kex_agree_instr(mac, mac_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(mac, mac_len, s, method_len)) {
-                 const LIBSSH2_MAC_METHOD *method = (const LIBSSH2_MAC_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-                                            (const LIBSSH2_COMMON_METHOD **)
-@@ -3640,8 +3654,9 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
-     }
- 
-     while(*macp && (*macp)->name) {
--        s = kex_agree_instr(mac, mac_len, (unsigned char *) (*macp)->name,
--                            strlen((*macp)->name));
-+        s = _libssh2_kex_agree_instr(mac, mac_len,
-+                                     (unsigned char *) (*macp)->name,
-+                                     strlen((*macp)->name));
-         if(s) {
-             endpoint->mac = *macp;
-             return 0;
-@@ -3672,7 +3687,7 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
- 
--            if(kex_agree_instr(comp, comp_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(comp, comp_len, s, method_len)) {
-                 const LIBSSH2_COMP_METHOD *method =
-                     (const LIBSSH2_COMP_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3694,8 +3709,9 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
-     }
- 
-     while(*compp && (*compp)->name) {
--        s = kex_agree_instr(comp, comp_len, (unsigned char *) (*compp)->name,
--                            strlen((*compp)->name));
-+        s = _libssh2_kex_agree_instr(comp, comp_len,
-+                                     (unsigned char *) (*compp)->name,
-+                                     strlen((*compp)->name));
-         if(s) {
-             endpoint->comp = *compp;
-             return 0;
-@@ -3876,6 +3892,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-                 session->local.kexinit = key_state->oldlocal;
-                 session->local.kexinit_len = key_state->oldlocal_len;
-                 key_state->state = libssh2_NB_state_idle;
-+                session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-                 session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
-                 session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
-                 return -1;
-@@ -3901,6 +3918,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-                 session->local.kexinit = key_state->oldlocal;
-                 session->local.kexinit_len = key_state->oldlocal_len;
-                 key_state->state = libssh2_NB_state_idle;
-+                session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-                 session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
-                 session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
-                 return -1;
-@@ -3949,6 +3967,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-         session->remote.kexinit = NULL;
-     }
- 
-+    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-     session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
-     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
- 
-diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
-index 82c3afe250b0..ee1d8b5c2b9b 100644
---- a/src/libssh2_priv.h
-+++ b/src/libssh2_priv.h
-@@ -699,6 +699,9 @@ struct _LIBSSH2_SESSION
-     /* key signing algorithm preferences -- NULL yields server order */
-     char *sign_algo_prefs;
- 
-+    /* Whether to use the OpenSSH Strict KEX extension */
-+    int kex_strict;
-+
-     /* (remote as source of data -- packet_read ) */
-     libssh2_endpoint_data remote;
- 
-@@ -870,6 +873,7 @@ struct _LIBSSH2_SESSION
-     int fullpacket_macstate;
-     size_t fullpacket_payload_len;
-     int fullpacket_packet_type;
-+    uint32_t fullpacket_required_type;
- 
-     /* State variables used in libssh2_sftp_init() */
-     libssh2_nonblocking_states sftpInit_state;
-@@ -910,10 +914,11 @@ struct _LIBSSH2_SESSION
- };
- 
- /* session.state bits */
--#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000001
--#define LIBSSH2_STATE_NEWKEYS           0x00000002
--#define LIBSSH2_STATE_AUTHENTICATED     0x00000004
--#define LIBSSH2_STATE_KEX_ACTIVE        0x00000008
-+#define LIBSSH2_STATE_INITIAL_KEX       0x00000001
-+#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000002
-+#define LIBSSH2_STATE_NEWKEYS           0x00000004
-+#define LIBSSH2_STATE_AUTHENTICATED     0x00000008
-+#define LIBSSH2_STATE_KEX_ACTIVE        0x00000010
- 
- /* session.flag helpers */
- #ifdef MSG_NOSIGNAL
-@@ -1144,6 +1149,11 @@ ssize_t _libssh2_send(libssh2_socket_t socket, const void *buffer,
- int _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-                           key_exchange_state_t * state);
- 
-+unsigned char *_libssh2_kex_agree_instr(unsigned char *haystack,
-+                                        size_t haystack_len,
-+                                        const unsigned char *needle,
-+                                        size_t needle_len);
-+
- /* Let crypt.c/hostkey.c expose their method structs */
- const LIBSSH2_CRYPT_METHOD **libssh2_crypt_methods(void);
- const LIBSSH2_HOSTKEY_METHOD **libssh2_hostkey_methods(void);
-diff --git a/src/packet.c b/src/packet.c
-index b5b41981a108..35d4d39eff87 100644
---- a/src/packet.c
-+++ b/src/packet.c
-@@ -605,14 +605,13 @@ authagent_exit:
-  * layer when it has received a packet.
-  *
-  * The input pointer 'data' is pointing to allocated data that this function
-- * is asked to deal with so on failure OR success, it must be freed fine.
-- * The only exception is when the return code is LIBSSH2_ERROR_EAGAIN.
-+ * will be freed unless return the code is LIBSSH2_ERROR_EAGAIN.
-  *
-  * This function will always be called with 'datalen' greater than zero.
-  */
- int
- _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
--                    size_t datalen, int macstate)
-+                    size_t datalen, int macstate, uint32_t seq)
- {
-     int rc = 0;
-     unsigned char *message = NULL;
-@@ -657,6 +656,70 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-         break;
-     }
- 
-+    if(session->state & LIBSSH2_STATE_INITIAL_KEX) {
-+        if(msg == SSH_MSG_KEXINIT) {
-+            if(!session->kex_strict) {
-+                if(datalen < 17) {
-+                    LIBSSH2_FREE(session, data);
-+                    session->packAdd_state = libssh2_NB_state_idle;
-+                    return _libssh2_error(session,
-+                                          LIBSSH2_ERROR_BUFFER_TOO_SMALL,
-+                                          "Data too short extracting kex");
-+                }
-+                else {
-+                    const unsigned char *strict =
-+                    (unsigned char *)"kex-strict-s-v00@openssh.com";
-+                    struct string_buf buf;
-+                    unsigned char *algs = NULL;
-+                    size_t algs_len = 0;
-+
-+                    buf.data = (unsigned char *)data;
-+                    buf.dataptr = buf.data;
-+                    buf.len = datalen;
-+                    buf.dataptr += 17; /* advance past type and cookie */
-+
-+                    if(_libssh2_get_string(&buf, &algs, &algs_len)) {
-+                        LIBSSH2_FREE(session, data);
-+                        session->packAdd_state = libssh2_NB_state_idle;
-+                        return _libssh2_error(session,
-+                                              LIBSSH2_ERROR_BUFFER_TOO_SMALL,
-+                                              "Algs too short");
-+                    }
-+
-+                    if(algs_len == 0 ||
-+                       _libssh2_kex_agree_instr(algs, algs_len, strict, 28)) {
-+                        session->kex_strict = 1;
-+                    }
-+                }
-+            }
-+
-+            if(session->kex_strict && seq) {
-+                LIBSSH2_FREE(session, data);
-+                session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
-+                session->packAdd_state = libssh2_NB_state_idle;
-+                libssh2_session_disconnect(session, "strict KEX violation: "
-+                                           "KEXINIT was not the first packet");
-+
-+                return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
-+                                      "strict KEX violation: "
-+                                      "KEXINIT was not the first packet");
-+            }
-+        }
-+
-+        if(session->kex_strict && session->fullpacket_required_type &&
-+            session->fullpacket_required_type != msg) {
-+            LIBSSH2_FREE(session, data);
-+            session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
-+            session->packAdd_state = libssh2_NB_state_idle;
-+            libssh2_session_disconnect(session, "strict KEX violation: "
-+                                       "unexpected packet type");
-+
-+            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
-+                                  "strict KEX violation: "
-+                                  "unexpected packet type");
-+        }
-+    }
-+
-     if(session->packAdd_state == libssh2_NB_state_allocated) {
-         /* A couple exceptions to the packet adding rule: */
-         switch(msg) {
-@@ -1341,6 +1404,15 @@ _libssh2_packet_ask(LIBSSH2_SESSION * session, unsigned char packet_type,
- 
-             return 0;
-         }
-+        else if(session->kex_strict &&
-+                (session->state & LIBSSH2_STATE_INITIAL_KEX)) {
-+            libssh2_session_disconnect(session, "strict KEX violation: "
-+                                       "unexpected packet type");
-+
-+            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
-+                                  "strict KEX violation: "
-+                                  "unexpected packet type");
-+        }
-         packet = _libssh2_list_next(&packet->node);
-     }
-     return -1;
-@@ -1402,7 +1474,10 @@ _libssh2_packet_require(LIBSSH2_SESSION * session, unsigned char packet_type,
-     }
- 
-     while(session->socket_state == LIBSSH2_SOCKET_CONNECTED) {
--        int ret = _libssh2_transport_read(session);
-+        int ret;
-+        session->fullpacket_required_type = packet_type;
-+        ret = _libssh2_transport_read(session);
-+        session->fullpacket_required_type = 0;
-         if(ret == LIBSSH2_ERROR_EAGAIN)
-             return ret;
-         else if(ret < 0) {
-diff --git a/src/packet.h b/src/packet.h
-index 79018bcf1d55..6ea100a5cfb3 100644
---- a/src/packet.h
-+++ b/src/packet.h
-@@ -71,6 +71,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
- int _libssh2_packet_write(LIBSSH2_SESSION * session, unsigned char *data,
-                           unsigned long data_len);
- int _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
--                        size_t datalen, int macstate);
-+                        size_t datalen, int macstate, uint32_t seq);
- 
- #endif /* __LIBSSH2_PACKET_H */
-diff --git a/src/session.c b/src/session.c
-index a4d602bad002..f4bafb57b2a6 100644
---- a/src/session.c
-+++ b/src/session.c
-@@ -464,6 +464,8 @@ libssh2_session_init_ex(LIBSSH2_ALLOC_FUNC((*my_alloc)),
-         session->abstract = abstract;
-         session->api_timeout = 0; /* timeout-free API by default */
-         session->api_block_mode = 1; /* blocking API by default */
-+        session->state = LIBSSH2_STATE_INITIAL_KEX;
-+        session->fullpacket_required_type = 0;
-         session->packet_read_timeout = LIBSSH2_DEFAULT_READ_TIMEOUT;
-         session->flag.quote_paths = 1; /* default behavior is to quote paths
-                                           for the scp subsystem */
-@@ -1186,6 +1188,7 @@ libssh2_session_disconnect_ex(LIBSSH2_SESSION *session, int reason,
-                               const char *desc, const char *lang)
- {
-     int rc;
-+    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
-     BLOCK_ADJUST(rc, session,
-                  session_disconnect(session, reason, desc, lang));
-diff --git a/src/transport.c b/src/transport.c
-index 6d902d3372b4..3b30ff848726 100644
---- a/src/transport.c
-+++ b/src/transport.c
-@@ -187,6 +187,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
-     struct transportpacket *p = &session->packet;
-     int rc;
-     int compressed;
-+    uint32_t seq = session->remote.seqno;
- 
-     if(session->fullpacket_state == libssh2_NB_state_idle) {
-         session->fullpacket_macstate = LIBSSH2_MAC_CONFIRMED;
-@@ -318,7 +319,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
-     if(session->fullpacket_state == libssh2_NB_state_created) {
-         rc = _libssh2_packet_add(session, p->payload,
-                                  session->fullpacket_payload_len,
--                                 session->fullpacket_macstate);
-+                                 session->fullpacket_macstate, seq);
-         if(rc == LIBSSH2_ERROR_EAGAIN)
-             return rc;
-         if(rc) {
-@@ -329,6 +330,11 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
- 
-     session->fullpacket_state = libssh2_NB_state_idle;
- 
-+    if(session->kex_strict &&
-+        session->fullpacket_packet_type == SSH_MSG_NEWKEYS) {
-+        session->remote.seqno = 0;
-+    }
-+
-     return session->fullpacket_packet_type;
- }
- 
-@@ -1091,6 +1097,10 @@ int _libssh2_transport_send(LIBSSH2_SESSION *session,
- 
-     session->local.seqno++;
- 
-+    if(session->kex_strict && data[0] == SSH_MSG_NEWKEYS) {
-+        session->local.seqno = 0;
-+    }
-+
-     ret = LIBSSH2_SEND(session, p->outbuf, total_length,
-                        LIBSSH2_SOCKET_SEND_FLAGS(session));
-     if(ret < 0)
--- 
-2.43.0
-
diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index b5bc571f86..bf04c5acab 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a488a22625296342ddae862de1d59633e6d446eff8417398e06674a49be3d7c2  libssh2-1.11.0.tar.xz
-sha256  fda5e2522c58ba1f31c9f2044747616457466f4aebec16ade4af86e3a16a8e02  COPYING
+sha256  9954cb54c4f548198a7cbebad248bdc87dd64bd26185708a294b2b50771e3769  libssh2-1.11.1.tar.xz
+sha256  f7f9633cf9ff2f1333f3d7ce46973a8716a4d2a2815ad56f30d437d5fea7bafe  COPYING
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index b2c07cbf30..1702d94c79 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.11.0
+LIBSSH2_VERSION = 1.11.1
 LIBSSH2_SOURCE= libssh2-$(LIBSSH2_VERSION).tar.xz
 LIBSSH2_SITE = https://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
@@ -13,9 +13,6 @@ LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 
-# 0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
-LIBSSH2_IGNORE_CVES += CVE-2023-48795
-
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
