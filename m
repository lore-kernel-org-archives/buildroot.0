Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB40C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CFE94060C;
	Sat, 12 Aug 2023 20:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFE94060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Id7buk78-cjM; Sat, 12 Aug 2023 20:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223844052A;
	Sat, 12 Aug 2023 20:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223844052A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6BA71BF4E4
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9004F40579
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9004F40579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQA5k7pE_isC for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:23:47 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 448A84052A
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 448A84052A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2AC7F780340;
 Sat, 12 Aug 2023 22:23:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 22:23:39 +0200
Date: Sat, 12 Aug 2023 22:23:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230812202339.GR421096@scaer>
References: <20230221214904.454053-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221214904.454053-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691871824;
 bh=zV9k8bB61Xq9AFj7i/jDc18eD9UYVMGYAv/8ppfTr5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fOG7kEAZeiGMGaotVb99Kw2ChJv7rCVzSzQ3HNQcd7QxDLKb5mcZa+sXZTVmwv8n/
 kQ70Y9waIqEoLpqnWbdScm03y/G5fOWCl0pL1ojp5KQOu4vPEXydZ1zyVxCjCqM/oY
 Csto00gmVWJ4jhbob2t0bTXqLYsOO14Y57Bn7KSWewqLD2hyfh+7e8hfA7mMtNYPki
 Of1woX95o53LWf00cOVhPkpZxM2x7ZwnAw3x3KL2PWf/dzcbvXcqi6mHHyyp1bv/Q5
 bkJQnbFXcId+WHmmTgR/vZbv9r8dGzUaG/t9QYAI7CHQV6zyW8GjW7nLEHD42HJCgT
 tn6KZh2vAyxTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fOG7kEAZ
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: introduce a
 choice to select the BL33 image
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
Cc: Vincent Fazio <vfazio@xes-inc.com>, Sergey Matyukevich <geomatsi@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-02-21 22:49 +0100, Thomas Petazzoni via buildroot spake thusly:
> We now have 3 different options to select an image as the BL33 stage
> of TF-A: Barebox, U-Boot or EDK2. Technically speaking, they are
> mutually exclusive: they all specify a BL33= variable to the TF-A
> build, and TF-A can only support a single BL33 stage.
> 
> However, as pointed out by Vincent Fazio in [0] there is nothing that
> prevents selecting Barebox, U-Boot and EDK2 together, even though it
> doesn't make sense.
> 
> To address this, this commit introduces a choice...endchoice block,
> into which the Barebox, U-Boot and EDK2 options are moved. An
> additional "none" option is added, which is the default, and
> corresponds to not having any BL33 image.
> 
> Since we keep the same name for the options, no legacy handling is
> necessary.
> 
> [0] https://lore.kernel.org/buildroot/PH1P110MB1603A4AA1638838DA56BAA069FDA9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM/
> 
> Reported-by: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Casey Reeves <casey@xogium.me>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

As seen on IRC, this is not critical, even if semantically it is a fix.
so: applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/arm-trusted-firmware/Config.in | 57 +++++++++++++++++------------
>  1 file changed, 34 insertions(+), 23 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index cb54c6c9d8..a5ac987172 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -129,8 +129,17 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
>  
>  endchoice
>  
> +choice
> +	prompt "BL33"
> +	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_NONE_AS_BL33
> +	help
> +	  Select the image to include as BL33.
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NONE_AS_BL33
> +	bool "None"
> +
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
> -	bool "Use Barebox as BL33"
> +	bool "Barebox"
>  	depends on BR2_TARGET_BAREBOX
>  	help
>  	  This option allows to embed the Barebox generic BL33 image in
> @@ -139,6 +148,30 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
>  	  variable pointing to the generic bl33 image is passed
>  	  when building ATF.
>  
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> +	bool "U-Boot"
> +	depends on BR2_TARGET_UBOOT
> +	help
> +	  This option allows to embed u-boot.bin as the BL33 part of
> +	  the ARM Trusted Firmware. It ensures that the u-boot package
> +	  gets built before ATF, and that the appropriate BL33
> +	  variable pointing to u-boot.bin is passed when building ATF.
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> +	bool "EDK2"
> +	depends on BR2_TARGET_EDK2
> +	help
> +	  This option allows to embed EDK2 as the BL33 part of
> +	  the ARM Trusted Firmware. It ensures that the EDK2 package
> +	  gets built before ATF, and that the appropriate BL33
> +	  variable pointing to the EDK2 is passed when building ATF.
> +
> +	  Do not choose this option if you intend to build ATF and EDK2
> +	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
> +	  build system, the dependency between ATF and EDK is reversed.
> +
> +endchoice
> +
>  if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
>  
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
> @@ -150,15 +183,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
>  
>  endif
>  
> -config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
> -	bool "Use U-Boot as BL33"
> -	depends on BR2_TARGET_UBOOT
> -	help
> -	  This option allows to embed u-boot.bin as the BL33 part of
> -	  the ARM Trusted Firmware. It ensures that the u-boot package
> -	  gets built before ATF, and that the appropriate BL33
> -	  variable pointing to u-boot.bin is passed when building ATF.
> -
>  if BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
>  
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
> @@ -170,19 +194,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
>  
>  endif
>  
> -config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
> -	bool "Use EDK2 as BL33"
> -	depends on BR2_TARGET_EDK2
> -	help
> -	  This option allows to embed EDK2 as the BL33 part of
> -	  the ARM Trusted Firmware. It ensures that the EDK2 package
> -	  gets built before ATF, and that the appropriate BL33
> -	  variable pointing to the EDK2 is passed when building ATF.
> -
> -	  Do not choose this option if you intend to build ATF and EDK2
> -	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
> -	  build system, the dependency between ATF and EDK is reversed.
> -
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
>  	bool "Include NXP RCW in BL2"
>  	depends on BR2_PACKAGE_HOST_QORIQ_RCW
> -- 
> 2.39.1
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
