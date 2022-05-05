Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410B3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACF160B8D;
	Thu,  5 May 2022 20:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtcSB16WND3Z; Thu,  5 May 2022 20:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D395860AA0;
	Thu,  5 May 2022 20:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCF231BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABD4A60AA0
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7FWnqVM9RGq for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:38:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1E7360A70
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:38:32 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so10849146ejj.10
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=bEXwVwkWku/1M2+MltpUkM0dTAoF+DFl/SY37yWqVoc=;
 b=IwXxrT2aRVt4nUQDXtpkRji9UfDfgVxSvaRC4MorS+v3aR5nDn1cMXXLav7ceuZ7m8
 hcO3W47gOHJm2ZRGd2UXmuEXtUEs88Z5kDM3GwBPkpz3LqgZgubCXnKt/bbi71qdUPep
 dfWteJIALAVolpK+VLEA1mkP/DK+eJS8ugb7UrkdoC6+tM3D8DsUp7lxVHiR6FdZOa6h
 Xy8X1RnKWfdXF5jOERmkUEvjPdyrGctbiLnhNtF7il+m5FHH/P/L+lo8tyJdphumFEkC
 GqpKGbCesnvw1QGajRvDHN7LeFmijgX0f8LBuqNcM23iwbiRq8PjJPkpEu4jFCtLsbd4
 98zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bEXwVwkWku/1M2+MltpUkM0dTAoF+DFl/SY37yWqVoc=;
 b=LvZmdXoO/be4YanU/ws3Vkik/4rxzjly7p7g41md0Ujk9E4CT46M0wVWZasYDXedqN
 HyxO0rkKqJ6nTwTNzhgUmsJUgwwoK8hQpAeAeOYum+FJjy5/YOaQu5l3aplDqIc2RPYN
 ZcS47XW8v0sEUcZgYktgrmCUumH+aJrdNpPZAhqF4YJ4x9FprHxD+uf2BfiCESEWhIqu
 LA/Pnwcnw4kp+LoOhp2OZppBjSWRxINTRSrEqWJHdRfSz1xLVP8Hj5SxbkLReRDYoZ4p
 9FOWU1Pr7I5bZtzYdd9PEF9sLlahw4xAmTIRi0hdKwJH/B21M0BtieZcWgGL6h3OAgpq
 0glQ==
X-Gm-Message-State: AOAM530hR32BseeUNeUUQQQ3ADRHPYI30ieATfdOiWZUWgYzpihk5DhB
 +JMNJ+LyZWUPgCnt2zS+uBl5trUEEpcgQA==
X-Google-Smtp-Source: ABdhPJzXst4gUMZrTtX59en62gvnd1RJGBRohL7kraWZ7zyYFSd4BfZtbuUf/XIxo8wKTcA8WXRHAg==
X-Received: by 2002:a17:907:96a8:b0:6f4:45f1:6e76 with SMTP id
 hd40-20020a17090796a800b006f445f16e76mr9295ejc.186.1651783110748; 
 Thu, 05 May 2022 13:38:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y11-20020aa7ca0b000000b00427ae00972dsm1270422eds.12.2022.05.05.13.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:38:30 -0700 (PDT)
Message-ID: <bd077c15-572f-ab9a-26f5-724ee75f8c93@mind.be>
Date: Thu, 5 May 2022 22:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220505101319.155879-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505101319.155879-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] package/libgcrypt: Fix powerpc64 build w/o
 optimisation
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



On 05/05/2022 12:13, Joel Stanley wrote:
> The following build failure was reported by the autobuilder:
> 
> powerpc64   |        libgcrypt-1.10.1        | NOK |
> http://autobuild.buildroot.net/results/eb60bb95411076b92f5c63f9b21c6e576998031c | ORPH
> 
> This config is building with BR2_OPTIMIZE_0=y.
> 
> The code relies on the compiler turning the series of preprocessor
> macros in to a constant for the second argument to vec_sld:
> 
>   chacha20-ppc.c:60:10: error: argument 3 must be a 4-bit unsigned literal
>      60 |   return vec_sld (v, v, (16 - (4 * idx)) & 15);
> 
> The argument is a constant, but it would require a significant rework to
> make this build without optimisation. Instead disable the vectorised
> powerpc code when building with optimisation disabled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgcrypt/libgcrypt.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> index f28552c6e7..8f4e5ec8c0 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -18,6 +18,7 @@ LIBGCRYPT_CPE_ID_VENDOR = gnupg
>   LIBGCRYPT_AUTORECONF = YES
>   LIBGCRYPT_CONF_OPTS = \
>   	--disable-tests \
> +	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
>   	--with-gpg-error-prefix=$(STAGING_DIR)/usr
>   
>   # Libgcrypt doesn't support assembly for coldfire
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
