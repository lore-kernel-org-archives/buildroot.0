Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D75AC25B06
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0218F81A5F;
	Tue,  9 Aug 2022 11:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0218F81A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHdiSZaDuYsb; Tue,  9 Aug 2022 11:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F2D81A46;
	Tue,  9 Aug 2022 11:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F2D81A46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7498C1BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B1384109E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B1384109E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nqu3Uxlmkd4F for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:47:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086E6408C6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 086E6408C6
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:47:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9C5CA60007;
 Tue,  9 Aug 2022 11:47:04 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:47:03 +0200
To: Alistair Francis <alistair@alistair23.me>
Message-ID: <20220809134703.05bfd118@windsurf>
In-Reply-To: <20220809113329.249779-1-alistair@alistair23.me>
References: <20220809113329.249779-1-alistair@alistair23.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660045625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQuITm9brAYH1+z/u/Ig1RBqP6ufQhZbMSYsjVex1+s=;
 b=myFS54NGtnRRXjdU4uiHRnrODpU0AGg2VbIEVqXI8ZRukuB4PY1R964l9X8A+n22di6AWc
 8rOzuIWcMjC6Tj+yb3XmCyn6AEirETSXpyoWbVu8rB+Z7T55rQTH1VkBLX92GiqE9YsO0d
 o3AvFtlDLqiPjDQrHENaBNSn7R87FcGtZxt0EEU6JZ479Mai2k8N1I4NHDc8YQb5zGMORP
 DrcRrtSHyqoIy7UmNu6mAhjKE15BOBm89Sc3YxMYrQW/dLIQAYkSwwQdrBGDpxadKqoEq1
 v5wjfOei0CjQj0NWewEciDXUMM2vP8YjM884uphLr42hy1eAmJ6keRkgQM/M7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=myFS54NG
Subject: Re: [Buildroot] [PATCH] pine64_sopine_defconfig: Use mainline ATF
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Francis,

On Tue,  9 Aug 2022 21:33:29 +1000
Alistair Francis <alistair@alistair23.me> wrote:

> Use the mainline ATF as it supports the Pine64 SoPine module.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  configs/pine64_sopine_defconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
> index 6fa511477c..2295c9338d 100644
> --- a/configs/pine64_sopine_defconfig
> +++ b/configs/pine64_sopine_defconfig
> @@ -7,10 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
>  
>  # Firmware
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y

Thanks a lot! However, could you adjust the patch to use a fixed
version of ATF, like is done for Linux or U-Boot in all our defconfigs?

Also, do you confirm this change was tested on hardware? Does it solve
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053812 ? If yes,
then could you include something like this in your commit log:

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053812

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
