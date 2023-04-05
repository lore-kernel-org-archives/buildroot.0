Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F767C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 10:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D54812CF;
	Wed,  5 Apr 2023 10:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D54812CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpPIq6goxAQq; Wed,  5 Apr 2023 10:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 700A78124F;
	Wed,  5 Apr 2023 10:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 700A78124F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0D1F1BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 10:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9428C60741
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 10:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9428C60741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCCQpoZrK8xd for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 10:28:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4764D60670
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4764D60670
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 10:28:26 +0000 (UTC)
Received: from [172.20.10.9] ([151.38.131.25])
 by Aruba Outgoing Smtp  with ESMTPSA
 id k0NLpwt7x9EM5k0NLpvvOg; Wed, 05 Apr 2023 12:28:24 +0200
Message-ID: <d841fba4-32dc-7be3-c8bb-1046033d78c1@benettiengineering.com>
Date: Wed, 5 Apr 2023 12:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230405102112.525785-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230405102112.525785-1-dario.binacchi@amarulasolutions.com>
X-CMAE-Envelope: MS4xfDNIwlFEBRw7o4/gnK8l7tjlAwDSWH7QqXiFRupj3CMQq1yRhaSUh5O/MsAEr5UJHbn+n7OfIYV+r6I88ij0E83CGGGnAg2RBoOvpbYyhMaEhaN6TtMI
 8ftSs8SWbjZ31jwAb/630GYumbqUtOCLjaPGH36KtcWoEWBJgAOQVXu7V7vS/BoXzH4WmICIKCNxWLZwbjdgbLUZyhUWmEXK6ahgWwfpLVc+cYltKJOWPhIF
 IhYKyn2Yce+/sV+RT/cTKBsAs0HiBUrC1/+AMHsdxkADC3Iqig+AbCUpohgpdp8H5Tss4WWU00chU4pgksKJ4w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1680690504; bh=eF2Ax3QoZiTvcGkag1y0ix3mO/mViEZU3LFnI4dkkpY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ISmJ4zjq5NJd7JngxTrwPm1xtfqztk5XKJEUGx3GtiqxpqUm9pU5lscHs32PjgYQG
 fHxx5H9YZivM9CzJouTgk8T3SmvP+7FCTzm859rjl5b2al0NvAB5ckYjwASnrHWJnE
 k7Epy3gtxSb9UzfZ4+1CHkudlH5B6xCXs1JzIhrf8py6KpT5rH4Uf5q1LTXWlqDz33
 aW86qHFDGGOy0Fbp44HluN/Gr0jAU468gpo4dtKG27CtI1rJZnUj7xjRKR2nrRNTsp
 HrTN6guimgnhvWyGVp7qDYuAHVk+s1VrvVBG/4gjjL6i4D9rOZNjhI4s9n9+C/B2Sn
 pfYtTSj/2GRyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ISmJ4zjq
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: bump U-Boot version
 to 2023.04
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 05/04/23 12:21, Dario Binacchi wrote:
> Bump U-Boot to version 2023.04.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   configs/beaglebone_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index d0aa5ad8603f..c2d444c3ce6d 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -34,7 +34,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set

Would it be possible to update Linux version too since you're testing on 
the board?

Same for imx8 patches if possible.

Thanks a lot!

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
