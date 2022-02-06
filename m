Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C840BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C7D60C21;
	Sun,  6 Feb 2022 10:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxz5S7APl_b2; Sun,  6 Feb 2022 10:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22C360BE4;
	Sun,  6 Feb 2022 10:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F47D1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5657160BE4
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4MFrE2mAaR0 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:50:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45DE360B6A
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:50:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F09E1C0006;
 Sun,  6 Feb 2022 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644144607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3aUGAx4/WNUXMWrwnupht+V5Q2MdvlY3Phj9zwz81Q=;
 b=ea6eie0xy4WvXOhGzDzbXsRmeFgTGQ+383JhINjzL1GuJDPeYbrLCSOPz+n3xWm5TY/TcJ
 zozlmUfkSMCoK8IUYVPfe7+8E4aE4nwoGkoEDkx8mEnXOfsGuDDxqTAvOkri6pxouuWoVZ
 DTXTFxL5wQC+kAFJT7kh1c8lD3tJMGdXePg89guH7kWjl5Ymg/udtKVEgqHCbbEJ5aNhdP
 vrZSPmwJXAhAypf60pC9Eq7rI8WhzLYwRWLz0y4IJlgN6tNffK221g795GUhTXSfaE0Wlz
 tfFIrP5YtlC/MNJL1vHpm1uFZN+oDn+cLQsvTptO4OAmzZjiC940JMGdgfBV+g==
Date: Sun, 6 Feb 2022 11:50:06 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220206115006.4619d1fc@windsurf>
In-Reply-To: <20220201230414.4144930-6-giulio.benetti@benettiengineering.com>
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
 <20220201230414.4144930-6-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 5/6]
 configs/microchip_sama7g5ek_mmc_defconfig: add missing
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 and host openssl for linux
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Feb 2022 00:04:13 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821098
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add host openssl linux
> ---
>  configs/microchip_sama7g5ek_mmc_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
> index b1cd193829..df48c0880b 100644
> --- a/configs/microchip_sama7g5ek_mmc_defconfig
> +++ b/configs/microchip_sama7g5ek_mmc_defconfig
> @@ -1,12 +1,14 @@
>  BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_NEON_VFPV4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y

This will continue to break: the big problem in this defconfig is that
the kernel version is not defined as a fixed version.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
