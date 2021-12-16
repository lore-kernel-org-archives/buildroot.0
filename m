Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7411EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0A580EC1;
	Thu, 16 Dec 2021 20:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXpV3BM-qfXO; Thu, 16 Dec 2021 20:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B76E80E07;
	Thu, 16 Dec 2021 20:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9A21BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D35D80C8C
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnEJgNtf2j_2 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:16:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C11580DB3
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:16:22 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o20so91510757eds.10
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fjxpncfdrjtWd6spiH3P1ptwNw9DSghAHM/PuUR4o2A=;
 b=NocTk5Z9NGXbijJXvmfdwyn2xGbLkj+jZqSjVNjbgzSIfHwPnFgWdfb8mPX2nKQXE5
 eFZ1x3pU/CFKjII0ZwOrcSLahHdgPWGAlptne5A+ZI8HgCRxJP6MMk86pAj18sZSQPct
 J750ZEQYxyTl4xxTBSYYarOFYzgF9PZam2YZo/mOrbbFXEfRUCFd8bpJk6F7y14UZP4U
 nBcJdDtN9CpaQYpqjnMl0wpW38wH/alRElQSmtlQr8q9rfDVoNKLZw40sykaXwVsewxJ
 7t/X3LxCEMCop5MhETvKIaEDSF6CZsUdu5BGBWnsr/8lMSbdGCpkzAfZYcTCo2kno/Xi
 fn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fjxpncfdrjtWd6spiH3P1ptwNw9DSghAHM/PuUR4o2A=;
 b=SkejvG19BduApbHVBBkOLdsk2UiAjjnn6jK69zsir97ZkQ6c/Tn9LrFbbCDkaSQrs1
 0jxngo19shbmtIfL2Fao2ePHvKUe6b7+ybqmZKSaqgUAiZ+yrI6JelaueHdh5XwOSlrC
 KyVZs952s2wWA6tAqWfKdjjRNHuUMBB6h2IgvRr3Xa0Ps1qXDdb4hLTQwqjPVoMjY6pv
 uPNTkg1X2bKKFc6wRfL6oiDk4Acgg3KOlOCAxKAAs0JrObCBrxd7eCMdQtlEDoI57Axn
 f6x9uSgcfGTAcOVQigGzE06sqjBwoEpdThMMAo2hve3oHZtKICV8jSNcYCRYa7CuuB/l
 GLfw==
X-Gm-Message-State: AOAM532G6nGE6J/TZ2PpfQpl1iRkJflWW5u2FpUT/rsS9ienbRPVgg6B
 adwIRj4VXJh7GjJ3sEslYPGQEQ==
X-Google-Smtp-Source: ABdhPJwyygB9/gaNwdU7Ey2eMEIkV133OY1+y2b1zGGMpGkivNouwf7kxYvsMPAEqn//AhpSS4GONw==
X-Received: by 2002:a17:906:fb0c:: with SMTP id
 lz12mr17993802ejb.660.1639685780719; 
 Thu, 16 Dec 2021 12:16:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m15sm2764989edl.22.2021.12.16.12.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:16:20 -0800 (PST)
Message-ID: <cf633eaa-e7b4-33d1-7451-f42134b3d657@mind.be>
Date: Thu, 16 Dec 2021 21:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Joe Schultz <jschultz@xes-inc.com>, buildroot@buildroot.org
References: <20211216192854.4016224-1-jschultz@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216192854.4016224-1-jschultz@xes-inc.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for
 Intel E800 Series Network Adapters
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 20:28, Joe Schultz wrote:
> Signed-off-by: Joe Schultz <jschultz@xes-inc.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/linux-firmware/Config.in         | 6 ++++++
>   package/linux-firmware/linux-firmware.mk | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 3609c3ec4e..622b1ee685 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -432,6 +432,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
>   	  Firmware files for Intel 825xx handled by driver e100
>   	  (e100)
>   
> +config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE
> +	bool "Intel Ethernet 800 Series"
> +	help
> +	  Firmware files for Intel Ethernet 800 Series Network Adapters
> +	  (ice)
> +
>   config BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY
>   	bool "Microchip VSC85xx PHYs"
>   	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 79ee0316d3..281ed0189d 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -528,6 +528,11 @@ LINUX_FIRMWARE_FILES += e100/*.bin
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE),y)
> +LINUX_FIRMWARE_FILES += intel/ice/ddp/*.pkg
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ice_enhanced
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY),y)
>   LINUX_FIRMWARE_FILES += microchip/mscc_vsc85*.bin
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.microchip
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
