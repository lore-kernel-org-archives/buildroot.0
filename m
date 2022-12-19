Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1820DC4167B
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 12:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91094403CC;
	Mon, 19 Dec 2022 12:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91094403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIaYUsIwc-I1; Mon, 19 Dec 2022 12:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E40940356;
	Mon, 19 Dec 2022 12:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E40940356
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0235D1BF267
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAB9460A8C
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB9460A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCMWLNMfsRR1 for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 12:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D96C60586
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D96C60586
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 12:36:29 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B36F5C000F;
 Mon, 19 Dec 2022 12:36:22 +0000 (UTC)
Date: Mon, 19 Dec 2022 13:36:20 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221219133620.396349dc@booty>
In-Reply-To: <CH2PR12MB50045ED2EDE0ABD845FC8D8CF0E29@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221207124855.1831-1-neal.frager@amd.com>
 <20221211180336.79ea5b05@windsurf>
 <CH2PR12MB5004CD2B62F990D72C7EDFFEF01E9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB50045ED2EDE0ABD845FC8D8CF0E29@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1671453384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goAF3D5WaZO/kd08bHYSzQVKNqpBK7PPTMydpkgRdhQ=;
 b=Pg08DnTLI54B3z22ED+cxwypbDdcXrx4GMye/KLa9G+vkBWkpQtJmXlGF51f/1jMJx9Su8
 Yg6/qcTe48P4fwKHsi+pS5fyjyyL5QUrs9XYFPBe1vFzUeiSNwUBRgdKoX2uN7BC9U2prI
 Hv3RIQPw5HCZqJz27KaA7NTwAVpMyA1VjdMd8RPi+v4sllYehRHd2Tn6B9PkAlS/EsRzq2
 J3Ia88Yvb+U4OQc2531kr49+P9mNCZpe7/w5oYHUF88R5Vaeg4umkW1ENrAsNQ8iNzDjQj
 +7IfAdAyWztlkQmszPhDlvgse/xT/VRVYa0Ait9pOxjTeThROsSgPyUYlepEGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pg08DnTL
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Dec 2022 13:47:29 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Thomas,
> 
> > And in fact, it seems this patch is also broken: there is no Device Tree named zynqmp-smk-k26-revA-sck-kv-g-revB.dts:  
> 
> > $ make zynqmp_kria_kv260_defconfig
> > $ make linux-patch
> > $ find output/build/linux-custom/ -name 'zynqmp-smk-k26-revA-sck-kv-g-revB.dts'  
> 
> > I have done a full build and run test on all of these patches you have been committing, including this one.  
> 
> In case my last message was not absolutely clear, the mistake I made when updating the zynqmp_kria_kv260_defconfig from Xilinx 2022.1 to 2022.2 was not handling the device tree name change.
> 
> 2022.1 used smk-k26-revA-sck-kv-g-revB.dtb
> https://github.com/Xilinx/linux-xlnx/blob/xlnx_rebase_v5.15_2022.1/arch/arm64/boot/dts/xilinx/Makefile
> smk-k26-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
> dtb-$(CONFIG_ARCH_ZYNQMP) += smk-k26-revA-sck-kv-g-revB.dtb
> 
> 2022.2 changed to zynqmp-smk-k26-revA-sck-kv-g-revB.dtb
> https://github.com/Xilinx/linux-xlnx/blob/xlnx_rebase_v5.15_2022.2/arch/arm64/boot/dts/xilinx/Makefile
> zynqmp-smk-k26-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
> dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revB.dtb
> 
> In both cases, the defconfig remains the default zynqmp xilinx_zynqmp_virt_defconfig which is used for all zynqmp builds.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
