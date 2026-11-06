Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16D606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WlErVA9g
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB2481E44;
	Fri,  6 Nov 2026 16:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 796FM34_BS18; Fri,  6 Nov 2026 16:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC88881E4C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981457;
	b=gqJXKzvNsxSznmbjrDKnFahGabMz94MszvFsTvGglFxcGA+meuP1oiTFgtqiUAyeIPgX
	 LOuug9H42DXkkJMYrlwPfHXFANf3EawBX41o7mQ8HulD4Blfo3rnY1BINs8O+bV3pqUIB
	 zJMifTpcP5T0jihcD9Ak41zF+3JWUMkNXa/Mml4vfV5YYlyHg3kJQhDmUV95D8ThjCnwh
	 taZlybYSe+6dB/XKCgD5l2gu4EUZUszu4wwt5Q6XxigCPg4Sn/rw3qjZGyjfrf2oObu+4
	 LeqkIOZl0ciXLN8t1bqJxcxS0VcJ17Z2JMylMKQzOAvH7hbNlndIviqZboYdHGod9yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981457;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KVJ6/ROwBJhoF5aUGdd/3qAdjhG8APCRQMi6rWjbxbs=;
	b=A//RQIC1mwtAYiEQ4WXN52JfBUqLAVIdB6GUpzEr2JKTU47WWMJrv6H29aZuMR4c945z
	 OUcN1eNvMoZKVp09SHlykPeSytALq1SxFurqZfkLktpS/3g4U0Lm8KnczoPV4GyNMElBf
	 tnO7f2k2amcpdcLxougv5hFtGedcdYAJlMzW9hK5/OuoNkhhqgzDjf6TMRFB1AqNKkwQr
	 xiFJbjgbSMUzYPn/hLW9uoOouT0Ke+wJxF50duQg3X/t5lp5QinYzedthrm2p5Ojt8tM+
	 A4vsg+TLgApeVHrlH9IDien+FmQAMKX8gbdUAjYKiqFyuMyIOmMYdJ/KCWbLZM+i7YQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981457;
	bh=KVJ6/ROwBJhoF5aUGdd/3qAdjhG8APCRQMi6rWjbxbs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WlErVA9gOy3WSF9a2Mt40IR33Qst7L4JlD9ceTFPMh18MRCzMncEKk2eB8DAFGbUh
	 bpFsj/8efYGqs8D/vqO/Dj5B/MXD7NCW/JOdp5qwfTWm6HJKHvV5g14uMu5zxj7lfu
	 2EjjAQjFir+5N/ZQ6/Byac6TDvHkU2+UeIf1lkYSg5hMpycSMgppQ5eWLLMctIbfyf
	 hk+YaG+qr2f012RMUgKeaz2NQoOgsgc/s8u7kROKqbPqa1d/h5G9yFbkNyBqYc+lBl
	 q+iGigAWxSA3PQpFgFrWPUa4ZqAZiqO4adJFXdwJXQZponvOAxr+VxRX4LwcjRISZ5
	 OI/h7WbwwrWhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC88881E4C;
	Fri,  6 Nov 2026 16:10:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA554B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D9E40911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAgTkXfBLkHe for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE7384090B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE7384090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so8400755e9.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981452; x=1794586252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Hbf2NfC0lRcS88Nny+kF9XMAwgJYoLvLNHlPmlNFI/E=;
 b=aA4ILWaE8qfzBfqYHJsNKdGkycnmi1IqhkwV9HD5t4YUb3Y8Vk2FTMIMuZbLt+c8zf
 evBVGrwQQ0HKGMJLxlTDuryQccIXBt5jiN8LdzQ5VfuXh5FOeCZfrceFYWxvhBXxItl6
 Cc6RhskDntzftb2hdpwUAU7cwbrPaatHfL1eMDD5AGNj+hx7cSmiiKbsYpqr02+WhviK
 XM78wxnDY6nXgWdYupMdOirDDqYFdfKkFHhDPqny5hXkAnV2cH/7+nXZvMxp4jhIo+fw
 Vt4WEV8xrJMsJrat0W1NITK4/VJ+pck9iOZl3GFMqBJ8o7mXDajeeM3msSe5IVpMjNsn
 IMHg==
X-Gm-Message-State: APuU4Z++8PJPg7dlv/XYGwX0BPQR40IHQ5ZTDyI8tmH9Qw1fNVDUhm/V
 n+C0PjT2RA+a2e6y1G8vKRaGBZ+tK7R1tiELbfjeCkkFK+whL8JWEGPyhkYVJAE/CsHtlE191pb
 5vMoqoCU=
X-Gm-Gg: AYBFou0Uw8ZKjdGnzAJaaUG/Epw+78KYacq3EukEksYPY8t0+6GKzeHCL4REeicCu4s
 uVleCdkJGKnvikM1b5aFqFZXPXPzinS0ujttHEG93K4qD3+cYP6vjsvO6CIM7eL4eZZD+q1m1+N
 C4Oyy5gkLmddEfsSvElyaaY+fuC4bZfnJU3axHYpLUIRhTkK9N4/ZcZuk6M95E3QiEtolih89kG
 ZVOf/gA8QSeeiMIhOEQEABvHoUVyTXatkp6Avc+5QAQxOATc9ssOnrR1kJhLCyvJt0HqFq6zAeQ
 H/ARrhWGY/7eON6ZyGcmxOJ0fz1cOh6S8XavL3zJxTxVy1t7PyKSRRrQhuNGfGM4pJoCWeeKiKK
 0ZDNbzQT9Wm/M0Qp840HT5cBaspm9KlwN6+oYLiO8D1SZBZP+bY+eJjH1K5ESHc9RzvgnWnzp+J
 U6ujGB96u5erJXcrxxAC1dZwNrZVKZyTqiCXfX52zQazi4nM8rJAWRRq69l6d0aK1Jmlogf+aL4
 pNiRojGf0g6xn0Za/i0vhsqbUBySh34YGfHegz5gPygjlwkwuqS+hHTlMuMeVC/ep0/JJTS1qeQ
 Tdui4NBAqr5GLrDTInfjOOgelb6zkmI=
X-Received: by 2002:a05:600c:a31b:b0:4b7:6942:39bf with SMTP id
 5b1f17b1804b1-4b769423c17mr29764225e9.28.1793981451897; 
 Fri, 06 Nov 2026 08:10:51 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cb7eee0sm2809445e9.0.2026.11.06.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:50 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:47 +0100
Message-ID: <20261106161049.607826-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031094943.58584-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/libssh: fix build
 with LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Building libssh with LibreSSL fails with the following error:
> 
> ```
> /home/buildroot/instance-0/output-1/build/libssh-0.11.5/src/libcrypto.c: In function 'chacha20_poly1305_packet_setup':
> /home/buildroot/instance-0/output-1/build/libssh-0.11.5/src/libcrypto.c:942:41: error: 'EVP_PKEY_POLY1305' undeclared (first use in this function)
>   942 |         ctx->key = EVP_PKEY_new_mac_key(EVP_PKEY_POLY1305, NULL,
>       |                                         ^~~~~~~~~~~~~~~~~
> ```
> 
> LibreSSL doesn't define `EVP_PKEY_POLY1305` but has it's own
> implementation.
> 
> This can be reproduced with the following defconfig:
> 
> ```
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_LIBRESSL=y
> BR2_PACKAGE_LIBSSH=y
> BR2_PACKAGE_LIBSSH_OPENSSL=y
> ```
> 
> Upstream project fixed this with commit [1], included in Buildroot
> master branch with libssh bump to v0.12.0 [2].
> 
> Support for Poly1305 was originally added in upstream commit [3] (libssh
> v0.10.0) and the issue started with upstream commit [4] (libssh v0.11.0)
> that removed the declaration check as it was assumed to be implicetely
> present with deprecation of older OpenSSL releases.
> 
> [1] https://github.com/libssh/libssh-mirror/commit/a1e49728baee40c6814a93fbe4c1a53b186efd30
> [2] c522110685 package/libssh: bump version to 0.12.0
> [3] https://github.com/libssh/libssh-mirror/commit/60a987fd172f743462e0a9c61638279ec7b77f67
> [4] https://github.com/libssh/libssh-mirror/commit/28d27c3ae4fe1fd340972ae38cc6af23866dc83f
> 
> Fixes: https://autobuild.buildroot.org/results/abd/abd2de32e2edd82bdaacb25002e393e00bbf8c83/
> Assisted-by: LLM
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...d-support-for-Poly1305-from-LibreSSL.patch | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch
> 
> diff --git a/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch b/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch
> new file mode 100644
> index 0000000000..9f7ee2bc99
> --- /dev/null
> +++ b/package/libssh/0001-crypto-Add-support-for-Poly1305-from-LibreSSL.patch
> @@ -0,0 +1,124 @@
> +From a1e49728baee40c6814a93fbe4c1a53b186efd30 Mon Sep 17 00:00:00 2001
> +From: Shreyas Mahajan <shreyasmahajan05@gmail.com>
> +Date: Wed, 21 Jan 2026 17:45:08 +0530
> +Subject: [PATCH] crypto: Add support for Poly1305 from LibreSSL
> +
> +Signed-off-by: Shreyas Mahajan <shreyasmahajan05@gmail.com>
> +Reviewed-by: Jakub Jelen <jjelen@redhat.com>
> +Upstream: https://github.com/libssh/libssh-mirror/commit/a1e49728baee40c6814a93fbe4c1a53b186efd30
> +[Thomas: backport for libssh 0.11.5]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> +diff --git a/src/libcrypto.c b/src/libcrypto.c
> +index b928451..6210142 100644
> +--- a/src/libcrypto.c
> ++++ b/src/libcrypto.c
> +@@ -40,7 +40,9 @@
> + #endif
> + 
> + #ifdef HAVE_LIBCRYPTO
> +-
> ++#ifdef LIBRESSL_VERSION_NUMBER
> ++#include <openssl/poly1305.h>
> ++#endif
> + #include <openssl/err.h>
> + #include <openssl/md5.h>
> + #include <openssl/opensslv.h>
> +@@ -749,7 +751,10 @@ struct chacha20_poly1305_keysched {
> +     EVP_CIPHER_CTX *main_evp;
> +     /* cipher handle used for encrypting the length field */
> +     EVP_CIPHER_CTX *header_evp;
> +-#if OPENSSL_VERSION_NUMBER < 0x30000000L
> ++#if defined(LIBRESSL_VERSION_NUMBER)
> ++    /* LibreSSL Poly1305 context */
> ++    poly1305_context poly_ctx;
> ++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
> +     /* mac handle used for authenticating the packets */
> +     EVP_PKEY_CTX *pctx;
> +     /* Poly1305 key */
> +@@ -777,7 +782,9 @@ chacha20_poly1305_cleanup(struct ssh_cipher_struct *cipher)
> +     ctx->main_evp  = NULL;
> +     EVP_CIPHER_CTX_free(ctx->header_evp);
> +     ctx->header_evp = NULL;
> +-#if OPENSSL_VERSION_NUMBER < 0x30000000L
> ++#if defined(LIBRESSL_VERSION_NUMBER)
> ++    /* nothing to free */
> ++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
> +     /* ctx->pctx is freed as part of MD context */
> +     EVP_PKEY_free(ctx->key);
> +     ctx->key = NULL;
> +@@ -841,7 +848,9 @@ chacha20_poly1305_set_key(struct ssh_cipher_struct *cipher,
> +     /* The Poly1305 key initialization is delayed to the time we know
> +      * the actual key for packet so we do not need to create a bogus keys
> +      */
> +-#if OPENSSL_VERSION_NUMBER < 0x30000000L
> ++#if defined(LIBRESSL_VERSION_NUMBER)
> ++    /* nothing, poly1305_context is stack based */
> ++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
> +     ctx->mctx = EVP_MD_CTX_new();
> +     if (ctx->mctx == NULL) {
> +         SSH_LOG(SSH_LOG_TRACE, "EVP_MD_CTX_new failed");
> +@@ -935,8 +944,11 @@ chacha20_poly1305_packet_setup(struct ssh_cipher_struct *cipher,
> +     ssh_log_hexdump("poly_key", poly_key, POLY1305_KEYLEN);
> + #endif /* DEBUG_CRYPTO */
> + 
> +-    /* Set the Poly1305 key */
> +-#if OPENSSL_VERSION_NUMBER < 0x30000000L
> ++/* LibreSSL path: use direct Poly1305 implementation */
> ++#if defined(LIBRESSL_VERSION_NUMBER)
> ++    CRYPTO_poly1305_init(&ctx->poly_ctx, poly_key);
> ++/* Set the Poly1305 key */
> ++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
> +     if (ctx->key == NULL) {
> +         /* Poly1305 Initialization needs to know the actual key */
> +         ctx->key = EVP_PKEY_new_mac_key(EVP_PKEY_POLY1305, NULL,
> +@@ -1030,7 +1042,9 @@ chacha20_poly1305_aead_decrypt(struct ssh_cipher_struct *cipher,
> +     uint8_t tag[POLY1305_TAGLEN] = {0};
> +     int ret = SSH_ERROR;
> +     int rv, cmp, len = 0;
> ++#if !defined(LIBRESSL_VERSION_NUMBER)
> +     size_t taglen = POLY1305_TAGLEN;
> ++#endif
> + 
> +     /* Prepare the Poly1305 key */
> +     rv = chacha20_poly1305_packet_setup(cipher, seq, 0);
> +@@ -1044,7 +1058,13 @@ chacha20_poly1305_aead_decrypt(struct ssh_cipher_struct *cipher,
> + #endif /* DEBUG_CRYPTO */
> + 
> +     /* Calculate MAC of received data */
> +-#if OPENSSL_VERSION_NUMBER < 0x30000000L
> ++#if defined(LIBRESSL_VERSION_NUMBER)
> ++    CRYPTO_poly1305_update(&ctx->poly_ctx,
> ++                           complete_packet,
> ++                           encrypted_size + sizeof(uint32_t));
> ++    CRYPTO_poly1305_finish(&ctx->poly_ctx, tag);
> ++
> ++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
> +     rv = EVP_DigestSignUpdate(ctx->mctx, complete_packet,
> +                               encrypted_size + sizeof(uint32_t));
> +     if (rv != 1) {
> +@@ -1114,7 +1134,9 @@ chacha20_poly1305_aead_encrypt(struct ssh_cipher_struct *cipher,
> + {
> +     struct ssh_packet_header *in_packet = in, *out_packet = out;
> +     struct chacha20_poly1305_keysched *ctx = cipher->chacha20_schedule;
> ++#if !defined(LIBRESSL_VERSION_NUMBER)
> +     size_t taglen = POLY1305_TAGLEN;
> ++#endif
> +     int ret, outlen = 0;
> + 
> +     /* Prepare the Poly1305 key */
> +@@ -1161,7 +1183,13 @@ chacha20_poly1305_aead_encrypt(struct ssh_cipher_struct *cipher,
> +     }
> + 
> +     /* step 4, compute the MAC */
> +-#if OPENSSL_VERSION_NUMBER < 0x30000000L
> ++#if defined(LIBRESSL_VERSION_NUMBER)
> ++
> ++    CRYPTO_poly1305_update(&ctx->poly_ctx,
> ++                           (const unsigned char *)out_packet,
> ++                           len);
> ++    CRYPTO_poly1305_finish(&ctx->poly_ctx, tag);
> ++#elif OPENSSL_VERSION_NUMBER < 0x30000000L
> +     ret = EVP_DigestSignUpdate(ctx->mctx, out_packet, len);
> +     if (ret <= 0) {
> +         SSH_LOG(SSH_LOG_TRACE, "EVP_DigestSignUpdate failed");
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
