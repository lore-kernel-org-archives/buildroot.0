Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E13AC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 15:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E9006117B;
	Sat, 30 Jul 2022 15:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E9006117B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13NJTHtIckbl; Sat, 30 Jul 2022 15:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A581461170;
	Sat, 30 Jul 2022 15:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A581461170
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFCCF1BF3D2
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4B9D60E47
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B9D60E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icYA8NVsbBil for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 15:02:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAAB561170
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAAB561170
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 15:02:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D9DA76013E;
 Sat, 30 Jul 2022 17:02:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 17:02:25 +0200
Date: Sat, 30 Jul 2022 17:02:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220730150225.GV3168@scaer>
References: <20220729210444.1787668-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729210444.1787668-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659193349;
 bh=d2Y8bHjgoQyd+yl9QUdR9mzwUo+OV4dXCHK/6alAAiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S4wDYQWpr/l0aQHVcQoyC5gDzJ7fRveHAwsVPLX3F8Tdr968oOq5EwpO+Tezer13i
 KNsSWX1xMCyS/PNcQNGHKMF8cHPNhH2my2PXVMyEb1p4XAzshpfEhMwt9ciaYzrbVD
 0husKxPXhjz1WC6P7Az4bYcNMGOSFcY/diigW9lWPrOk46bC+RmLzaTJxlNYvV7z4+
 7YICqPuVqTE11STW7jqH44zpR8wvdsGdvUDxio/W74cV6DA+bcu+eoY+6PZQxbKpmO
 tvPgTunHWgGkr2mTSvQJui7CsvtabIpuO38f0rJpiCL4Kq2O5wPzFk/9WeLIAb7fII
 CuaxMvAZJN9wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S4wDYQWp
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: set CFLAGS from
 environment, not override
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-07-29 23:04 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Older versions of TF-A don't support setting CFLAGS on the make command
> line. They use 'CFLAGS += ...' in the Makefile, which is still
> overridden by the CFLAGS on the command line.
> 
> Fix this by moving the CFLAGS setting to the environment. Both older and
> newer versions of TF-A handle this correctly.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800954
> and a large number of other defconfigs
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Kory Maincent <kory.maincent@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: updated commit message to show that it's fine for new versions as
> well.
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 6b0405a44a..7c4e7edb00 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -60,13 +60,13 @@ endif
>  
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> -	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
>  	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
>  	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
>  	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
>  
>  ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
>  	$(TARGET_MAKE_ENV) \
> +	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
>  	ENABLE_STACK_PROTECTOR=$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_LEVEL))
>  
>  ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> -- 
> 2.35.3
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
