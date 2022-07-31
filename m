Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ACFC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 08:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DFDA60E67;
	Sun, 31 Jul 2022 08:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DFDA60E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p60bnzhb5dSt; Sun, 31 Jul 2022 08:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B19560E42;
	Sun, 31 Jul 2022 08:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B19560E42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5561BF395
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 08:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C3F403EA
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 08:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8C3F403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lj1JUEjahKp1 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 08:30:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8A2B4057C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8A2B4057C
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 08:30:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A15ED60005;
 Sun, 31 Jul 2022 08:30:03 +0000 (UTC)
Date: Sun, 31 Jul 2022 10:30:02 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220731103002.6cf358cf@windsurf>
In-Reply-To: <3a3b2627-666f-a41b-a400-5e6d2671ff9c@benettiengineering.com>
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-4-x-shi@ti.com>
 <3a3b2627-666f-a41b-a400-5e6d2671ff9c@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659256204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM14CIFFhUF+EUdaAT9dS508e/QKr22uNbmuaWm+Zh4=;
 b=kzs5Ps8rJV9U65mAc3Ncz+efuV0sd59P5CgcbOmyalAG7irsKbYou6zjEjlgp2ZApLPyBe
 KOa6idDEPXY6ZjajeFt0oVl0MXNv2N3Lg82YGTRNZesNT0knKMeUAoMyfxYQxK/S/Ov+LE
 1Br/S8xN+U24eY8WVO6aw0SV/K86AeaStvhROtEmZqlCwvMDsyuIvmgug3ptKAqN2Q9v88
 ObmxxhzMypUwj0VFdEZf/mtKLPLfUAqs7LatUsgrSSc+miihLrFf1fTdND7uAvLKQI8Pbj
 gmbfz9g8I89LlmbFnZvwEMGiLQB3APCLfndmeeB1ofGe/Kn9re/ZBbyRebUJuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kzs5Ps8r
Subject: Re: [Buildroot] [PATCH v2 3/4] boot/ti-k3-image-gen: add new package
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
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <x-shi@ti.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 31 Jul 2022 03:04:28 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
> > +	string "SOC type for image gen"
> > +	depends on BR2_TARGET_TI_K3_IMAGE_GEN
> > +	help
> > +	  The target SoC option for image gen.
> > +	  For example, "am64x" for AM64X boards.  
> 
> As in previous patch I would add a "choice" instead of a "config"

As explained on a previous patch, it's fine to keep a free-form string
here.

> > +config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG
> > +	string "CONFIG type for image gen"
> > +	depends on BR2_TARGET_TI_K3_IMAGE_GEN
> > +	help
> > +	  The board config option for image gen.
> > +	  Usually "sk" or "evm".  
> 
> Ditto

And here (and especially here actually, we clearly don't want to have
an explicit list of all boards in Buildroot, it means that people
creating their own boards wouldn't be able to use this package, as
their board would not be listed here).


> > +TI_K3_IMAGE_GEN_VERSION = 08.04.00.005
> > +TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
> > +TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
> > +TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
> > +TI_K3_IMAGE_GEN_LICENSE_FILES = system-firmware-image-gen-1.0-manifest.html
> > +TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
> > +TI_K3_IMAGE_GEN_DEPENDENCIES = host-arm-gnu-toolchain ti-k3-r5-loader  
> 
> host-arm-gnu-toolchain is already a dependency of ti-k3-r5-loader so
> it should be already built a this point

It seems that ti-k3-image-gen also uses this bare-metal toolchain
directly, so it's fine and correct to have this dependency.

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
