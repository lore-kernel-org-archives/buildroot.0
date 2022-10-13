Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D46C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 06:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0892B83E92;
	Thu, 13 Oct 2022 06:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0892B83E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xa70sL1HsjBA; Thu, 13 Oct 2022 06:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3291683E89;
	Thu, 13 Oct 2022 06:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3291683E89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA3E1BF86D
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA4161117
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA4161117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vw2kswKzy7_F for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 06:39:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0865D610BA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0865D610BA
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 06:39:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 635CF1C0003;
 Thu, 13 Oct 2022 06:38:57 +0000 (UTC)
Date: Thu, 13 Oct 2022 08:38:56 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221013083856.4624e7c6@windsurf>
In-Reply-To: <DM6PR12MB50075AD3D83E1AF519324C86F0259@DM6PR12MB5007.namprd12.prod.outlook.com>
References: <20221012175426.32367-1-neal.frager@amd.com>
 <20221012223315.68f43720@windsurf>
 <DM6PR12MB50075AD3D83E1AF519324C86F0259@DM6PR12MB5007.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665643138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOdeI0vey/yC1Weh+S9otNe6LOfthfZNoppLdy8ERAU=;
 b=exuAsAfwBiFysS1Jy2YFBXLvojgeOrG/IDF4z28+NIMzRNOtbY98c0xDAiFxp7S3ofGnkt
 CO+5gNVUOJmo/FF+0tQ+ZvRbKK5W8241p1GpPa09ngmg36n2+aFmIuu4sknhrxVm+LZQTE
 HyxFrfU0fI2UbBcryIEgBTriADrRR+qnRBkwfUDEeT4G8+k4kj1LF2583bPUqr43SqlXe4
 +t3OWGDTIu/P9pHU3bOMOGe8AEKW9OWx+dxzmQL9HCo/hxD1LWd9+DU8fBBg0mrXZPKNhf
 oIZMXDFes6J8p7utLW6g4traiFhLO/cvZnpX0zJaca4wKmCtsCRontJNcqa5YQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=exuAsAfw
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Oct 2022 05:57:23 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> > +UBOOT_ZYNQMP_PMUFW_BASENAME=$(basename $(UBOOT_ZYNQMP_PMUFW_PATH)) 
> > +UBOOT_ZYNQMP_PMUFW_SUFFIX=$(suffix $(UBOOT_ZYNQMP_PMUFW_PATH))  
> 
> > Spaces around = sign.  
> 
> I will take out the unnecessary spaces.

It is the opposite: you need to add spaces around the = signs.

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
