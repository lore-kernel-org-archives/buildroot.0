Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF883C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD64409E0;
	Mon,  6 Jun 2022 13:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QemYfGPBVQ3; Mon,  6 Jun 2022 13:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C6ED401AE;
	Mon,  6 Jun 2022 13:03:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 560631BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5163283FA3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9aaFUJ41G5Nu for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E37D83F84
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c2so18725279edf.5
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nbbhlwMi0S4OfAoC9CpNrJXUhS1eTBGKH6DTyK09hYo=;
 b=gXtL34lE1QuAicZwTZG3UlCU3pC3KkdXuf8NM+7wCaXwkkuEBvfkzzC1eX5pbP0S+u
 TN48f2WxtD0gfC46xU8vYw9RCLelOX+W73xwFRQjid4wVDxavQOPiXiHbOjrC3wtmjsI
 1AtYmLCHY6bHNm+7Xq/6tuUeskSFh5yDWnP47SZHlKQxW6UUB02OUg3BQ6qW+LamHdNB
 lm6PCjs97qiMeoPt+DFejBSec6E/RoS6I3kViYKvlLI2toIDyinPE3vtlZa/nPXxH3Ml
 ukuw9KNzRDq1beJjlti8YJ3y3Xl0Cu73lUy3yvajb5XB+OXFu8PLEvCnft3W+9F7GdGC
 jh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nbbhlwMi0S4OfAoC9CpNrJXUhS1eTBGKH6DTyK09hYo=;
 b=2OC3XhnrQmgJsG4lrXQAvblGaapzjuOSc/aKtbhpLbfMud2ZIUrSZ+KR0kprVaSDUu
 NMTYmfK8Q5vQdgoCf0QldN1bWkjr/bbLY+66NAg4hrLpRVXE3E049zijbdu0yWYNdgzR
 0GEvemq4/I7mjoF4eiQIVh+Q1b1As8CtOomOCUmHIG/nEIxTzTebJfJwaQmhT+jQ3EsC
 w32tqkQSzzV33sbQGX+QlEzal2Wx6sV2QoLHq98L3wo0wgjO2xULELnimSPNAamTxWvp
 1XpwBnih1RRPlI5mT3EP6Cuwnl3w9pozUV6AGf0WYCgp9CfKWRAf2Zy1vCNFj6wvKFhc
 euww==
X-Gm-Message-State: AOAM530qeq+5+VGv8OZzst1JOwzLulbGQ1l915aTeTT1NHwWrplwFXkY
 pjTot0BlPGxcwvySe2DM18CWyw==
X-Google-Smtp-Source: ABdhPJwH/LwUU+UPV4f08VkdblM5lVKpmzelLGsIGGFBjId7fgoJcfGhdBnxX1AmbTEq2d5EJuTwow==
X-Received: by 2002:a05:6402:4396:b0:42f:b88e:5429 with SMTP id
 o22-20020a056402439600b0042fb88e5429mr15001233edc.298.1654520578209; 
 Mon, 06 Jun 2022 06:02:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a508a81000000b0042aca5edba7sm8646426edj.57.2022.06.06.06.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:02:57 -0700 (PDT)
Message-ID: <4fe8d972-8565-c88e-6c05-b14f44d648f5@mind.be>
Date: Mon, 6 Jun 2022 15:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606101316.366344-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606101316.366344-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mono: needs NPTL
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2022 12:13, Fabrice Fontaine wrote:
> mono unconditionally uses pthread_attr_get_np and so needs NTPL since
> version 4.0.1.43 and
> https://github.com/mono/mono/commit/748fefa1d7199f008c6e56499ba482fb17fe1583:
> 
> mono-threads-linux.c: In function 'mono_threads_platform_get_stack_bounds':
> mono-threads-linux.c:26:15: error: implicit declaration of function 'pthread_getattr_np'; did you mean 'pthread_attr_init'? [-Werror=implicit-function-declaration]
>     26 |         res = pthread_getattr_np (pthread_self (), &attr);
>        |               ^~~~~~~~~~~~~~~~~~
>        |               pthread_attr_init
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6534ee4ae699c17ee98f6f89a8a1212936e04481
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mono/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 44b8cf8581..76178bcf9b 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_MONO
>   	bool "mono"
>   	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_LIBATOMIC_OPS
>   	help
> @@ -23,7 +23,7 @@ config BR2_PACKAGE_MONO
>   
>   	  http://download.mono-project.com/sources/mono/
>   
> -comment "mono needs a toolchain w/ C++, threads, dynamic library"
> +comment "mono needs a toolchain w/ C++, NPTL, dynamic library"
>   	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>   	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
