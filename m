Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ED7C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:50:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB39661056
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB39661056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF9C60B98;
	Tue, 17 Aug 2021 19:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9JYRtldityz; Tue, 17 Aug 2021 19:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B4FB6FEF6;
	Tue, 17 Aug 2021 19:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB4FD1BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A954024A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l82KldxR4eIt for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 19:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 252AE40522
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 19:50:05 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id bo19so33081541edb.9
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tgSW9DVPIudW8UpS9sv6Blueci64Tm+S1R8KOeJwL9Y=;
 b=GQI9JX6alWF/8pCNrS0mwdr2qBHZUl+L+zeP/njxBJU6UAPNt6yKGzb/7msprMd9Tg
 KQ2wmMEZLiGzzL5jY8/BdA6PPZ8H0AIHSBupBKc4l4ZIbv1BgYHjvgwDup38lA/YCNKQ
 tW//afHye4PnqQhDJ81SqwbiyFJX2qyXwsqYu7+TnjKJu1ehe7y/OPxwOBkTnnk034l6
 2g3EDpbBh66oqHX4l/RsMx2NgtBpczGvj1mI2jKrXeOW4u1y0I8zJwBIbvbcODJiTusk
 v9u1MF0XiIAMzs4U3JVKgcV3dafwiCyI0MtbQkS7Oq8FNaWXArY8rRKStHgnF9THjn9H
 Utvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tgSW9DVPIudW8UpS9sv6Blueci64Tm+S1R8KOeJwL9Y=;
 b=onJnetZYRkmGx5JlHHEQROna0qg6K+IfrgSDW2CDcDksFsC3ubzAeQSH6ka//aAmfG
 G1noVPUVzR+f35Trp7kf8zWzQnRoVQwdDEr+9cCSF/TQ3LGiBiGgNEZSMgD1pgZxmi6I
 AsHJOzXcjBrdjX95ZnbLCFI7fVy3jlaIEevWDCSeVzVzsW4fIfNhzkocbQmxFejOyJ+Z
 x3gsKAsXmVJp/qtO7Bki1KOedAMDGKA4/cBoYkXL9ID6/DJphdLu/NA2mlFuyUC5mRHR
 itBKvEhQxURM/SdfQBZf4rYcqoTvas17wK7HuG4SMSiM+KBPXB/IVqpIJaz9VD3+X5mv
 xivQ==
X-Gm-Message-State: AOAM533sGN/Cmy82wd4fcc9Xt7chVs5ES7gnRvQv6odxpBAs3K+Ghj8D
 qQSb2KLpc8k9Zzdd3yhfD2ojjlvDOFGvTg==
X-Google-Smtp-Source: ABdhPJyYH70Lwws6YJZa5iVAxK7zu5SMfQNvrf1TQ4UnTD0HatxXmWtWPGZ13B21RabZOaggd6pRZQ==
X-Received: by 2002:aa7:d951:: with SMTP id l17mr5796249eds.92.1629229804085; 
 Tue, 17 Aug 2021 12:50:04 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n10sm1153835ejk.86.2021.08.17.12.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 12:50:03 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210814203725.351569-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <117f7c34-7c60-4ce0-a76e-1a68b9d99e31@mind.be>
Date: Tue, 17 Aug 2021 21:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814203725.351569-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libbpf: needs headers >= 4.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 14/08/2021 22:37, Fabrice Fontaine wrote:
> Since its addition in commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83,
> libbpf unconditionally uses TCA_BPF_ID which is only available since
> kernel 4.13 and
> https://github.com/torvalds/linux/commit/e86283071fb0eed28136adb52997888f4beb202b:
> 
> netlink.c: In function '__get_tc_info':
> netlink.c:515:11: error: 'TCA_BPF_ID' undeclared (first use in this function); did you mean 'TCA_BPF_FD'?
>   515 |  if (!tbb[TCA_BPF_ID])
>       |           ^~~~~~~~~~
>       |           TCA_BPF_FD
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/14996a0b7b9b65d0d6d5717d6da8922752789749
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libbpf/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
> index 9eadf0254a..3aa6679b3a 100644
> --- a/package/libbpf/Config.in
> +++ b/package/libbpf/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBBPF
>  	depends on BR2_USE_WCHAR # elfutils
>  	depends on !BR2_STATIC_LIBS # elfutils
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
>  	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
>  	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_ZLIB
> @@ -24,8 +25,9 @@ config BR2_PACKAGE_LIBBPF
>  
>  	  https://github.com/libbpf/libbpf
>  
> -comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
> +comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
>  	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
>  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
>  		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
