Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B5EC77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 11:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D51682100;
	Sun, 16 Apr 2023 11:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D51682100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UAIRvnOcJaJ; Sun, 16 Apr 2023 11:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 640DD82116;
	Sun, 16 Apr 2023 11:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 640DD82116
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFB41BF4D5
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 11:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65F7260B79
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 11:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65F7260B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RdzJ4-09Z7Ns for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 11:54:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3845B60B26
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3845B60B26
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 11:54:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1E6715FFA1;
 Sun, 16 Apr 2023 13:54:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 13:54:49 +0200
Date: Sun, 16 Apr 2023 13:54:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230416115449.GZ2819@scaer>
References: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681646093;
 bh=Rt75gCqRw0oObJUeDKcnLrz9g3QDGw1JlLDbuIHJsMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOOKzAI8qcF4nDraD+F5UvE1S499wx4smcZJYMoVPaq5Hi8OpngtpK0+Y1YKyFEwJ
 gqeb0iXo9Eyg5z4evp+agsHZooVFde7/hcWT+4H1fRkwdhK7EomxOPaoRsFD5zVXls
 IAKAS8BcH+tChGGINsplI1MRQRC9LWt0OFiPpIuaBGnTDNsyDUnTXxGBtvOG0mkHAB
 UiGOh1UuaRrSuoSGhb4QNSn7qJ8kWuwS5jiPbTsVScJxu67+q5DiQ4Lfdi5SabMQbe
 iiOUxs5dZWae3qxJC6PwcH5Zo2DGsl4QoYk97U9pFEZR9hmmCS8ffzHKj7/ba5xZHt
 VsI9mfLReoNlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JOOKzAI8
Subject: Re: [Buildroot] [RFC PATCH] package/linux-firmware: Add more Intel
 WiFi 22000 series
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2022-08-18 15:18 +0200, Stefan Agner spake thusly:
> Add more Intel WiFi 22000 series firmware files. Allow to select the
> firmware version using shell globs.

There has been some feedback suggesting some alternative approach, so
I've marked this patch as changes requested in patchwork, until there is
an improved patch.

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> With the Intel WiFi 22000 series the amount of firmwares is just stagering. So
> much so that it causes size issues in our case.
> 
> Intel firmwares seem to have an API version, which is the last digit before the
> file ending .ucode. The Linux kernel sources have defines which API each
> individual driver supports (e.g. Linux 5.15 22000 series kernel driver
> supports ucode API 39 up to 66).
> 
> This crude method uses just file glob matching to allow to select firmwares
> which match the kernel in use. However, this approach has a problem: Some
> API versions are missing. E.g. simply using "66" doesn't work since some
> firmware are not available with the latest API supported (e.g.
> iwlwifi-so-a0-gf-a0-64.ucode).
> 
> Also if an older kernel is in use, some firmware files with an older maximum
> API might just be missing, which leads to tar complaining about missing files.
> 
> In this case, we can use 6[46], which happens to select the newest version of
> all firmwares (it seems that firmwares which are available with API version 66
> have only been released with version 63 before).
> 
> However, this of course might be just a coincidence. Ideally Buildroot would
> select the newest version available for a particular API version. Not sure if
> this is easily doable.
> 
> Thoughts?
> 
> --
> Stefan
> 
>  package/linux-firmware/Config.in         |  9 +++++++++
>  package/linux-firmware/linux-firmware.mk | 15 ++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 8ce71140da..49a40283c8 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -181,6 +181,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
>  	  Firmware files for the Intel Wifi 22000 devices supported by
>  	  the iwlwifi kernel driver.
>  
> +if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB
> +        string "*"
> +        help
> +	  API level for firmware files of the Intel Wifi 22000 devices.
> +
> +endif
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
>  	bool "Intel iwlwifi 22260"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 64d096df14..2283cd7d5e 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -436,7 +436,20 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
> -LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
> +LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB = $(call qstrip,$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB))
> +LINUX_FIRMWARE_FILES += \
> +	iwlwifi-Qu-b0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-Qu-c0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-Qu-b0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-Qu-c0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-QuZ-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-QuZ-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-cc-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-ty-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
> +	iwlwifi-so-a0-gf4-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>  endif
>  
> -- 
> 2.37.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
