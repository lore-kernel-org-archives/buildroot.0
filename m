Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6A606A31D
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 09:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0158D80E8C;
	Sat, 31 Oct 2026 09:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwCkgtj4SGPn; Sat, 31 Oct 2026 09:49:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CD7EC80E8E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793440193;
	b=a12ta/XHSFmTIyZ462Kypxg4h0Qm8IKedf5r8iyIWQH0c7n9KNCCh8CYO33NVCfXahjw
	 sxvNw8w587BwfwUTPooWYb78mGXJFlrSPEkSQfBdHiiET9f1YldfvTHhMIB+oKwZTNxls
	 rERFjaLmRZuZkoOSKAkM7ZMkyjsT2UtRjbaU6oHaqW5tF5ZNoRpgFoVWdyJAFZNbhnXDj
	 djMt5PBt8AjoZvMxfRxZvJoqceAce/ejOGIOD+JQ7VP/6GoSqITBd6vUmgjl4gqEgK26q
	 DBGo8mCfE+aF0M9zn3lpAReOl9IetCbsVaXCPjzEySf9G85dzn/CzqY8FuzqkRReQ7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793440193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dOWdSvN1/GqGpz0Io/n4IK22JZuzWf/EwpZew8vECX4=;
	b=JIL4wsv3xQxdV6zdmotC22+Oy8sCGZsZZ50xSiluE0RLF22us1uR0mPTedNiHxZmVxtp
	 uqmOJJLPSFGg0jPIE+iMRbExlcTM3AMenLOmenG0V52DFhXkxvXe2IufS6qG/r1yONles
	 8LqA3lzYqQEArO6uKFYoRfgify8GKFzr5Weg9j7+JfHuoYiF3rlJe7q+HCeVIXBGEIjri
	 etQrWWNp8C5SQ3FRyQy3EY49qxLZ3l3hJmvvggdaUcBClByDYJoTlZWIrMn+M90eKZmJw
	 1CfqyK/GPIXkzPqgEJ23zXa8mjkdgVD/LiaQrt5AxRSVDJ6eyj/sZGDE/5EqO++eZOw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793440193;
	bh=dOWdSvN1/GqGpz0Io/n4IK22JZuzWf/EwpZew8vECX4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EWMX6EaUBy4h5vjt8QakjzsVr4lI/g7TMs/5M1rTlJQu5/+Bq4I9EJCW7YIbAmIDJ
	 e7rEsEq+spXEkzZtUmzienYkqe+yqKZ5U36jNdkYSdY+2ZFlxmYWWc3dTOVNu5aK0M
	 MKQfWdmYiX3lTKeJknY+Lnyjs3PpZHZMo/IPh85/fenMJKxf29tEeabsUdP5oIaWEm
	 oAixScoV3ESGdd5XH4NZUJa1cqyArxptsUdcjvMSnUqaSkenjm6bS7EB74JIfVL6Zd
	 UuhFzwQJ4KdugXpFzjLxAAll6KLrw4GnqVpA0SmZ9yRcT+CdujBDVnd6oZLwbDyaAD
	 Vj700znbdc+XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD7EC80E8E;
	Sat, 31 Oct 2026 09:49:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA45B362
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 09:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB413400FC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 09:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbTLg2Yn9dAi for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 09:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B2FC440057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793440189;
 b=rvIQr3rH+3vDNoBRnmW0OZu7oeb/ko5ewNOYoN3PMZkq7y/e+iHe2a8VducYCJAi0VHB
 BYk29y6yq4RWcdJJCfNU7AeHi4ACXvPThiYvaPK/Zpy3JO9zMDdVSdg9IwwUqlMixY8N3
 rb+cgGcy9Vi/+CDPHS3zKguSh9Xx0i21tFEnJywcpAeTjpRizE/oQ12H3gm/GoiM48yYV
 uQbz2EECxcXtW1Dtg68/sOXG37am609BXofFhC/GMzssJU8/V11UX0rnU2EdJbhmqB62U
 8Fu/xtiFdrI++73GYlwYnU3yiROnKMeL+kuwdUDky7QuyGi/aAx30xg0JGllsH3TKLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793440189;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yWXwQ+JvolI71qNn8BN13AFrzl/vZKSgbh17ASBPlFM=;
 b=XiAyJlvHRM+GOWxAQeXF4W6o0ZZtuDCsqiP6q1kHZNkLFArP1pJ+aOiQnSlAU0UoVhnW
 ZiwBFmHEkPJADcNHg+xyBDAccZgAoths2pKkCTpk5469oUNnykOD7FIwwwME9exMb3Qbm
 XSudTQA6n78QIV1h3KDIZpNfFLtPjaRdjbFcDHbt2KQt+42oxOCYW9dyuzxz+QcnB/njb
 aPDmIRrduRKkU0ErKoInDC9X+Snj7QPjHX9LQMGTqBNKRSeQjF00HI2GAFw70/5Z0Afvl
 xCcbczr46r8ejpy23C5gqoVXHD778LUKwgFF3KJrtF0tNoOhiOOb72sdjfhLVrCANOQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BJwOvbiM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2FC440057
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 09:49:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a218c463d1so9012445e9.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 02:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793440184; x=1794044984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=yWXwQ+JvolI71qNn8BN13AFrzl/vZKSgbh17ASBPlFM=;
 b=rhIZT+uEkZYahR2rguHdeU5VoRIuzyFpqTafjQCUbGLG7aMDb1IV4GhBkC42ejKCqc
 aqrPMjNgQ+fpApSDV1N0ciO+SLiKopCmQV5geDoJhoy98GNBcjOP27fXVRMrlXGFTZxH
 2EBeD8SaBxu35r7Ls16DjMFHUL07X6hMtPBcrLWSHyKwH6YE7xxkOwQ2VIDgw0Q8xiJh
 OY24K1a+42CureZauYSb9Ozo4ZR3nBQfVzKMjlM8ArX3+GmsyoNrl12H2iuzKhb/Idxd
 DJKAw2GJjHOfzkvFx4kZ7mYvCCNSjPoXEtzEbrkn5PpdwL/Tt0zOmEmXU+KWJGHvy+Kz
 a/Vg==
X-Gm-Message-State: AFq9FYJ2O/0vDnJzBaB8tg72WxHYE9jotdnNRDlDN9zjSYsXsVCZgxPZ
 ubiAKukJ3G02dvBq5c88MmxtN9p1XQwosc3m4S7eAqESu1yXfdBuwjiCJZvMAx//TigXU9XUXk5
 DUYa5
X-Gm-Gg: AYBFou2Cj+ntnrAMs9U9OUDsyQ+FLSAfJPTBEMUdidFMVpv+Uz0g6yBaGhzQFTtF1Lh
 aiWPNPJQ+Cf3BnL5nuPtjVcvOLjbvWJUrSWtHPVZEpLBFhkr9QNo5E8wOYMo3B0q6BRmEYqCYFM
 T0Mdc5hbKguKORsUqsvbjFI/nY/H8S9LG/D6XlXPm2V2sgtecYiNkB2rLywMHacKSuy8Ad7FbY+
 P2c0CRg/RFxOjcxKNXEHX+1wY+LuClAZeyfw5mDUNqxdCtV1IWiObMzn6hG2dnGjb0jToITNGvR
 pqhDRPXFT5SOBiJ9hEAxv+r/muyo290jydfWkxFjG6y9MBPAkZtcdh8B1P5kwzaT4IxqbzB8mCW
 IbOnNdwaNveeqEjeH6ghCP5yjhu81vFjK9iyzkRkmwMjLBcMdwyE6IYBaydsGs5/wdLaEJjn8wv
 BlKiHPVEsnTWWdLT0aX2wzoj5daJySTBfP5kYR4+fMuA2SjbRtX/U1QMfAb7BJbpNM1sw6P/edn
 cMLFecUCT5MGKLp7mSVO4zwX4LitpEFSstyh8oG0Sw97bu6lHE/vBJqYUvcRP/RQirk82/MyoAb
 BvQviYgUZDhS17uwmX0+tpsZ7fTBvs1rkmTslr5Wvy0=
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id
 5b1f17b1804b1-4ac19234a06mr104393075e9.31.1793440184501; 
 Sat, 31 Oct 2026 02:49:44 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf751c2d2sm131082795e9.15.2026.10.31.02.49.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 02:49:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 10:49:43 +0100
Message-ID: <20261031094943.58584-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/libssh: fix build with
 LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building libssh with LibreSSL fails with the following error:

```
/home/buildroot/instance-0/output-1/build/libssh-0.11.5/src/libcrypto.c: In function 'chacha20_poly1305_packet_setup':
/home/buildroot/instance-0/output-1/build/libssh-0.11.5/src/libcrypto.c:942:41: error: 'EVP_PKEY_POLY1305' undeclared (first use in this function)
  942 |         ctx->key = EVP_PKEY_new_mac_key(EVP_PKEY_POLY1305, NULL,
      |                                         ^~~~~~~~~~~~~~~~~
```

LibreSSL doesn't define `EVP_PKEY_POLY1305` but has it's own
implementation.

This can be reproduced with the following defconfig:

```
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_LIBSSH=y
BR2_PACKAGE_LIBSSH_OPENSSL=y
```

Upstream project fixed this with commit [1], included in Buildroot
master branch with libssh bump to v0.12.0 [2].

Support for Poly1305 was originally added in upstream commit [3] (libssh
v0.10.0) and the issue started with upstream commit [4] (libssh v0.11.0)
that removed the declaration check as it was assumed to be implicetely
present with deprecation of older OpenSSL releases.

[1] https://github.com/libssh/libssh-mirror/commit/a1e49728baee40c6814a93fbe4c1a53b186efd30
[2] c522110685 package/libssh: bump version to 0.12.0
[3] https://github.com/libssh/libssh-mirror/commit/60a987fd172f743462e0a9c61638279ec7b77f67
[4] https://github.com/libssh/libssh-mirror/commit/28d27c3ae4fe1fd340972ae38cc6af23866dc83f

Fixes: https://autobuild.buildroot.org/results/abd/abd2de32e2edd82bdaacb25002e393e00bbf8c83/
Assisted-by: LLM
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...d-support-for-Poly1305-from-LibreSSL.patch | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch

diff --git a/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch b/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch
new file mode 100644
index 0000000000..9f7ee2bc99
--- /dev/null
+++ b/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch
@@ -0,0 +1,124 @@
+From a1e49728baee40c6814a93fbe4c1a53b186efd30 Mon Sep 17 00:00:00 2001
+From: Shreyas Mahajan <shreyasmahajan05@gmail.com>
+Date: Wed, 21 Jan 2026 17:45:08 +0530
+Subject: [PATCH] crypto: Add support for Poly1305 from LibreSSL
+
+Signed-off-by: Shreyas Mahajan <shreyasmahajan05@gmail.com>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+Upstream: https://github.com/libssh/libssh-mirror/commit/a1e49728baee40c6814a93fbe4c1a53b186efd30
+[Thomas: backport for libssh 0.11.5]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index b928451..6210142 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -40,7 +40,9 @@
+ #endif
+ 
+ #ifdef HAVE_LIBCRYPTO
+-
++#ifdef LIBRESSL_VERSION_NUMBER
++#include <openssl/poly1305.h>
++#endif
+ #include <openssl/err.h>
+ #include <openssl/md5.h>
+ #include <openssl/opensslv.h>
+@@ -749,7 +751,10 @@ struct chacha20_poly1305_keysched {
+     EVP_CIPHER_CTX *main_evp;
+     /* cipher handle used for encrypting the length field */
+     EVP_CIPHER_CTX *header_evp;
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    /* LibreSSL Poly1305 context */
++    poly1305_context poly_ctx;
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     /* mac handle used for authenticating the packets */
+     EVP_PKEY_CTX *pctx;
+     /* Poly1305 key */
+@@ -777,7 +782,9 @@ chacha20_poly1305_cleanup(struct ssh_cipher_struct *cipher)
+     ctx->main_evp  = NULL;
+     EVP_CIPHER_CTX_free(ctx->header_evp);
+     ctx->header_evp = NULL;
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    /* nothing to free */
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     /* ctx->pctx is freed as part of MD context */
+     EVP_PKEY_free(ctx->key);
+     ctx->key = NULL;
+@@ -841,7 +848,9 @@ chacha20_poly1305_set_key(struct ssh_cipher_struct *cipher,
+     /* The Poly1305 key initialization is delayed to the time we know
+      * the actual key for packet so we do not need to create a bogus keys
+      */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    /* nothing, poly1305_context is stack based */
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     ctx->mctx = EVP_MD_CTX_new();
+     if (ctx->mctx == NULL) {
+         SSH_LOG(SSH_LOG_TRACE, "EVP_MD_CTX_new failed");
+@@ -935,8 +944,11 @@ chacha20_poly1305_packet_setup(struct ssh_cipher_struct *cipher,
+     ssh_log_hexdump("poly_key", poly_key, POLY1305_KEYLEN);
+ #endif /* DEBUG_CRYPTO */
+ 
+-    /* Set the Poly1305 key */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++/* LibreSSL path: use direct Poly1305 implementation */
++#if defined(LIBRESSL_VERSION_NUMBER)
++    CRYPTO_poly1305_init(&ctx->poly_ctx, poly_key);
++/* Set the Poly1305 key */
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     if (ctx->key == NULL) {
+         /* Poly1305 Initialization needs to know the actual key */
+         ctx->key = EVP_PKEY_new_mac_key(EVP_PKEY_POLY1305, NULL,
+@@ -1030,7 +1042,9 @@ chacha20_poly1305_aead_decrypt(struct ssh_cipher_struct *cipher,
+     uint8_t tag[POLY1305_TAGLEN] = {0};
+     int ret = SSH_ERROR;
+     int rv, cmp, len = 0;
++#if !defined(LIBRESSL_VERSION_NUMBER)
+     size_t taglen = POLY1305_TAGLEN;
++#endif
+ 
+     /* Prepare the Poly1305 key */
+     rv = chacha20_poly1305_packet_setup(cipher, seq, 0);
+@@ -1044,7 +1058,13 @@ chacha20_poly1305_aead_decrypt(struct ssh_cipher_struct *cipher,
+ #endif /* DEBUG_CRYPTO */
+ 
+     /* Calculate MAC of received data */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++    CRYPTO_poly1305_update(&ctx->poly_ctx,
++                           complete_packet,
++                           encrypted_size + sizeof(uint32_t));
++    CRYPTO_poly1305_finish(&ctx->poly_ctx, tag);
++
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     rv = EVP_DigestSignUpdate(ctx->mctx, complete_packet,
+                               encrypted_size + sizeof(uint32_t));
+     if (rv != 1) {
+@@ -1114,7 +1134,9 @@ chacha20_poly1305_aead_encrypt(struct ssh_cipher_struct *cipher,
+ {
+     struct ssh_packet_header *in_packet = in, *out_packet = out;
+     struct chacha20_poly1305_keysched *ctx = cipher->chacha20_schedule;
++#if !defined(LIBRESSL_VERSION_NUMBER)
+     size_t taglen = POLY1305_TAGLEN;
++#endif
+     int ret, outlen = 0;
+ 
+     /* Prepare the Poly1305 key */
+@@ -1161,7 +1183,13 @@ chacha20_poly1305_aead_encrypt(struct ssh_cipher_struct *cipher,
+     }
+ 
+     /* step 4, compute the MAC */
+-#if OPENSSL_VERSION_NUMBER < 0x30000000L
++#if defined(LIBRESSL_VERSION_NUMBER)
++
++    CRYPTO_poly1305_update(&ctx->poly_ctx,
++                           (const unsigned char *)out_packet,
++                           len);
++    CRYPTO_poly1305_finish(&ctx->poly_ctx, tag);
++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
+     ret = EVP_DigestSignUpdate(ctx->mctx, out_packet, len);
+     if (ret <= 0) {
+         SSH_LOG(SSH_LOG_TRACE, "EVP_DigestSignUpdate failed");
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
