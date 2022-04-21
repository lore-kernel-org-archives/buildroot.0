Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820C6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3904D41885;
	Thu, 21 Apr 2022 20:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiGHy2Qy0JWU; Thu, 21 Apr 2022 20:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B804175F;
	Thu, 21 Apr 2022 20:59:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE7831BF20F
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B40360D80
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6FnVFIhuGwz for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:59:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C83C60C19
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:59:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso6656144wme.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y/L1JkJijx7OxzoQMpwWshK6nXUfUytpQ3U7AXP7kZI=;
 b=V+A0Z8b9muL1bEVAcI16NpvmM30TwHLww13XEkddw9RqZjQiGrDaXac8r0eqyG+4cm
 sQ97jVyLBsw8Pff4kGD7bdB6j1mV/0hg3V06OmcQSaQPupq5aACGPSQsxGzWx0QoG+b8
 hipV8ZnKIOfoHv3edqUETWglw9phtDJ848J1wQF3QE8F8nuR65zcTCfuQRVp36MwCg8f
 mCbf0FG0NlGaEILhj2wJ7w9ApFIepQsDBX5U7TEjNJPcpW3nUys3Pax13O91Q4OZa+NL
 pFCFuA2SLITz55JP8/cJLhziidEtYFQflUFMx7FDxzeNMxej63eHcjeg3P1DRLJqADYV
 QY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y/L1JkJijx7OxzoQMpwWshK6nXUfUytpQ3U7AXP7kZI=;
 b=FnulhIr8w3hXiCEVtE0tkslx2flW+599ARsGhBLWiION/kXSriLn65Gf/uyTaFi73j
 Eohs6x1Mss515/Ds9SNcM4GptTOqTGnYHXsaL47vuNThoK7+XanTynTj2UkkMtgPx3dW
 uyUYjt8Y8g2sS//QFcNj0IIOBM+BPGlc6pJYpT2B5Ky1amEbojAGNKGrl9xn3gCu+vh9
 AQqcfetYRMU8zN2YtpW2a3GlEph0S17oeCYA1GD4fG7LjU7aQI2pImBTL1wyq5CcBs27
 QpohQPrpQJBLj1gWO7Jz3dqyLGCoRK0RAdTgYhgs0TixjC5Cpr1aMYLdZHyvwNKjjuGT
 Uv5w==
X-Gm-Message-State: AOAM531Pj1CspfOCbR0LaNmGXHtAHJovWihhGq7/v7pk68hqsJpLQO0h
 s/xm7JpU0cJ+9wLnM8IIqEIb9A==
X-Google-Smtp-Source: ABdhPJy4vSZeI24YRUtVt5t9C6iomOAA1CUZA+mYVRshdTLymY+SU2Xu/KxPEkNX9ANr6faK4yTv8A==
X-Received: by 2002:a05:600c:1992:b0:392:916d:2168 with SMTP id
 t18-20020a05600c199200b00392916d2168mr1051609wmq.50.1650574789829; 
 Thu, 21 Apr 2022 13:59:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a1c3807000000b0038ffac6f752sm44321wma.45.2022.04.21.13.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:59:49 -0700 (PDT)
Message-ID: <dae48cd2-e610-ff6a-09bb-38a7147bac5b@mind.be>
Date: Thu, 21 Apr 2022 22:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220418103847.273865-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418103847.273865-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pixman: fix mips build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2022 12:38, Fabrice Fontaine wrote:
> Disable Loongson MMI fast paths to fix the following mips build failure:
> 
> ./loongson-mmintrin.h:407:2: error: impossible constraint in 'asm'
>    407 |  asm("pinsrh_%3 %0, %1, %2\n\t"

  We could maybe find the arch options with which this actually works, but I 
don't expect this is really important.

  Applied to master, thanks.

  Regards,
  Arnout

>        |  ^~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/75267aa5b5a631f091d4c8cb6ad9baeb5f72ee11
>   - http://autobuild.buildroot.org/results/55b7431a50b85c24406131af1932d6f3f6853de6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/pixman/pixman.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 6fab539593..64302fa49a 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -19,7 +19,9 @@ HOST_PIXMAN_DEPENDENCIES = host-pkgconf
>   PIXMAN_AUTORECONF = YES
>   
>   # don't build gtk based demos
> -PIXMAN_CONF_OPTS = --disable-gtk
> +PIXMAN_CONF_OPTS = \
> +	--disable-gtk \
> +	--disable-loongson-mmi
>   
>   # The ARM SIMD code from pixman requires a recent enough ARM core, but
>   # there is a runtime CPU check that makes sure it doesn't get used if
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
