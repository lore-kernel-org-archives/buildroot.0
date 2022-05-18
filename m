Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D652CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80BD040579;
	Wed, 18 May 2022 19:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QHL6h3HFCaq; Wed, 18 May 2022 19:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D05A4021C;
	Wed, 18 May 2022 19:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACBE21BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B321842F9
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7zPBTALGA6E for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:20:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C22884091
 for <buildroot@busybox.net>; Wed, 18 May 2022 19:20:37 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id en5so4288060edb.1
 for <buildroot@busybox.net>; Wed, 18 May 2022 12:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=sayrpb+bwp7aCZYWB9bRZMkhgo1Z6q3+zoLjMSI6Zs0=;
 b=Zc1JHqvd1PRqZ0PIHGDFKuSX5vnG5ljU+v6/jm4g2c0bHfG3zJTPzugAQG3JDZp73R
 KlM5RdNhczoJQ8BYh1Y7tlrauVDWIzoU3/GNExP6Jhh9M5+s1lMrNaw0Znux2zxzhqzj
 UmSKsiy2/eNIum3XdD2x6Gwa8Wzl/iwdgcxJQuC+KubxXLAP+nqbmtAjP8Y8+J8+tVui
 UAn5xVSDhEZyOb8a3ql8SgGxsodIgr4G/uUX9IkcUhZxzr6Cbq4aSgcvkmcZs7xxGIXS
 Og8DQ+G3wqzVcKR3UlmaHGi27TajAr/NO0V62dWgErgZEOoTe7cWkjMm7kIrNNu68Mqx
 N1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sayrpb+bwp7aCZYWB9bRZMkhgo1Z6q3+zoLjMSI6Zs0=;
 b=imYXdpmKiXF8aDf2vnA+BHTjpB34gM44+4GndeQn5Sm0UNcb4SNEzY8ApRzpSqpyjo
 3wBJAQMgeXLf/LV8hyocFuoUsLtq2w1RsIhqvpglNlIamF9xwmv4bmWzqQHjvxRYPkSN
 U7bbF5l2NVM6uO/E5Vu+akYgFvCSB/rXJjSCTojQwWZWOVJL1hRw57CLMZimyOhUoZWE
 R3r5H+ueqB6zDFRbi8Z+0yexc+zTTbUuoCK1k7x2yzNfA7JXfMZHfmyo/YZJoxHPZjaE
 0nco9sJ0Kp/pO3qb/K282ecl3gAbkbbCXDSXE7/G/pUPG0ybg588IVLtqjI8fQvVjus/
 4pAw==
X-Gm-Message-State: AOAM532z63XZjqlFVNBYN8TyacrM5pNkKD7dBmnYX/6dYqyW7JHZhN96
 dM6iMEttnE57IZVwCoDxYeFcxw==
X-Google-Smtp-Source: ABdhPJzEYOKAgBnVs3t/8YF1UfWVR2KW4rwbjN449LdrKFYwJbXmPcF6vRjZbrAovJ9FDdVMLCLdlQ==
X-Received: by 2002:a05:6402:783:b0:42a:b251:6a9d with SMTP id
 d3-20020a056402078300b0042ab2516a9dmr1336292edy.315.1652901635830; 
 Wed, 18 May 2022 12:20:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a170907270600b006f3ef214dedsm1247814ejk.83.2022.05.18.12.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:20:35 -0700 (PDT)
Message-ID: <6639ffb0-8af1-48b4-12aa-452698709756@mind.be>
Date: Wed, 18 May 2022 21:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <dd41c88b74f3fdf0e67996c5fc999af7a4122c91.1652862360.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <dd41c88b74f3fdf0e67996c5fc999af7a4122c91.1652862360.git.baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH] package/libnftnl: remove json support
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



On 18/05/2022 10:26, Baruch Siach via buildroot wrote:
> JSON support and the jansson dependency have been removed in version
> 1.1.2.
> 
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnftnl/Config.in   | 10 ----------
>   package/libnftnl/libnftnl.mk |  7 -------
>   package/nftables/nftables.mk |  4 ----
>   3 files changed, 21 deletions(-)
> 
> diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
> index 347223ce22a0..0d17751e5092 100644
> --- a/package/libnftnl/Config.in
> +++ b/package/libnftnl/Config.in
> @@ -13,13 +13,3 @@ config BR2_PACKAGE_LIBNFTNL
>   	  currently used by nftables.
>   
>   	  http://netfilter.org/projects/libnftnl/index.html
> -
> -if BR2_PACKAGE_LIBNFTNL
> -
> -config BR2_PACKAGE_LIBNFTNL_JSON
> -	bool "enable JSON support"
> -	select BR2_PACKAGE_JANSSON
> -	help
> -	  Enable JSON parsing support
> -
> -endif
> diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
> index 616afa630720..7ba1158154d9 100644
> --- a/package/libnftnl/libnftnl.mk
> +++ b/package/libnftnl/libnftnl.mk
> @@ -12,11 +12,4 @@ LIBNFTNL_LICENSE_FILES = COPYING
>   LIBNFTNL_INSTALL_STAGING = YES
>   LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
>   
> -ifeq ($(BR2_PACKAGE_LIBNFTNL_JSON),y)
> -LIBNFTNL_CONF_OPTS += --with-json-parsing
> -LIBNFTNL_DEPENDENCIES += jansson
> -else
> -LIBNFTNL_CONF_OPTS += --without-json-parsing
> -endif
> -
>   $(eval $(autotools-package))
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index 232d54148868..a64c36094ec1 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -42,10 +42,6 @@ else
>   NFTABLES_CONF_OPTS += --disable-python
>   endif
>   
> -ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_LIBNFTNL_JSON),yy)
> -NFTABLES_LIBS += -ljansson -lm
> -endif
> -
>   NFTABLES_CONF_ENV = LIBS="$(NFTABLES_LIBS)"
>   
>   define NFTABLES_LINUX_CONFIG_FIXUPS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
