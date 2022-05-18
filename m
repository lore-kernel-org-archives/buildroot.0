Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3945DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 18:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C306141882;
	Wed, 18 May 2022 18:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymTTZez8msE0; Wed, 18 May 2022 18:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901C84185F;
	Wed, 18 May 2022 18:27:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9015A1BF33F
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 18:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EE3860C16
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 18:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbqao1gOwzUT for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 18:27:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B119B605D6
 for <buildroot@buildroot.org>; Wed, 18 May 2022 18:27:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n10so5439349ejk.5
 for <buildroot@buildroot.org>; Wed, 18 May 2022 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uXKoQpbJgZd6t+tMxfVR9k6BNzTCxCd1W549o2B+Y8g=;
 b=Zat/dif7JknkdUphbzcFub4Dftf03YGHuhAvYGmwgqYAIFD0DF+kBhEy5aU6IBUdb+
 WUQbU59aXFrNr0AmjrfSRtqHnoogHwi7tXzJRtopWziuERsAaWv1QXLtaPFKlezQAZ6Y
 WAEzPfVS7JIsVhVBu2uSXhctL/pbwrguFtdiV4AWTaBTY5XFMixNs7lrlwiOEpNTKLB2
 2cd9haZyH/8VRBjudXgH76FQtVGOizA7FUkJqT/EmOY/W1VNuJoIa4Qj0WtdIz2g68un
 bn7n1pUjaJVIMMtuuv04yHzcCMn47UTbOvEXUwT4BHmr1Ss3gXiLjKpQv0jp7/HKgmA6
 M9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uXKoQpbJgZd6t+tMxfVR9k6BNzTCxCd1W549o2B+Y8g=;
 b=Ji7S1Vuk5zroB0nnoStvxGshJcVGqZr8pdltbkzDkkK/4EY8DPqkxHimck5Pqv4PRm
 bywE64yjX0OF9abN/IKTl9QtAKx9ADg74nsu/47ucpXKPp4tdx7y5zhEZNlPS+cxeE5q
 oX6+Wzbs9HCDuYJocksUiwxu7VZyxWlHOGE3sing7sryEBIdxuG8apWRO2Z/qosgWX9O
 eMuf4/MrtIKendGyHzx0DbaY0yMXvLqlfxGcD0uBaYjkExL65x9zDCMgxKH7jBYoq58E
 fRWcKjUCLj5UH9zNuI2BFoFNi/4qxgp09BTa8dfUZ6rSjkxqs2GGCB06jjzT8TDMh3u+
 Az2w==
X-Gm-Message-State: AOAM532cuyevsz6lemm5bsV8mUBEm8GP8CeVaaI1Z0RV3kCRb3RjHgWa
 r5V02sfBB6srzs8v1kMzjnjHx5dpk3AaEQ==
X-Google-Smtp-Source: ABdhPJwozPJSx+OSRJAhX3bCrfcBuXD9Y31/mvhxHPIU+QWTAYF4AAK6vzZjHEcqplZdNVO+4h3gzw==
X-Received: by 2002:a17:907:7b9d:b0:6f4:df04:affb with SMTP id
 ne29-20020a1709077b9d00b006f4df04affbmr780922ejc.473.1652898464977; 
 Wed, 18 May 2022 11:27:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 rh16-20020a17090720f000b006f3ef214dc2sm1228533ejb.40.2022.05.18.11.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 11:27:44 -0700 (PDT)
Message-ID: <e9dea93a-51b8-f807-5a89-f3908c864f08@mind.be>
Date: Wed, 18 May 2022 20:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220517192439.1034654-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220517192439.1034654-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] system: generate and set C.UTF-8 locale
 by default
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



On 17/05/2022 21:24, James Hilliard wrote:
> Now that glibc/localedef supports the C.UTF-8 locale we should default
> to it as software like systemd generally expects it to be the locale
> used.
> 
> This should in general reduce the amount of locale related
> compatibility issues and is what many distros have been using for
> their default locale for quite a few years so it should be a well
> tested configuration.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   system/Config.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 888c24ce81..7cc529d31e 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -440,7 +440,7 @@ config BR2_ENABLE_LOCALE_PURGE
>   
>   config BR2_ENABLE_LOCALE_WHITELIST
>   	string "Locales to keep"
> -	default "C en_US"
> +	default "C.UTF-8"
>   	depends on BR2_ENABLE_LOCALE_PURGE
>   	help
>   	  Whitespace seperated list of locales to allow on target.
> @@ -455,7 +455,7 @@ config BR2_ENABLE_LOCALE_WHITELIST
>   
>   config BR2_GENERATE_LOCALE
>   	string "Generate locale data"
> -	default ""
> +	default "C.UTF-8"
>   	depends on \
>   		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \

  Is this locale also supported by uClibc?

  Regards,
  Arnout

>   		BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
