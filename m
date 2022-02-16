Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F5CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712AC4023D;
	Wed, 16 Feb 2022 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyAQCiUzMNVZ; Wed, 16 Feb 2022 19:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866BF4013E;
	Wed, 16 Feb 2022 19:53:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CA611BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 992634013E
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vo1kLpRc4qO1 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:53:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEE634013D
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:53:03 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x5so5747597edd.11
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EfEpFd/S62LtnMepcrWLyfUHeFr1gn/UqdiujaQx9HM=;
 b=GayKLV7Wdv4z1Y9c2HBSCLCrmv9OgOz21NXTjOZI+ZbPkv+ZXhbfMgZoUgKx6RjgYr
 i7srXwhgWCYgZ16KmpnfESs2tm75s5WYsPXAZ9VPew2lLpvY8TbYV8FagGC1cmAiNa9d
 K7LU7c8XNftlgOZMmNx26jsLb2irJCj5xLsGvil8Q+2CV9TXYRFXuW88mBDyduCEQlG+
 DX/Qm+XCIc7hWK3P9oSUqPeqTk4GtGRABfsi6pDhTKZRXtMN5YpLd+BIz993RNT2PkHm
 DMuq8QSiTWmZYf6bmanTHP+Muc0zzsqvqKRTAAWsylcGgjAzb+p9Tn6sgig37nb61Uuu
 3xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EfEpFd/S62LtnMepcrWLyfUHeFr1gn/UqdiujaQx9HM=;
 b=tlb5RSM2wjU7A9QlKvOl1MOVvKA6W+PzZKjlElZaCM9/7YQ3/h/GG12M7GlYL5femg
 Clglyy8uc+3PVdLZV6nNgHebbGP190Pc33BEWJA7Sa5tJ3NvI8h22Y08528BYG7BDNhj
 Ygi+19Se7kLBkRJ2e+GXgU5x094DQegnQoiilIMXNI7ulE44S2bpFrtvsIPT8M8f3Jmo
 l/lLbOkkh/+heWpTGceHpQ/IEX9C7W2sstnq9gLpMrz1RI4hJNzbO2AgvsMz8hK/mMEo
 6f3UFos7e9Hi6KRNo/lmtkdU4zqNJ1YJT9MDmMOQJyxxqTGKVcCzCqDlGMckHIb/n6jp
 bvgw==
X-Gm-Message-State: AOAM533uFfdoc34GOdwu/T0Nf5tTwCu+BbdbI97cyEEF62Hpva7n7KP9
 ZRNeT7Vtj5TfNSXo0WtUq5hHFg==
X-Google-Smtp-Source: ABdhPJzHtKchi/EApb2eHQm/m5PKT57hruHkFju4bHD3rLj6oIuqw7ZumXSeY+6OKzTX6bZgL3LD/A==
X-Received: by 2002:a50:f091:0:b0:410:d100:fd0e with SMTP id
 v17-20020a50f091000000b00410d100fd0emr4732052edl.150.1645041181943; 
 Wed, 16 Feb 2022 11:53:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ej19sm96437edb.108.2022.02.16.11.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:53:01 -0800 (PST)
Message-ID: <425ff588-4a09-7a64-3926-039c2dcd57b4@mind.be>
Date: Wed, 16 Feb 2022 20:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213213430.1506727-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213213430.1506727-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/opentracing-cpp: bump to
 version 1.6.0
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
Cc: Jan Heylen <jan.heylen@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 22:34, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/opentracing/opentracing-cpp/releases/tag/v1.6.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/opentracing-cpp/opentracing-cpp.hash | 4 ++--
>   package/opentracing-cpp/opentracing-cpp.mk   | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
> index 591c0e4a0a..8cfaf5fd47 100644
> --- a/package/opentracing-cpp/opentracing-cpp.hash
> +++ b/package/opentracing-cpp/opentracing-cpp.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 015c4187f7a6426a2b5196f0ccd982aa87f010cf61f507ae3ce5c90523f92301 opentracing-cpp-1.5.1.tar.gz
> -sha256 076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717 LICENSE
> +sha256  5b170042da4d1c4c231df6594da120875429d5231e9baa5179822ee8d1054ac3  opentracing-cpp-1.6.0.tar.gz
> +sha256  076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717  LICENSE
> diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
> index 0605cd5d96..12ce40fbed 100644
> --- a/package/opentracing-cpp/opentracing-cpp.mk
> +++ b/package/opentracing-cpp/opentracing-cpp.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -OPENTRACING_CPP_VERSION = 1.5.1
> -OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
> +OPENTRACING_CPP_VERSION = 1.6.0
> +OPENTRACING_CPP_SITE = \
> +	$(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
>   OPENTRACING_CPP_LICENSE = Apache-2.0
>   OPENTRACING_CPP_LICENSE_FILES = LICENSE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
