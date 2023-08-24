Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA75C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB6A041DB8;
	Thu, 24 Aug 2023 21:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB6A041DB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzkBChOIYkAB; Thu, 24 Aug 2023 21:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB20341DB7;
	Thu, 24 Aug 2023 21:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB20341DB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86F1D1BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5835C41D98
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5835C41D98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9AFZr9UMzct for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:22:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26FAA41DB7
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26FAA41DB7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 092DDE0003;
 Thu, 24 Aug 2023 21:22:12 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:22:11 +0200
To: Javad Rahimi <javad321javad@gmail.com>
Message-ID: <20230824232211.250d51b1@windsurf>
In-Reply-To: <20230815131542.1402848-1-javad321javad@gmail.com>
References: <20230815131542.1402848-1-javad321javad@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692912133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFCzSJrdZAp5+ZQBmgxs7hrUJIlU4JW0HaoABZhin2A=;
 b=MFw+E+TF/dOtF4JcXtWn5Zb1EqICO4Zjr29ogzC0ULcgIalE6H7XRLJ9J7dN7DCOniMgvx
 INLSWABQeKcwoKhpoXwvMYIDhStRpQPpCqJ5lGjKUKUY9qIvVItTAxsuhUosKNRzhwRoEp
 YHuFVMQYcBy0ob76XbGYzRq5NSMmstU7Iy2NmIvZe4uruI3ksfm7a4ur3Lt9JptxCkSkcc
 mm2xlPKyxNrbVVvLq/3CT8EqhVmyu98QeqneP5KuZQXH0LYWuc/vjeboOcw5yMwvY9lEKH
 96A3QBFprZrCf1LYd3OhTtTkThY0kZE8DKfttRn4waCqgm3dMXR4CTwYcINV9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MFw+E+TF
Subject: Re: [Buildroot] [PATCH 1/4] configs/orangepi_pc2: bump Linux
 version to 6.1.45
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 15 Aug 2023 16:45:39 +0330
Javad Rahimi <javad321javad@gmail.com> wrote:

> diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
> index 3de067ae54..7536704947 100644
> --- a/configs/orangepi_pc2_defconfig
> +++ b/configs/orangepi_pc2_defconfig
> @@ -1,13 +1,13 @@
>  BR2_aarch64=y
>  BR2_ARM_FPU_VFPV4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.45"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"

Thanks, I've applied the series of 4 patches to next. But now I realize
that your PATCH 1/4 was missing your Signed-off-by line... Not sure why
git allowed me to push something like this with the author not matching
the first Signed-off-by line.

Also PATCH 2/4 was missing a justification, so I added one in the
commit log, based on the previous discussion we had.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
