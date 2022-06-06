Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565E6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 19:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A59861055;
	Mon,  6 Jun 2022 19:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-73Rd97-2aC; Mon,  6 Jun 2022 19:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 598CA60C0C;
	Mon,  6 Jun 2022 19:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D69B51BF2B8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C559760C0C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLbxMGDZBCQ4 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 19:46:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C604A60BEB
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 19:46:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gl15so17102331ejb.4
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u4KSbT+1+TlmlDS1D63YCHkw2VA4lR5HJ7ODYFP5QmU=;
 b=RR2DdsXKFHEakw1R+wPYr+u8s4vC5d0OK/OPl8CQ41E8qjuFR/mMK1lwAdaIHwETHQ
 vWRZyr+F3AKerAK/J7gRkqhYaRyiog1WlyS10aETlmxEi1CnxHhcvwluVpW9+5imGvQ7
 x2wtc6taZ/zFVOGEgJLT3UrcYxjiOEYM4Wi3jlAqmp94+/QXmwTrolg5L2tMpFtR++Kj
 39AYg9PbJMDSCGFH/7s0UKHT2AVX0rZMfCX+qBvrO+3Z+JthdRSbopLW18YpEkDU+Ob9
 j+SyBI1B6CghAgxB1pY4s44HVhUSaR13n+Ys2Je6aO0v+XqfolAEBSP4trttdVLU0qkW
 V1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u4KSbT+1+TlmlDS1D63YCHkw2VA4lR5HJ7ODYFP5QmU=;
 b=b/qgUDw3ukhShwFudLzGMLY+ELK6J+sugnH6MBScKAqTnkIDCFAu+Rwf2WvUIlwJXk
 S+aE4bshGDonZURaezASHFIdQK+OV0aRTai3xcYRgd93N9Q7fRWi7ylAUGfjFIje9xrG
 nQ6k1bKXgWG+zL85a/3/mEAUAHbNzt/ODSDAr5+dOm3xe+p8PKRn4XnoLREZRERcRfhU
 /5aOtTijQ0yZqRObOk6PRc5wJ0hsDnXHz1U/9Cb1PmQTj2tXSnJmM5gIxgHeFmWBhEn4
 BUmRt8XUj92KtxstRqcCpNJi182Qgd9XlKYoqf0RSpBV/5/XdiIwrMhnpOgF+horFyrj
 VVBA==
X-Gm-Message-State: AOAM531tcLgfMGy3MsgLhovfI41+O4RR01K/oY4QGIyu1v8u9kC8dNt0
 1O12XjRj00PVShqjnIj/ccaUMA==
X-Google-Smtp-Source: ABdhPJznPzUY4jMt8TlHA6oTnB8d7vV0W7hHGnx/nCfrDg2NRksvHV5AE+JmxiFZ5trr0R8bSWSBcQ==
X-Received: by 2002:a17:907:7f91:b0:6ff:c1a:2e8e with SMTP id
 qk17-20020a1709077f9100b006ff0c1a2e8emr22192628ejc.70.1654544813862; 
 Mon, 06 Jun 2022 12:46:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170906b08e00b006ff52dfccf3sm6517055ejy.211.2022.06.06.12.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 12:46:53 -0700 (PDT)
Message-ID: <084ca2e3-4f6e-a701-24d7-fe39306324ec@mind.be>
Date: Mon, 6 Jun 2022 21:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606163914.1592818-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606163914.1592818-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rockchip-mali: fix armeb build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2022 18:39, Fabrice Fontaine wrote:
> Fix the following armeb build failure raised since the addition of the
> package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:
> 
> ERROR: architecture for "/usr/lib/libmali-bifrost-g31-rxp0-gbm.so" is "AArch64", should be "ARM"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/33ebfa936da8dfa4035db08a96f8872d7c9db6c3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/rockchip-mali/rockchip-mali.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
> index 848682229d..98dabf70d7 100644
> --- a/package/rockchip-mali/rockchip-mali.mk
> +++ b/package/rockchip-mali/rockchip-mali.mk
> @@ -14,7 +14,7 @@ ROCKCHIP_MALI_PROVIDES = libegl libgles libgbm
>   
>   ROCKCHIP_MALI_LIB = libmali-bifrost-g31-rxp0$(ROCKCHIP_MALI_SUFFIX).so
>   ROCKCHIP_MALI_PKGCONFIG_FILES = egl gbm glesv2 mali
> -ROCKCHIP_MALI_ARCH_DIR = $(if $(BR2_arm),arm-linux-gnueabihf,aarch64-linux-gnu)
> +ROCKCHIP_MALI_ARCH_DIR = $(if $(BR2_aarch64),aarch64-linux-gnu,arm-linux-gnueabihf)

  This just moves the problem to BR2_aarch64_be... So I change the code back to 
the original and instead added BR2_armeb to the condition.

  Applied to master, thanks.

  Regards,
  Arnout

>   ROCKCHIP_MALI_HEADERS = EGL FBDEV GLES GLES2 GLES3 KHR gbm.h
>   
>   # We need to create:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
