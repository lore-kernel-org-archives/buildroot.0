Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7787C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BBA74088B;
	Wed, 16 Feb 2022 21:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyglu1KKGrMw; Wed, 16 Feb 2022 21:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7363404A6;
	Wed, 16 Feb 2022 21:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A806E1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3AF8404A6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0Km6NwE8Tq5 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C239640302
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:48:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bg10so2322425ejb.4
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rbvi31XHKWXD6CByMhSsIizKhmdc0BZ+LJNnALSdDX4=;
 b=Ny4jaT/lohubUZTLiCT8tsXT7EoGmYCCeyhLeETfaLnnTSfnYa6eaeg00gWmvlkKp8
 Sa1SHQf3ck5Bj7LLPNS5E808Fj/mxzii80pnp9pgOmgOUnFKnu38M+EzDjbXoDl4aW89
 tbBfOdU6m1siMl/8Q5A0wT3E3VEsHAiMmu0SJXLzXM68ygsRjVSf2jOXcVrB8CM3wUB6
 PHN19GNszTVfvIPnmp6qXPjdl2lfwrSq+VMnjuBaPGGguaqSQkDbRJpvmotsTLmVSdkU
 gy4SOxbMvaKTdv9FLpZr8WbNPnim87zvb0V3ONHtM9HD0CsF9NlNxkIRjA3Qk3Bum8lk
 nuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rbvi31XHKWXD6CByMhSsIizKhmdc0BZ+LJNnALSdDX4=;
 b=b2v4GHj536L+S1biQ3vZyVlAOs90jUN4tESbdb53o0E7cm6+iTz5UCR+kJ3pDQDmgq
 72cwxI8fS9FMc5J/YEJ54A1EiGQI5RZKJDw4HB/+64kHOq27hYozTwM0RU+nebFt67mW
 IPS8dXy0uz0E8zrypdYizJblQlX4PAqy0RRepYARV24Jm61e8H7OKmTWAg13PAyQCnHR
 EkDe2UProSveNN1VZmHOX5VwL+clMDRLNixmY0GEoubIFeFcCmw0f6HBHFm7XAYf4XiH
 AprPYs9Y4e5S2a89mJEFLxO8MbCioCHdG3nU2SGfHCEpfs4aqK4s9dR8oA+8lezpKmAA
 yg5w==
X-Gm-Message-State: AOAM532AtU6bkxdjQjTa23QxMnKsnEVRxkZX/eLXDmpJD4SjpecfRFjI
 FL4meEc40adrcX9N4XHfZC+RhA==
X-Google-Smtp-Source: ABdhPJyIW1rBI5Fsz+xGIF7tvlMimCcdKeb1OfS4U3khguM2UyK5Kmb02tK0aPjvR9XgddoKvZiO9A==
X-Received: by 2002:a17:907:920d:b0:6ce:a6fc:1ad8 with SMTP id
 ka13-20020a170907920d00b006cea6fc1ad8mr20603ejb.448.1645048120038; 
 Wed, 16 Feb 2022 13:48:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t4sm2514323edd.7.2022.02.16.13.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:48:39 -0800 (PST)
Message-ID: <1b5cf8df-9b0e-42ba-5048-65e37368e2a9@mind.be>
Date: Wed, 16 Feb 2022 22:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220209191329.201362-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220209191329.201362-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/sdl2_ttf: drop FREETYPE_CONFIG
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/02/2022 20:13, Fabrice Fontaine wrote:
> FREETYPE_CONFIG is not used since version 2.0.15 and
> https://github.com/libsdl-org/SDL_ttf/commit/50d72e55315e25d34f4209824275e3b1cbe6c6f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  All 3 applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sdl2_ttf/sdl2_ttf.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
> index 1fe7c0a075..3b2b35e157 100644
> --- a/package/sdl2_ttf/sdl2_ttf.mk
> +++ b/package/sdl2_ttf/sdl2_ttf.mk
> @@ -12,9 +12,6 @@ SDL2_TTF_LICENSE_FILES = COPYING.txt
>   SDL2_TTF_INSTALL_STAGING = YES
>   SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
>   
> -SDL2_TTF_CONF_ENV = \
> -	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
> -
>   # x-includes and x-libraries must be set for cross-compiling
>   # By default x_includes and x_libraries contains unsafe paths.
>   # (/usr/include and /usr/lib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
