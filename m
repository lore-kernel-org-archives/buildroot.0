Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AF0C433FE
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC59383E75;
	Thu,  5 May 2022 20:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9VpmcK3yniI; Thu,  5 May 2022 20:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F09B68329E;
	Thu,  5 May 2022 20:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41A421BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DCD5404A0
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFhrHizl5oVF for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B6074049E
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:12:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gh6so10814915ejb.0
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Wy14Q7ZE8odtv4a78g4cSm1neub7/oWyKHBwnimOxqM=;
 b=J0yjWtmd3nz5c3qL0FeeKaD0pCm40OdCs2NEMhrvDK5L0VkSEwn5UXFyCpDNoYWXAd
 cPY2CSSjzvzgY52h4i9bAagI28xSsNgId6aXq9WHgJQxIrbld/q+YytLTPPqNnnv78KR
 Uv79ivELSyaQWHYBNdUSWR2cW0f8BAEB8/RgVE8PVPChZqJqg6VEcfjaPUPlkldzZKqq
 /tbJYhHAaey//m5LhAubdk2zUKoqTXwgNhRRGOOkw/7axY8S8PoyDNvUmW5w77YDRCss
 uu/xQhe/NaPOhYFGQ1tncRvkX9kqfadFZ9XMkSwoaNTIYoLRWE09RTr0WaNz0StgPhPP
 nH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Wy14Q7ZE8odtv4a78g4cSm1neub7/oWyKHBwnimOxqM=;
 b=nJSTaMWJXZE3UHRzb55q8PK2kj2YqBYT0kFlE/KwCVuKwkT5wKUJ5+sWSLyH9aCUH5
 J/Q5yygaHweeFkjaXmmnLThBudMatVNq4L5U6DuvhcbgSADpU3RsrmE1QAMHeoeJgzGc
 WWDRy8nEAk4SPRlOcByMhyzD4/DWMyQk5QVVADyayNiP+1cSEClSm00iieyv0YlRQA/r
 QNuEBNsaB7g76m5ThnBdbT8LSyAzmGytEX/+uYheFFLFhD9MYc6DJf/Zhf5zRCq2JeWU
 KZqo6e9ELnzcgnh/NJVFiMleLp+F1xvPTZO/Jf84bhLPZqp39vkmxY8ZkCpVrwA3ykwn
 c0vw==
X-Gm-Message-State: AOAM532nfZb3HDGk3b+rKx1BlMg69lA336T0hH1TgOsXn8Sbi0ucbtPz
 FW0VVoOChqg1g3Gxq7L7LBZhcw==
X-Google-Smtp-Source: ABdhPJyaeFkVX2flfEp/hiR6rmtZfKTyq4FWaLusSxIRvE7d9S8uV7rS4oAlVLyFwA7fY25lJ0NsUA==
X-Received: by 2002:a17:906:99c3:b0:6f4:b02a:d53b with SMTP id
 s3-20020a17090699c300b006f4b02ad53bmr11870099ejn.331.1651781539535; 
 Thu, 05 May 2022 13:12:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jx3-20020a170907760300b006f3ef214e22sm1063489ejc.136.2022.05.05.13.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:12:18 -0700 (PDT)
Message-ID: <4f491281-256d-4f56-d909-a001230efddd@mind.be>
Date: Thu, 5 May 2022 22:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220505174010.83712-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505174010.83712-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: add missing dependencies
 to libusb
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



On 05/05/2022 19:40, Julien Olivain wrote:
> Fixes:
> - http://autobuild.buildroot.net/results/97d07f84cf8e34a697bd332c360ce353b96b2e26/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ola/ola.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/ola/ola.mk b/package/ola/ola.mk
> index 1fd6d6a592..6600de797e 100644
> --- a/package/ola/ola.mk
> +++ b/package/ola/ola.mk
> @@ -203,6 +203,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
>   OLA_CONF_OPTS += --enable-stageprofi --enable-libusb
> +OLA_DEPENDENCIES += libusb
>   else
>   OLA_CONF_OPTS += --disable-stageprofi
>   endif
> @@ -215,12 +216,14 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBDMX),y)
>   OLA_CONF_OPTS += --enable-usbdmx --enable-libusb
> +OLA_DEPENDENCIES += libusb
>   else
>   OLA_CONF_OPTS += --disable-usbdmx
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
>   OLA_CONF_OPTS += --enable-usbpro --enable-libusb
> +OLA_DEPENDENCIES += libusb
>   else
>   OLA_CONF_OPTS += --disable-usbpro
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
