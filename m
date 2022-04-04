Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CACAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A8E64028F;
	Mon,  4 Apr 2022 20:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81IZHvtNJ_v3; Mon,  4 Apr 2022 20:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1112940267;
	Mon,  4 Apr 2022 20:19:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 395591BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 295AA81D02
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MICFgxvK72-0 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:19:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1913881B01
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:19:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r13so22359081ejd.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iChWpFWGjmidyYsmkMqUcSnz7SxjwK7u+CsUCidSJyg=;
 b=E0REAe2YuW7WA+xEnhXtcp6wRycNA+DJNUiZnKrNxZXZvxPb/dqq5F6+EZOaR5X29y
 MeQf0opTlCYXHPhq/gQnKFhKwgRAXEb4DoxCk7F5YbswTotgOAtrP39Of25k7/RTSMPL
 NdRhs5Au6cENHGl/NCv9KLWTDZBENsA7sB3L9rUMesYUZZE6joXP9XTIUrkNQ2e5upsz
 /nb9rjyr9K1mXCgUiTV3pdDFB/awbT9ksiNPHF3wgqvsqjFUACcTgOIuge3vmlFETGWa
 j6Yb6txaA0B2nb/VtzwjzZCt8cKLWNS/Twj/bdTu2JJjJ6vr7Y8vxKlF+8lhOrSzOcwn
 WMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iChWpFWGjmidyYsmkMqUcSnz7SxjwK7u+CsUCidSJyg=;
 b=7+kSN71ZLG9PxhkgMdo5gtF8y1d7ottwzQLo738FvY+bcvMFD0+j1MxlMqVnpvGyT6
 DDt/KyT2p2+uaX8LXynDVbaWLlWxNIFXGTOurVbL+ZEa93Uiki01rTATehOdWzlZAm2E
 pPrGaiPllhaOsT82r2y8+ZRovKd2o7+E7XbFGPhzxKPNLtPS947VTHCtMIQffUIwyRFv
 KONqg5VAwkrJWbGrXgyP2MAf4tYKHB1mtjW4RWBRm6NHWK+f9wyCKhtehA2ZdFKMusbG
 fXr+D+jV+ly8SmpwTbD6E6lJtp77LDYtofFRJj/WzyNMz69m9y5Y/5jhwPyH2XF4SX08
 nFCQ==
X-Gm-Message-State: AOAM531fFB0PRB/yBzLrX1cLc2v3Sz1YemEa7sJt6kaB3wa7hIYBVIKi
 aD/iXMWry7izNBuHhW2SQJTQphNepEeCqg==
X-Google-Smtp-Source: ABdhPJyXK9wOqjumpVbMQZSrXrr4dQo7seuoEqxQ0U11m78cBmmrQt+3mAnk4FFTOGMiiadBJD1wCA==
X-Received: by 2002:a17:907:2d90:b0:6db:729e:7f25 with SMTP id
 gt16-20020a1709072d9000b006db729e7f25mr1806969ejc.203.1649103538280; 
 Mon, 04 Apr 2022 13:18:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056402274600b004194fc1b7casm5723460edd.48.2022.04.04.13.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:18:57 -0700 (PDT)
Message-ID: <d832082d-c605-a23d-ac51-e2a75e36c377@mind.be>
Date: Mon, 4 Apr 2022 22:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220404165220.338388-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404165220.338388-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: needs NPTL
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 18:52, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 0.3.26 in
> commit a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9 and
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/b029000610d122ac12939d02ade2264605ff43de
> 
> thread-loop.c:(.text+0x81c): undefined reference to `pthread_setname_np'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6019f4e9676743685e8af81d60ef198c1eba1fde
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pipewire/Config.in | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
> index dd13f31a73..3bfcf42a81 100644
> --- a/package/pipewire/Config.in
> +++ b/package/pipewire/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_PIPEWIRE
>   	bool "pipewire"
>   	depends on !BR2_STATIC_LIBS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
>   	depends on BR2_USE_MMU # fork()
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
> @@ -46,7 +46,8 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
>   
>   endif
>   
> -comment "pipewire needs a toolchain w/ dynamic library, threads, gcc >= 5"
> +comment "pipewire needs a toolchain w/ dynamic library, NTPL, gcc >= 5"
>   	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
> +	depends on BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
