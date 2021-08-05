Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936E3C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:51:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282AF610FD
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 282AF610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF12960AA7;
	Thu,  5 Aug 2021 20:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Wl9TXKQ8HyU; Thu,  5 Aug 2021 20:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ACED60A79;
	Thu,  5 Aug 2021 20:51:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9857B1BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8592140697
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KDi-7HaeNQU for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 520004066A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:51:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 68CFB240004;
 Thu,  5 Aug 2021 20:51:03 +0000 (UTC)
Date: Thu, 5 Aug 2021 22:51:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gary Bisson <bisson.gary@gmail.com>
Message-ID: <20210805225102.0108f2ac@windsurf>
In-Reply-To: <20200210155801.GB335587@p1g2.work>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-2-tuzakli.refik@gmail.com>
 <20200210155801.GB335587@p1g2.work>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/7] package/freescale-imx/imx-dpu-g2d:
 new package imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series
 instead of imx-vpu or imx-vpu-hantro.With this commit,
 imx-dpu-g2d is added and is enabled for i.MX 8X.
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Gary,

On Mon, 10 Feb 2020 16:58:01 +0100
Gary Bisson <bisson.gary@gmail.com> wrote:

> Sorry but I disagree with the title/log of this commit.
> 
> This has nothing to do with vpu, it's all about g2d which is NXP
> interface for 2D graphics operations (CSC, rotation etc).
> 
> On most platforms (like i.MX6 for instance) there is a 3D GPU and a 2D
> GPU, so for those Vivante package was providing the libg2d libraries
> that leveraged the 2D GPU.
> 
> Now on newer platform such as i.MX8X, there's no 2D GPU but the display
> IP (here called DPU) can perform the 2D operations so another package
> was created.
> 
> Here is where the selection is made in Yocto:
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/conf/machine/include/imx-base.inc?h=warrior-4.19.35-1.1.0#n222
> 
> So my opinion is that, like Yocto, we should create a virtual g2d
> package that either be populated by Vivante libs by the platforms that
> have 2D GPU or by DPU on others.

Thanks for the explanation, but I do have a number of questions
following this. Right now the imx-gpu-g2d package is included with:

if BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
source "package/freescale-imx/imx-gpu-g2d/Config.in"
...
endif

So it means it's visible and accessible to all those platforms:

config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
        bool
        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X

But you're saying that imx-gpu-g2d only applies to i.MX6. So it seams
like we would in fact need a BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU_G2D,
like:

config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU_G2D
        bool
        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S

And make imx-gpu-g2d only visible on these ?

Could you clarify exactly the list of i.MX6/i.MX7/i.MX8 variants on
which imx-gpu-g2d makes sense, and on which imx-dpu-g2d makes sense ?

In Yocto they have this odd:

MACHINEOVERRIDES_EXTENDER_mx25   = "use-mainline-bsp"
MACHINEOVERRIDES_EXTENDER_mx6q   = "imxfbdev:imxipu:imxvpu:imxgpu:imxgpu2d:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx6dl  = "imxfbdev:imxpxp:imxipu:imxvpu:imxgpu:imxgpu2d:imxgpu3d:imxepdc"
MACHINEOVERRIDES_EXTENDER_mx6sx  = "imxfbdev:imxpxp:imxgpu:imxgpu2d:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx6sl  = "imxfbdev:imxpxp:imxgpu:imxgpu2d:imxepdc"
MACHINEOVERRIDES_EXTENDER_mx6sll = "imxfbdev:imxpxp:imxepdc"
MACHINEOVERRIDES_EXTENDER_mx6ul  = "imxfbdev:imxpxp"
MACHINEOVERRIDES_EXTENDER_mx6ull = "imxfbdev:imxpxp:imxepdc"
MACHINEOVERRIDES_EXTENDER_mx6ulz = "imxfbdev:imxpxp:imxepdc"
MACHINEOVERRIDES_EXTENDER_mx7d   = "imxfbdev:imxpxp:imxepdc"
MACHINEOVERRIDES_EXTENDER_mx7ulp = "imxfbdev:imxpxp:imxgpu:imxgpu2d:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx8qm  = "imxdrm:imxdpu:imxgpu:imxgpu2d:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx8mm  = "imxdrm:imxvpu:imxgpu:imxgpu2d:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx8mn  = "imxdrm:imxgpu:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx8mp  = "imxdrm:imxvpu:imxgpu:imxgpu2d:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx8mq  = "imxdrm:imxvpu:imxgpu:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx8qxp = "imxdrm:imxdpu:imxgpu:imxgpu2d:imxgpu3d"
MACHINEOVERRIDES_EXTENDER_mx8dxl = "imxfbdev"

But I can't really make much sense out of this.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
