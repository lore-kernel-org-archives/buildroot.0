Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB63C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E0741528;
	Mon,  5 Feb 2024 21:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E0741528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cqm9eJyEwNwM; Mon,  5 Feb 2024 21:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29FB41522;
	Mon,  5 Feb 2024 21:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29FB41522
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6669E1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FA2181F81
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA2181F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dse1LjWpo_tb for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:54:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 364A381F5B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364A381F5B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 842BEC0003;
 Mon,  5 Feb 2024 21:54:11 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:54:10 +0100
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>
Message-ID: <20240205225410.0f1c7e14@windsurf>
In-Reply-To: <20240129211248.541383-1-tekieli.lukasz@gmail.com>
References: <20240129211248.541383-1-tekieli.lukasz@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707170051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8ERSMq/0vZvnvRnlcCRtdaSegb9S9eICWgv8U9gS24=;
 b=kz3MPqj2WF1c7M+BTEQShMqA7v9cCnmf1k/LWeAvJWPgBpGilsjCDmudwpQFJzc/by7mbg
 mdfSse4L2SASBuqhlqARu7xy/CTlx5bjrhHSX9HzY5q0mYTv+BNU8FAeEt0alebJzO2Vn4
 4zjvHzrZ3F47bM5xWS4f/P3KyIe4skp6tMSFxRm0td1w9zbvUOPmH//mudIC6EPL6NwFis
 QvAYbO9OQ3dIQwgFc+A5ryFP/3i+dgeM2xBPp5gWC8YoWgfhqwhZd6HlPieZDjWQYPuc0H
 68+loMgUyoM+OaXRKWEScaEdNtdbK2AbnDgm33g53g0FkLtCnMdpVwExURn4WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kz3MPqj2
Subject: Re: [Buildroot] [PATCH 1/1] board/visionfive2: enable u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Lukasz,

Thanks for the contribution! I have some comments below.

On Mon, 29 Jan 2024 22:12:48 +0100
Lukasz Tekieli <tekieli.lukasz@gmail.com> wrote:

> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"

I think this should technically go into a separate commit, it looks
like a "bug" in the original visionfive2_defconfig. Of course, today it
doesn't cause any harm because the genimage.cfg files for visionfive
and visionfive2 are the same, but this modification really isn't
related to enabling U-Boot.

>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
> @@ -15,4 +15,18 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_OPENSBI=y

You need to set an explicit version for OpenSBI. Indeed, we want our
defconfigs to use a fixed version of bootloader/firmware/Linux kernel
code.

> +BR2_TARGET_OPENSBI_PLAT="generic"
> +# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
> +BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
> +BR2_TARGET_UBOOT=y

Same comment for U-Boot: it should use a fixed version.

Could you look into these small improvements, and send an updated
version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
