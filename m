Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17451C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFBF461266;
	Wed, 18 May 2022 19:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfBEujjBbMLT; Wed, 18 May 2022 19:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D178261264;
	Wed, 18 May 2022 19:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1D51BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B78784309
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2reQdlBj8oII for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3BFA842F9
 for <buildroot@busybox.net>; Wed, 18 May 2022 19:20:16 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eg11so4219472edb.11
 for <buildroot@busybox.net>; Wed, 18 May 2022 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=MXjPDiyIPapPAhDSU72EoDnGWlqyDzNbW6ZlWqQxRGc=;
 b=E3tpkd9e5oSkZ15/ifSjEsS9QrA0cv9GPxWQV0m/otJKvrREo56PbOSZubMUeurt2L
 dxrJf/PGtGlxUx9bLGVgLp2Hyq619KoIRfo5d/dZIolUo7GNvyh0I6zQdfxRIF6UJzdO
 7X23DcE8bSEbZiruSkwz9fKKXbhimNdlXuwCC/C652z13XU98f5LLjiEH9MbqTUut4tN
 F3BUaGVuhl8eoi+ExelNayfoOL5tgcfEN6YSlPLtwuZC9yXs4g7uZw1O4wBI9hN+LwMg
 txxgc6IKfkPkxKkuZqYxJ/gU22GzyCEPnAecLEvu0CuMJtim0NUiPoE7Ryw3POcISVyD
 04ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MXjPDiyIPapPAhDSU72EoDnGWlqyDzNbW6ZlWqQxRGc=;
 b=U3xRhtwscoQevSm/qkLlDzzw+7wulN17uCErSIUgwMVBsNMhTMbbSrIkm19+xGFFAb
 oF3CUK5bFSzS7qmcZCJ/0H6X4iJQZ2tnKeprTLpHNd2Dv16wmDNPx2VxTGWApZWWYEdA
 xfOyEkTLYHYpJ0Bk50pY3xOmGK1dxHlE2O+8tndfZtT9Kztp3v0jmktxXvceIH3CTWqq
 PDEQ8TdIV2WYfgKHvx0R996TBTdNXjLv66haBmry9opDNBCW+ds7a4e6syjSxWD7KL8H
 mrG49zlTUatprc5wsXLe3qyktjncajq85LAgtlpCS/fR9MIL8+szrLNpUMoz9B/cIrGI
 fhFw==
X-Gm-Message-State: AOAM531+KHsfchNFIyrPwc7r8+nHvzezy3/ay9CWtjsfn4LyejZKlDv6
 Sf3rlpsnzAcEuhB5Uk8iGvszjuSsqauREg==
X-Google-Smtp-Source: ABdhPJy2DReCBiChsJ8f4NqqwALjzdrvOlnCqC3vXUcJ+CqByYHQrWKKDEF4jOKnGPDKBDdobPp4gQ==
X-Received: by 2002:a05:6402:378b:b0:42a:ad8c:628f with SMTP id
 et11-20020a056402378b00b0042aad8c628fmr1405212edb.90.1652901614896; 
 Wed, 18 May 2022 12:20:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 de55-20020a1709069bf700b006fe921fcb2dsm407212ejc.49.2022.05.18.12.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:20:14 -0700 (PDT)
Message-ID: <d6c5282e-5c13-34bc-1e8d-5376664f346a@mind.be>
Date: Wed, 18 May 2022 21:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <bec277739a5ac72c0dc81e9b0566a0c77c90823d.1652850100.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <bec277739a5ac72c0dc81e9b0566a0c77c90823d.1652850100.git.baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH 1/2] toolchain-external: codescape-mti-mips:
 needs shared library support
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



On 18/05/2022 07:01, Baruch Siach via buildroot wrote:
> This is a glibc toolchain that does not support static linking.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8501bbeb1912e3923cba46b576b49f755c7c0072/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   .../toolchain-external-codescape-mti-mips/Config.in              | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> index c58c55119a7b..116d4a834d70 100644
> --- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> @@ -5,6 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
>   	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>   	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
>   		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
> +	depends on !BR2_STATIC_LIBS
>   	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>   	select BR2_INSTALL_LIBSTDCPP
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
