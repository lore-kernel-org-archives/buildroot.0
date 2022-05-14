Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6738FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29EE183FBA;
	Sat, 14 May 2022 09:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNs_ZJOP-eoZ; Sat, 14 May 2022 09:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 813CF83FAD;
	Sat, 14 May 2022 09:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D00221BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF66783FAA
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05-Zyt191aV9 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:48:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C377883FA6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:48:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id k27so12581623edk.4
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1ayx91K42/xbM83Q9CTWMAcHmvGJTnFglLLjh4l87Oo=;
 b=gCuWuKJtTCQhlJ/27JEtV4SNvkTaOtUjD4GecpIyNjoc0HLd2Vl6mVO2vdNDFOxWZj
 Thwt+vTAMr50WSH02VncH2L186uf+k02Gyg8NZALYlz1CjdnfptWP0EfW0qe4i6IjpD9
 ekIiy4h2zXtg1YdcpQ82WnXmPdnXY9zD6zq5U7SUbQpqXovNDlf1zRpXPLo3NfWcPaNB
 iVEBhOxCuvwZxZFYShor6+mNPuYmtfygZBMRVfdUJEO00eh8kygjkjuaXXs/KkWIlMmj
 R8jWMRsyX8t+du2v+luc0iJHE/5GzKc1l3sGu2gNqzmBmrm63oaueuxvYlqe60Hq4XKH
 sOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1ayx91K42/xbM83Q9CTWMAcHmvGJTnFglLLjh4l87Oo=;
 b=IITT8++zSxQEDvTs2W1/WL4V7oNzHHuMYoyu45DV4gQIUQAuA3IQ6+6Tfb5DQvObXN
 ZhnRT0FQ9J9Ln6djOvBVKBtMFx758Ca91PUBsRwK8DcSn31wLTBG9hZmMqpWyZz5a1Vl
 tJoGa3ppqv+Ob+Nji+ew3VM6xr42cwKj3qavhWq/TeZ6ub10bTUxb4qr5SbimcUUppHl
 8cnrGdeqZpemRczeGL2tJKWoTAfhKtvS6K8exHO89b4mSlmDQf9LGCvZv20izEzS43H1
 xCCeSUCzOQB9W7dgh16NjR/4EHHfZfEioAnHmG2vqS6nN+E8+oNZ/dzt8r4m6lRMoklZ
 oasg==
X-Gm-Message-State: AOAM531KdnreJ5QwrcpXCJBUB6JpKwXrUmpevBNuoAPn/oqxCYh4pqa0
 ywjsf29RgL0Y1JI4MqWclnueCg==
X-Google-Smtp-Source: ABdhPJwoxXK5zLEszHWtV1E/32so7V92Wd1ak8FrAlRayH+nDRzfMt3dLQU2yeFaOenCpMSy5UePmg==
X-Received: by 2002:a05:6402:51d0:b0:427:dfa3:1a46 with SMTP id
 r16-20020a05640251d000b00427dfa31a46mr2790029edd.107.1652521716941; 
 Sat, 14 May 2022 02:48:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a170906518a00b006f3ef214e21sm1565348ejk.135.2022.05.14.02.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:48:36 -0700 (PDT)
Message-ID: <97748a85-117c-9559-b2c5-d51b24287137@mind.be>
Date: Sat, 14 May 2022 11:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220512204451.2824389-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512204451.2824389-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libvncserver: fix build with
 libressl >= 3.5.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2022 22:44, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> /nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
> /nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
>    149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
>        |       ^~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...enssl.c-fix-build-with-libressl-3.5..patch | 66 +++++++++++++++++++
>   1 file changed, 66 insertions(+)
>   create mode 100644 package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
> 
> diff --git a/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
> new file mode 100644
> index 0000000000..110976c4bb
> --- /dev/null
> +++ b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
> @@ -0,0 +1,66 @@
> +From 97fbbd678b2012e64acddd523677bc55a177bc58 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 12 May 2022 20:41:50 +0200
> +Subject: [PATCH] common/crypto_openssl.c: fix build with libressl >= 3.5.0
> + (#522)
> +
> +Fix the following build failure with libressl >= 3.5.0:
> +
> +/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
> +/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
> +  149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
> +      |       ^~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/LibVNC/libvncserver/commit/97fbbd678b2012e64acddd523677bc55a177bc58]
> +---
> + common/crypto_openssl.c | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/common/crypto_openssl.c b/common/crypto_openssl.c
> +index 60d4bd4df..51d7ec2d9 100644
> +--- a/common/crypto_openssl.c
> ++++ b/common/crypto_openssl.c
> +@@ -138,14 +138,16 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
> + {
> +     int result = 0;
> +     DH *dh;
> +-#if OPENSSL_VERSION_NUMBER >= 0x10100000L
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000L || \
> ++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000)
> +     const BIGNUM *pub_key = NULL;
> +     const BIGNUM *priv_key = NULL;
> + #endif
> +
> +     if(!(dh = DH_new()))
> + 	goto out;
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
> ++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
> +     dh->p = BN_bin2bn(prime, keylen, NULL);
> +     dh->g = BN_bin2bn(gen, gen_len, NULL);
> + #else
> +@@ -154,7 +156,8 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
> + #endif
> +     if(!DH_generate_key(dh))
> + 	goto out;
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
> ++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
> +     if(BN_bn2bin(dh->priv_key, priv_out) == 0)
> + 	goto out;
> +     if(BN_bn2bin(dh->pub_key, pub_out) == 0)
> +@@ -181,7 +184,8 @@ int dh_compute_shared_key(uint8_t *shared_out, const uint8_t *priv, const uint8_
> +
> +     if(!(dh = DH_new()))
> + 	goto out;
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
> ++	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER < 0x30500000)
> +     dh->p = BN_bin2bn(prime, keylen, NULL);
> +     dh->priv_key = BN_bin2bn(priv, keylen, NULL);
> + #else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
