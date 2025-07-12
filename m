Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADE7C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 039A941178;
	Sat, 12 Jul 2025 11:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RfqiLNN1Nctr; Sat, 12 Jul 2025 11:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022704116B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 022704116B;
	Sat, 12 Jul 2025 11:53:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F96C1CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 512A16070B
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRBDbedrxDlt for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 731E5606D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 731E5606D7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 731E5606D7
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:53:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 92212780368;
 Sat, 12 Jul 2025 13:53:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 13:53:26 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 13:53:26 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Michael Walle
 <michael@walle.cc>, Bryan Brattlof <bb@ti.com>
In-Reply-To: <20250711120544.315926-2-heiko.thiery@gmail.com>
References: <20250711120544.315926-1-heiko.thiery@gmail.com>
 <20250711120544.315926-2-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <11f9e821cdf9106557a006c973654036@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752321210;
 bh=Z0hrQKZHRqbUCbTalxRcsFdAA4sj19vto/52IgwvtYA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mnipcry0mFDC8MC4XMai6HLwrqFDeHeHlQj2RvQ30pXFR4Bnejq2lF7Abieerjxyg
 dLEMywmbRsHCgB7SAmUWWBMKHdCyyLpsTLAU/QTUqPAPAWFzw9r8Q+u80tbZEkDuJX
 zWC+R/rjkZZ/gp2R6HSRiPV9PAgGRLF+bfmgfYp6OLDWcY1xWWQ0x7PIx80IwVSQk9
 VCWNH6pSXaN7CVGLz4QjGSVsFS1sbbzq52K4EgRf9xmyER+ghk4Wc8ZSZRhw9GV5Jy
 qqWRrOpGjpJtNp7gAivfeBY7biKQ3qcr7ehDo/XLVWy4qBe3er37xoxvMWYPovf4Kg
 Sl4dvXSbhkfWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Mnipcry0
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add support for
 PowerVR rogue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

Thanks for the patch.

On 11/07/2025 14:05, Heiko Thiery wrote:
> This "powervr" directory has been present in linux-firmware since
> version 20231211.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in 
> b/package/linux-firmware/Config.in
> index 34f3fb7691..54910df6fd 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -729,6 +729,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
>  	  Firmware files for Arm Mali 10th generation GPU
>  	  needed by the linux panthor kernel driver.
> 
> +config BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE
> +	bool "PowerVR Technologies Rogue GPU firmware"
> +	help
> +	  Firmware files for PowerVR Technologies Rogue video cards.
> +
>  endmenu
> 
>  menu "Serial adapters firmware"
> diff --git a/package/linux-firmware/linux-firmware.mk 
> b/package/linux-firmware/linux-firmware.mk
> index 38212e12ac..b9fd471e85 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -931,6 +931,11 @@ LINUX_FIRMWARE_FILES += 
> arm/mali/arch*/mali_csffw.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
>  endif
> 
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE),y)
> +LINUX_FIRMWARE_DIRS += powervr
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.powervr

Running "make linux-firmware-legal-info" with this firmware selected
generates a warning/error:

     ERROR: No hash found for LICENSE.powervr

Could you add the hash for this new file, please? In:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/linux-firmware/linux-firmware.hash


> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
>  LINUX_FIRMWARE_FILES += rp2.fw
>  endif
> --
> 2.39.5

Could you send an updated patch series, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
