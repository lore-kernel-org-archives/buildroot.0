Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FBFC433FE
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08AE48278F;
	Mon,  4 Apr 2022 18:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id op_ZKWhrYlmk; Mon,  4 Apr 2022 18:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09DB981B17;
	Mon,  4 Apr 2022 18:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 117291BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 010F481B17
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvHDOa-5cort for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:47:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E46B881AD7
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:47:47 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bh17so21877699ejb.8
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RnY7DYqJDo77r4CenhaFWDQfVANRWRSU+vuoiCAYMX4=;
 b=AUxBWNFl/qu54MEebbEkXTNYugPHpRIjwydXBFpRVuQvsFehsiAQfvn4IthyfbiVPd
 ZFzgwrCF5ZG+7awNCbtTvA5mRfoVZ6PUO9wqdnLnr06+2FEG0xOSIIu2EIVsH34KseiX
 T7oBKo0LnV1qHUUIebAAGuflg9drt6T+UFK/0bR0BVQCWKOjuoMQtbzvRm+KuMTijonb
 +6m/74/bnpfXG7+L6EMQy8iHuBDoAmdJLOvKXCFmsGQoQ1AY720pbMekzR9zDSpj8ukA
 WXg7a5vhfce0a4UG7J7z8jKxgOZWabjhWpLDvByDB9ypMxgpZ2WyoX0Xu4m6t+6vBgx/
 tS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RnY7DYqJDo77r4CenhaFWDQfVANRWRSU+vuoiCAYMX4=;
 b=Ao9OyvhGzF6m2fI6ZD71T8lWwANQVIQjawkLYYiIqD0MjeO4lKqcJBX0+YFtD5+Kw9
 JaOxmmIrCo1tZYqjl6EWMLAakAXhtn11aQGlevgkUPmDWV6Gcby4w36ACYf4EMIlQoeM
 UWrk6jrdCV/xYMwQN/VAB0YaR+4GECdamSX0AdH88WGBIMdu5KmgPoCuA7kA3J6vJMn9
 LTh4PGIgJ/ybdp63hwgFGzWc1Hx1kKQDP6MM3eHzHjC1r2kMvlIJJCBaSJOqjaXcXD6F
 UNvkrz1BWOq8s/Vwtbly+xIz8lzRah5hoPHhJ+FONM45zQEd27HdMCq0pcPvhiAAsUUj
 5dYQ==
X-Gm-Message-State: AOAM530Lnw9jLJdt907YYGzLBRr2GoImEKzV9x/z3wTqXymRvGrGfHbV
 EUd0dqHQibiKGTr3/M1gIw0x27iX2TxU0g==
X-Google-Smtp-Source: ABdhPJxh7HXeK7Dif/aBxc7T22NnwoSwVw3zUFOao/ywB77iaCxA2ljVwv6Yw4oW7J3P6O5ta9AEdw==
X-Received: by 2002:a17:907:97c7:b0:6e0:defd:342d with SMTP id
 js7-20020a17090797c700b006e0defd342dmr1462823ejc.231.1649098066118; 
 Mon, 04 Apr 2022 11:47:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ke11-20020a17090798eb00b006e7fbf53398sm967562ejc.129.2022.04.04.11.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:47:45 -0700 (PDT)
Message-ID: <5453983a-0c21-d2ad-ab11-c09c27322905@mind.be>
Date: Mon, 4 Apr 2022 20:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220402143924.46610-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402143924.46610-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediadriver: bump version
 to 22.3.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 16:39, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Are we really going to bump this package every week? :-/

  Regards,
  Arnout

> ---
>   package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>   package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index 57499830b1..5c3d25eed8 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  89940ae2f7e5c7ec182f0d4d0ce8e149ae614876edd5bdad2b852e699a29b3f9  intel-media-22.3.0.tar.gz
> +sha256  0fdccad95a561178bd19fba69ab94be23bd4a3072e68aa18c3304c990d87d7d8  intel-media-22.3.1.tar.gz
>   sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index c22aeecc77..4280f7fd29 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>   
>   # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>   
> -INTEL_MEDIADRIVER_VERSION = 22.3.0
> +INTEL_MEDIADRIVER_VERSION = 22.3.1
>   INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
>   INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>   INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
