Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0797FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A576A60E67;
	Sat, 12 Mar 2022 19:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3-9--1HAi0p; Sat, 12 Mar 2022 19:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3114960E60;
	Sat, 12 Mar 2022 19:44:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D29A81BF3E8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D005F824A4
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zc4E5hem4hw for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:43:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3B8C81494
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:43:58 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qt6so25872931ejb.11
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 11:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=K0Qfoefg1MM0jAPHE63bmwD1e3Ay6Q/5g4g2hl1Ltec=;
 b=Zt6MMsMzYtAQJOlVVsFPerB8Ms3Wy3sRKzUKKzX3UzCDljnhh1BlEEs0ymjXS/00Em
 iqrasRDB4ucgLR2tF0oKDjB77ZWMsMcf54dcgr6cKgC3sFdB5mObjvkMSvkoeOSxl0hG
 q3cpJjrtqM9NMgEoVMrPgDYokXqylTcrXt/DKirI5uX0NIn6x3NibqHh/JURjixJEZg9
 R4q9fAEiUWXDaf9mHrZoNwyXv0tX1H0CKzbVkmo3iBEnFI4QWsmUOvCNTRVSsdredCcb
 XNaouUgb8s7ZijW37WreYGKU2QKt2QZHYJNTK5eHG5eJOEp4R7q4aTr0m5UjlUY/+j6W
 Exnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=K0Qfoefg1MM0jAPHE63bmwD1e3Ay6Q/5g4g2hl1Ltec=;
 b=CJTzNDS59977WZRLCGIkGHbH9kY4hg3Ruw9p3ZRkOMx4McWKUlLXuE8OqXRvVH3j/z
 uMneuzl+CyDQ+nr/nYboxH0a3ji/uCX6o13doT9xnUW7zqm4ADeU47pqLdREXnOg2zoz
 oPFnH1x8njDuZ/F+3rWomfUctXizS243Dg+XX90RkKI5duWLYa9wsYpjRO1BL4INCH7v
 9xO7YbSeNR4E3wNlzX4yeEma1SoJdNQfpp+RLSJZa1GY6MJfimYq93ljValOHP4WZ9Oh
 FAs3iEsvpx/yrHn+1LZIp8NQFfW8sxO0V5TVESIYNyvPEPSadsyGoeqLgbFx53DYNHIj
 uIHg==
X-Gm-Message-State: AOAM531vkyYjYubrFGGwfw/icD2OXOt9bQ5GU0FG3g6hsWiTDdKUpAFc
 zt2EBXx/7PoErcEjxfyrC5oy+g==
X-Google-Smtp-Source: ABdhPJwobG9YzJslrtEuqtRJXq61zRvga//S1AYhtVMyLioqRbWeAaQHY+zVIVozoIq8HF5QbxDB+A==
X-Received: by 2002:a17:907:2ce5:b0:6db:aee8:7315 with SMTP id
 hz5-20020a1709072ce500b006dbaee87315mr6262353ejc.314.1647114236804; 
 Sat, 12 Mar 2022 11:43:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a170906289500b006d144662b24sm4595771ejd.152.2022.03.12.11.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 11:43:56 -0800 (PST)
Message-ID: <4827f093-f828-2591-c7d8-de6be1900b5c@mind.be>
Date: Sat, 12 Mar 2022 20:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
References: <20220223043320.25753-1-ckhardin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220223043320.25753-1-ckhardin@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-plugins: bump to version
 1.2.6
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



On 23/02/2022 05:33, Charles Hardin wrote:
> https://github.com/alsa-project/alsa-plugins/releases/tag/v1.2.6
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/alsa-plugins/alsa-plugins.hash | 2 +-
>   package/alsa-plugins/alsa-plugins.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
> index 8ecbd19965..2582a0d639 100644
> --- a/package/alsa-plugins/alsa-plugins.hash
> +++ b/package/alsa-plugins/alsa-plugins.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  42eef98433d2c8d11f1deeeb459643619215a75aa5a5bbdd06a794e4c413df20  alsa-plugins-1.2.5.tar.bz2
> +sha256  068818a4b55d8c029daa00015d853d45113f56b224b7c64e1e117988c825b2a0  alsa-plugins-1.2.6.tar.bz2
>   sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
>   sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
> diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
> index 396f47adaf..b8819151ef 100644
> --- a/package/alsa-plugins/alsa-plugins.mk
> +++ b/package/alsa-plugins/alsa-plugins.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ALSA_PLUGINS_VERSION = 1.2.5
> +ALSA_PLUGINS_VERSION = 1.2.6
>   ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
>   ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
>   ALSA_PLUGINS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
