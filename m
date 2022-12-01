Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3014AC43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 08:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B08F180C52;
	Thu,  1 Dec 2022 08:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B08F180C52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bBPL0u4m62x; Thu,  1 Dec 2022 08:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2C7180C1A;
	Thu,  1 Dec 2022 08:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2C7180C1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7769D1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 520ED80BE8
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 520ED80BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecaGOps8XxA6 for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 08:38:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B5A80B45
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4B5A80B45
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 08:38:31 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 343D2C000F;
 Thu,  1 Dec 2022 08:38:28 +0000 (UTC)
Date: Thu, 1 Dec 2022 09:38:26 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221201093826.38b70973@booty>
In-Reply-To: <CH2PR12MB5004F3E15B61D2B076B2B497F0129@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221126105350.14687-1-neal.frager@amd.com>
 <20221129115033.0fe9ae00@booty>
 <CH2PR12MB5004F3E15B61D2B076B2B497F0129@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669883909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xYdY3K+IhOMgF1fryhv9GBGMKwz8RpBRbjR3LSrTfIc=;
 b=FrIkuM4jymHND7nTBPQp418dnU0JmvsNZLRRzEEVhozpjdjGI3MhXsgRdsiOMsClz/gwjv
 sCQASfAIvzUK4IxeuiHtA1O2D/4LiPF+1t7MM1MQgR1X9wx4/GLAJZyiJrQ6NFQ1i8Kh0J
 chucq5yCWgPLl9rcPvtuhKm6M1dNstomNmFL7VOJycjIF4QndyFxaM1lw/iZxYmUIRO6mI
 2/w/0izX5oE4AD8eEK01hY/ImpRl0+ZKFECgcuyiw5srNlQnPCjvuZ38v6elhk7TD9zSc8
 FTb+eexMu+9DhwM3qnQNQRQFW5KPADw9FVm1djtX/x1CtbUlRLwZdOd8q5lgIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FrIkuM4j
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to Xilinx 2022.2
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "O'Neal, Terry" <terry.oneal@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Nov 2022 11:11:35 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Luca,
> 
> > This patch bumps the zynqmp_zcu102_defconfig to Xilinx release 2022.2.
> > 
> > Xilinx 2022.2 includes:
> > - U-Boot 2022.01 bug fixes
> > - Linux bump to Linux 5.15.36 with bug fixes
> > - TF-A 2.6 bug fixes
> > - PMUFW bug fixes
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> >  configs/zynqmp_zcu102_defconfig | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/configs/zynqmp_zcu102_defconfig 
> > b/configs/zynqmp_zcu102_defconfig index e27dfdb6c9..6047d4299c 100644
> > --- a/configs/zynqmp_zcu102_defconfig
> > +++ b/configs/zynqmp_zcu102_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> > @@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y  # 
> > BR2_TARGET_ROOTFS_TAR is not set  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y  
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> >  BR2_TARGET_UBOOT=y
> >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> >  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> > -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
> > +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
> >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> >  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
> >  BR2_TARGET_UBOOT_NEEDS_DTC=y
> > @@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y  
> > BR2_TARGET_UBOOT_SPL=y  BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> >  BR2_TARGET_UBOOT_ZYNQMP=y
> > -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/v2022.1_22.04_1/xlnx-firmware/zcu102/zcu102_pmufw.elf"
> > +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.2/zcu102/zcu102_pmufw.elf"  
> 
> > It would be nice to stay on Xilinx official firmwares, but there seem
> > to be no 2022.2 firmwares now on the Xilinx repo after Vivado 2022.2
> > has been released more than 1 month ago.  
> 
> I completely agree.  I am in an ongoing discussion within AMD regarding these firmware binaries, and my hope is that an official location will be maintained starting with 2023.1.
> The firmware repo will cover both zynqmp and versal families.
> 
> Once the official location is available, I will be moving the buildroot zynqmp and versal support over to the Xilinx github and deprecating my github.
> 
> > One option would be to keep on using a 2022.1 pmufw and upgrade the
> > other components. Do you think that would work? I think nowadays the
> > interface provided by the PMUFW is quite stable, isn't it?  
> 
> Yes, we can do this as a temporary solution for the zcu102 and zcu106.  The 2022.1 pmufw does work with the other 2022.2 images.

Well, I think it's fine after all. Hoping it get solved soon on the
Xilinx side...

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
