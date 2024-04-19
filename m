Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E07C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 07:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 531FB60820;
	Fri, 19 Apr 2024 07:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x65Bty8DBAhD; Fri, 19 Apr 2024 07:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6666B605F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6666B605F7;
	Fri, 19 Apr 2024 07:27:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E192A1BF30A
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 07:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE4BA605F7
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 07:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ml5z7iVkVs5A for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 07:27:44 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 286B1605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286B1605A3
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 286B1605A3
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 07:27:43 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 8CA24BDE56DB;
 Fri, 19 Apr 2024 09:19:49 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 19 Apr 2024 07:19:48 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: DTrustee <dterry_engineer@yahoo.com>
In-Reply-To: <mailman.11662.1713460186.13795.buildroot@buildroot.org>
References: <mailman.11662.1713460186.13795.buildroot@buildroot.org>
Message-ID: <920906cf5c634525148a8a7507ace73c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1713511189; bh=V3jWmXtMJI/+Z80v0mww9uRjHznyYizHBjIqxzwDR7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QmsvU3hD4UymPAvSy80WLAri/j2vgTgJ127iQfByJXt4zGATx4OD/V2mZPYpRseY2
 McNa/E2HdK2vd2/nHul1k13eI80Mmr+8SRjpfo4Ssa+6A/xojdVu98hhn2dJERAJLM
 h+3JMRi7w3Uy3KAlvx6rU/J1xYKyDd+nhF6Tc5ig=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=QmsvU3hD
Subject: Re: [Buildroot] Problem with device tree
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Andrea Calabrese <andrea.calabrese@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Don,

You use a (recent) mainline kernel with configurations that seem to be 
vendor specific; your U-Boot is not configured correctly; see comments 
below.

I found a more detailed training document, it uses 6.1.y kernel: 
https://bootlin.com/doc/training/embedded-linux-bbb/embedded-linux-bbb-labs.pdf


On 2024-04-17 14:28, DTrustee wrote:

> Message: 16
> Date: Wed, 17 Apr 2024 14:28:51 -0500
> From: DTrustee <dterry_engineer@yahoo.com>
> To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
> Cc: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>, Giulio
> 	Benetti <giulio.benetti@benettiengineering.com>,
> 	buildroot@buildroot.org, Thomas Petazzoni
> 	<thomas.petazzoni@bootlin.com>
> Subject: Re: [Buildroot] Problem with device tree
> Message-ID: <fc9d4069-9bbd-4f1b-8b40-939f16147f93@yahoo.com>
> Content-Type: text/plain; charset=UTF-8; format=flowed
> 
> My apologies, I tried using omap2plus_defconfig as the tutorial
> suggested but got errors so I changed and the output I put in pastebin
> is using beagleboard_defconfig. I still get errors though.

This is an excerpt from your (buildroot) defconfig:

> BR2_LINUX_KERNEL_DEFCONFIG="beaglebone_defconfig"
                               ^^^
This defconfig does not exist in the mainline kernel. Either supply the 
missing file, or use the architecture default.

> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="https://elixir.bootlin.com/linux/v6.6/source/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts"

This must be an in-tree name, not a download from the internet. 
'ti/omap/am335x-boneblack.dts' should goe here.

> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="arch/arm/boot/dts/ti/omap/am335x-boneblack.dts"

Not needed, delete this

> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
> BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="/home/don/buildroot/buildroot-2024.02.1/configs/beaglebone_defconfig"

This is a buildroot defconfig, U-Boot cannot use it. Buildroot uses 
(in-tree) TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm" for the Beaglebone.

> Have a Blessed day!
> 
> Don

Kind regards,
Andreas

<cut>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
