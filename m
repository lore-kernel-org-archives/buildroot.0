Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D145C04A6A
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E9A3834CB;
	Wed,  9 Aug 2023 15:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9A3834CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBx9lZERnWeP; Wed,  9 Aug 2023 15:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A84EF834B9;
	Wed,  9 Aug 2023 15:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84EF834B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07BF11BF471
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 15:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4FAB403BF
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 15:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4FAB403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FpvcnZCqKwGi for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 15:02:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BEB04031E
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 15:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BEB04031E
Received: by mail.gandi.net (Postfix) with ESMTPSA id E436760005;
 Wed,  9 Aug 2023 15:02:31 +0000 (UTC)
Date: Wed, 9 Aug 2023 17:02:30 +0200
To: <Jamie.Gibbons@microchip.com>
Message-ID: <20230809170230.59759159@windsurf>
In-Reply-To: <40906858eaa11edb306b0f56e425d7b13948e0b9.camel@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-3-jamie.gibbons@microchip.com>
 <20230808235919.0002f19d@windsurf>
 <40906858eaa11edb306b0f56e425d7b13948e0b9.camel@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691593352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gv7q2ixkdY5A7uX5EnKTcXEjcg44pJINDafJYjGHfL8=;
 b=RY9hT2doiMnWn+GbrWsXaYVrAdpDiKuNgExBGYZc43ZHnyjUGNgt8i+Kjz+DWtToCTA7t7
 6XVUewrMQ4T2DdCKQhHXjmcpjpSFJojAYVD8Y9AiVna6uZkHq1agHCOkOfdgZNgLhvjUOA
 kuEcrwq+VMRmMxnxp/AfHOwyiissP2eXoCiNyN7SJKXWh284WmqvirzXi4oALhtRInstTm
 hDLjCxrJJnibm5nBOS5Brish28He8fHGe3f/oaPzWyc8WxlJIDB6FNZu4TMV+okzM6s3IN
 k91GLrcG4wEgI24R+IagBv36Om9oZQ5KRF8VfNwIfhT7Q2UnBva78sD03enSVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RY9hT2do
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
Cc: Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
 Conor.Dooley@microchip.com, buildroot@buildroot.org,
 Valentina.FernandezAlanis@microchip.com, giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Wed, 9 Aug 2023 14:43:19 +0000
<Jamie.Gibbons@microchip.com> wrote:

> > Could you clarify what this "embedded in a Hart Software Services
> > payload" means? Does it mean that there is additional code running on
> > the target other than U-Boot, Linux and user-space? I don't see
> > OpenSBI
> > being compiled in this defconfig.
> > 
> > I'd like to make sure we have properly captured all the code that
> > ends
> > up running on the target, so that we are complete from a licensing
> > stand-point.
> >   
> The HSS (Hart Software Services) acts as a zero-stage bootloader on the
> Icicle kit.

Where is this HSS code located? Is it build by Buildroot, or it is part
of some kind of ROM code burned into the SoC?

> The HSS reads an HSS formatted payload from eMMC/SD that
> contains binary images (e.g. U-boot) to be booted via OpenSBI. The HSS
> includes OpenSBI so we don't need to enable OpenSBI in the buildroot
> defconfig.

Who is building the OpenSBI code?

Again, my concern is to make sure that we have properly captured the
licensing of all software components built by Buildroot and that we're
providing the relevant source code matching the software components
that are built by Buildroot.

Right now, it is clear that your defconfig is building U-Boot + Linux +
rootfs, but it isn't clear where the HSS code and OpenSBI code comes
from, and who builds it.

> > So you're not a riscv_g core because you don't have the atomic
> > extension?  
> We have selected riscv_custom because we have compressed instructions
> extension (RVC) which is not part of riscv_g.
> 
> While looking into that we noticed that we don't have
> BR2_RISCV_ISA_CUSTOM_RVA in our defconfig which we need to add, this
> was because BR2_RISCV_ISA_CUSTOM_RVA was selected in previous versions
> of buildroot using riscv_custom, and now it isn't.
> 
> I can send a patch to add BR2_RISCV_ISA_CUSTOM_RVA?

Yes.

I am wondering if we also don't need to move the following options:

config BR2_RISCV_ISA_CUSTOM_RVC
	bool "Compressed Instructions (C)"
	select BR2_RISCV_ISA_RVC

config BR2_RISCV_ISA_CUSTOM_RVV
	bool "Vector Instructions (V)"
	select BR2_RISCV_ISA_RVV
	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12

to be available/visible even when BR2_riscv_g is selected.

Indeed to me riscv_g implies IMAFD, but you can have IMAFD + C or IMAFD
+ V, so it should be possible to say "I have a RISC-V G core, which
  also supports those extra C and/or V extensions".

Does that make sense in the RISC-V world?

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
