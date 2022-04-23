Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B785BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5649682A28;
	Sat, 23 Apr 2022 16:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oq8F8CahEBHs; Sat, 23 Apr 2022 16:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF908272C;
	Sat, 23 Apr 2022 16:31:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAE9B1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D79C260D50
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlWajyosgNrB for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:31:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9798860BC8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:31:40 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y20so21837428eju.7
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jMWICi/+RnPAUFX7C8CnE2JgGREj1SP0rSJPKV5473s=;
 b=YUbXbeqwyWf+bLEelPjZrUbOFm2nnM0lOHBIz57gq+zKAeqMq9uD2fECUSMJeiV3+b
 7LEfAhw+MBLfmGliCHKa7QeEvI1SI7Sy+EwYx1L9Hm+Wvy+yqaNdDM7sOee/rC2AmPnh
 ZQpvrzL3xAiyIjmh1OrmgFE3HdDv7YWVrxhYourd0lAnRfQsERYC+UxommX/uCBDcB3w
 wwn5OmSCxIANGdUD4rzGLaTufTHn5vPifONHOWb0FcoAU0JtuYmfb+uRTENq0jlam38y
 DplFvBQt1vszZNumcKCaHE1J5HO8CxvlNTD2JC1Cbd9dYXAS5mWncdquFP7wY5l1QLs4
 c1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jMWICi/+RnPAUFX7C8CnE2JgGREj1SP0rSJPKV5473s=;
 b=b7/rePLlfCZQDs1VlRFiwbdAf5Kff35Aw+lhDEweNe8L4tTjRo5eszkGZyd8vfqyQI
 1rr9F23b3aaaRfDfj1r8JzA24sZKw7yN7ACFUYk48g6bSUAX8Pc6shnTxXYovj0HJmX6
 hBbGH1BFjlTHLReGN1Py+DkHo/+hqXAeWkY3OIHJfrIlRbJMiRd1M3YFvFik5hVE+VLR
 jkaq2ZAe0I1SEK2rI4lwQoP78jqL4cwNwChQwlKLHUYQFwNSYDLQNsjCBstQCldNpTUh
 vYbB4NeGYX1AvJPYyqoIUIT9hjHFJbK+o0DYv3f4lB4GivTUB+uighILh17bJSgIqUoT
 xsqg==
X-Gm-Message-State: AOAM531LCtYqOZlFPv5LhNCGjHkMeqlFcz4a686Yar5tW/56I1CiLc0H
 I2xo0dL25vsX3socUu1I/3DmocLx0FKSrg==
X-Google-Smtp-Source: ABdhPJyPKhGoB40d2GPIWF5smMxNPf0ftme0pywjsHWN5CJ9WWCjE06yvTNXQwYAvDmyXD/iMG4guw==
X-Received: by 2002:a17:906:4fcc:b0:6e0:3269:2054 with SMTP id
 i12-20020a1709064fcc00b006e032692054mr8696450ejw.117.1650731498773; 
 Sat, 23 Apr 2022 09:31:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a1709061f0700b006ec8197e8a4sm1825894ejj.97.2022.04.23.09.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:31:38 -0700 (PDT)
Message-ID: <a89af392-0b83-87cc-51e4-2c7b8b5db310@mind.be>
Date: Sat, 23 Apr 2022 18:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220421172407.2759939-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421172407.2759939-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 22.4.0
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



On 21/04/2022 19:24, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>   package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index 5c3d25eed8..e6cd7a1cd3 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  0fdccad95a561178bd19fba69ab94be23bd4a3072e68aa18c3304c990d87d7d8  intel-media-22.3.1.tar.gz
> +sha256  f070527b141174970a17195d0225ed43693c39fec83cd5e6d0effaa88e2a5553  intel-media-22.4.0.tar.gz
>   sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index 4280f7fd29..f3833fcc45 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>   
>   # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>   
> -INTEL_MEDIADRIVER_VERSION = 22.3.1
> +INTEL_MEDIADRIVER_VERSION = 22.4.0
>   INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
>   INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>   INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
