Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97731C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23F4842CE4;
	Tue, 31 Oct 2023 12:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F4842CE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYZC9PfiTKYM; Tue, 31 Oct 2023 12:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E74542CE5;
	Tue, 31 Oct 2023 12:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E74542CE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4B5B1BF30E
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0FE283A80
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0FE283A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnwvK7V7oHsK for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:34:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EB0E8399E
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB0E8399E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FA51240009;
 Tue, 31 Oct 2023 12:34:15 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:34:15 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231031133415.1d89db5a@windsurf>
In-Reply-To: <CH2PR12MB50042DEEED0FC5E7D3BBCA99F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231018111357.2898095-1-neal.frager@amd.com>
 <20231031121222.1dfa4035@booty>
 <CH2PR12MB50042DEEED0FC5E7D3BBCA99F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698755656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzKkx9NS04OyEWxaRniEMo+Ein5LX35yMgQQFaFIJhI=;
 b=G8K/L4Kf4s23ELJzOsnV/VwKoJyZs9GkC5inkMaEvX4J8kzo/4Y3aFWqUZJZXZipqV3mBe
 xYnVnGt3gf5Hq0JrM+RMdq95hOUNYLjMFJpCH+qFQXVF7fY4/1crLukpTU+o5RvjF524lz
 mNRi/zwrFfzFY8nE0ujpfC0DRc7Puop/59FDiL274DYHZWixuIly2t7nKKj06uacNXMHF3
 stltNMX3rObNjd6NVJj8ytNA3P2wjW1ZR2cNdBya24SH4wpd72xb3lVNNR2zS7gSav5Xl3
 Dd10OX7ydlmShPbzQtWYUoxzr6Sn0+MhEKUWGHkV3qdF5bW1S8Mv6XpZwSnhhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G8K/L4Kf
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 31 Oct 2023 12:12:47 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I do understand your point.  From this perspective, we can say the
> same thing about the zynq_zed_defconfig and the
> zynq_microzed_defconfig as well.  For all 4 of these zynq boards, the
> DTS definition is all that changes from one defconfig to another.
> And in all 4 cases, the only differences in the dts files are things
> like gpio LEDs, switches and whether or not there is a CAN peripheral
> on board.  So you could potentially boot the same images across these
> boards.  You would just lose a peripheral or two that is included in
> one dts file but not another.

I think the discussion is not being specific enough here, so let me
provide some more background.

If the only differences between the zc706 and zc702 defconfigs is the
Linux kernel Device Tree (and I insist on Linux kernel Device Tree, not
Device Tree for the bootloaders/firmware), then you can have a single
configuration that builds multiple Device Trees, and the bootloader
selects the right one depending on which board we're booting on. This
is exactly what happens in beaglebone_defconfig:

BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"

We build multiple Linux kernel Device Trees, and the U-Boot bootloader
detects which board we boot on, and selects the right Device Tree.

If you are in this situation, then yes we want a single defconfig.

However, if the bootloader needs to be different on ZCU702 vs ZCU706,
and this difference is not detected at boot-time/run-time, but is
handled as a different build-time configuration, then you have no other
choice but to have 2 separate defconfigs.

Now I see this:

+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc702"

in the ZCU702 defconfig, vs.

BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc706"

Which means you need to have a different build-time configuration of
U-Boot, and therefore it's not possible to support both platforms in
the same Buildroot defconfig.

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
