Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C87B40469;
	Wed, 16 Feb 2022 21:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hph7xf81KoRx; Wed, 16 Feb 2022 21:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA0040302;
	Wed, 16 Feb 2022 21:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5691BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8737F83380
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RM-vE9lhBy8U for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:48:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 809B98333E
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:48:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a8so2289797ejc.8
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Zbrti0ftqip3gEV77+xYqIQP+MzOiubTxrs8+bAQkKY=;
 b=L/bx8xBBPhYuspg/NfmJdLJ+AoJatLEnxc4F36UHgZ6gMsEa2sKOFl5PE6/77jaaBp
 Y0YeV6IHmVPnCPqb+lkPVl1oQsozv8+MuFbLwY18SWxJ2TTyX5nQaYSLlZGBu2pUvlO2
 uU4TjkE4AlUbBmgU9M6ikJE1/obR+3ZTzj/TFRXyOGrBfMd6kMVvLiwQCRi4saygnx3S
 mcHRaJteVD/spyIo/asA81eorCmcjosNAzp7FjRPV0KUuGDrVpZHiA0iJEycoV5knQKs
 qPyb+k4VA99ANi6UJlYrraxucphhQBqjhLsileV0vIlXD5PRvlvWo1rDh8b7A9KZRaua
 Jukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Zbrti0ftqip3gEV77+xYqIQP+MzOiubTxrs8+bAQkKY=;
 b=zSM2vI9YX5okJAsWcq9jEr6MqtwiYgxNZNRlVRWji1k+oxUf5jr6XRa4wAjSYp1FmX
 4sN3zuQbSwTTvyRkwRHcx6Qe6yaF9hG0i5BIa2k+e/qsvllJdSfzDOlqHg6sy2Ovn1Bw
 7qMpsTlf6vfPk1qmLTqIXSQNE0lzbDth7fwLJ8EC7/A09uxkAFwLrKaLpfTgjV2PiMaj
 eclDXp74OslcZwzOaS7BKeVq7vnSY9/aZmx3h6pMqKq9F51rWH+oC1D/Qzv8RBtlw/y3
 ar/k1ljO7YFLQp4duh6OVroUGan+1C68kwEDQqLTig+Y/D6phPo7SvbxnMdL5x+XyPJB
 vpdQ==
X-Gm-Message-State: AOAM532QkLj1zJB1oaSZaLxp5Vu0kwq2VBx7SWEf8VXtEmlELqz2E2BI
 UvZcUsKbDBudWAxC9QssqHJFVTS6u7U74w==
X-Google-Smtp-Source: ABdhPJzxgr07AZohjLUl6i6k+Lr4nRjaMGFBPCTEEb9tV+fxIFYBSZCOsHcS11Xka5cdYIJ9eDVe3g==
X-Received: by 2002:a17:906:2cd0:b0:6cf:d02f:303b with SMTP id
 r16-20020a1709062cd000b006cfd02f303bmr12423ejr.650.1645048088758; 
 Wed, 16 Feb 2022 13:48:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m7sm394905ejq.10.2022.02.16.13.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:48:08 -0800 (PST)
Message-ID: <56cdb416-0228-67f6-0690-65800a6b230f@mind.be>
Date: Wed, 16 Feb 2022 22:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220211211207.762485-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220211211207.762485-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-base:
 fix build with gcc 4.8
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



On 11/02/2022 22:12, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump to
> version 1.20.0 in commit 801131157dcef2c97e947a1d3e8c9bfa7aa3d870:
> 
> ../gst-libs/gst/video/video-converter.c: In function 'convert_I420_v210':
> ../gst-libs/gst/video/video-converter.c:3771:7: error: 'for' loop initial declarations are only allowed in C99 mode
>         for (int j = width * 4 - 1; j >= 0; j--) {
>         ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c4b1449f35debcbabff7e42abe239695d4ad4d21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> index 68281738fa..08aac850cd 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> @@ -11,6 +11,8 @@ GST1_PLUGINS_BASE_INSTALL_STAGING = YES
>   GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
>   GST1_PLUGINS_BASE_LICENSE = LGPL-2.1+
>   
> +GST1_PLUGINS_BASE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
> +
>   GST1_PLUGINS_BASE_CONF_OPTS = \
>   	-Dexamples=disabled \
>   	-Dtests=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
