Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0739DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB14A40354;
	Tue, 22 Nov 2022 21:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB14A40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8jwQxzPBzUv; Tue, 22 Nov 2022 21:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC68E40147;
	Tue, 22 Nov 2022 21:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC68E40147
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 878D01BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C4F040147
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C4F040147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0p47Fal1DvF for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:31:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D174012F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46D174012F
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:31:30 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 464F640002;
 Tue, 22 Nov 2022 21:31:27 +0000 (UTC)
Date: Tue, 22 Nov 2022 22:31:25 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221122223125.33045c23@booty>
In-Reply-To: <20221122214713.1359fcac@windsurf>
References: <20221122053611.44757-1-neal.frager@amd.com>
 <20221122100124.3a441eb7@booty>
 <CH2PR12MB5004DF92B82E671197A06306F00D9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20221122171315.7a749d61@windsurf> <20221122190743.2610e8e9@booty>
 <20221122214713.1359fcac@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669152687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJSeNMLaPCoFh7QM2+E28vqKfsB6HXZAw+pT93KfUuY=;
 b=WiLsQ0eqixreBjViMFWgKCWF1DGPn5tLULsRoAoqcclots4OjZkGEDBfCD/h1fwkfhj97D
 w1X+QT97CXR4q7q1jFDA5R8G5+emxNJo5GVnDHSOBplUiocEF3TeyTXQ+XVXnrfdgg2RUL
 w+wbFQCIXPCs6ICwDozJZeJ3Zj0BzlzxTsCbWjhLPZvH1UrXyLeO1+j7kTlZfS4tUz+VsQ
 5QmFeKatBc2A1NjOn/3mAtglEjcAxdBXWz1+06jmG25PGpTNX+JSzO+DjVmTkYbijJhTbh
 eJXDevjkBc10Jd3XEzvCNXN6VraLAPq42OmTLk4is14yt6n6IVQZzBdv3wYkfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WiLsQ0eq
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add stripped
 u-boot.elf support
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
Cc: "Frager, Neal" <neal.frager@amd.com>, "Frager,
 Neal via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Neal,

On Tue, 22 Nov 2022 21:47:13 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue, 22 Nov 2022 19:07:43 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
> > I agree with the principle you are proposing.
> > 
> > However, according to the U-Boot source code, u-boot.elf appears as
> > u-boot.bin repackaged into an ELF file. Is "stripped" a correct word
> > for this?  
> 
> I used "stripped" because that's how Neal described this file.
> 
> Based on what you say, perhaps a better option name is:
> 
> BR2_TARGET_UBOOT_FORMAT_BIN_ELF
> 	bool "u-boot.elf"
> 
> Thoughts?

Seems better.

Neal, adding a short help text would also be useful IMO, as this "bin
elf" Frankenstein creation is really non intuitive.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
