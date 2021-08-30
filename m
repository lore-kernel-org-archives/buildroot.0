Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B336C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F78060F42
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 21:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F78060F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCC9B403A7;
	Mon, 30 Aug 2021 21:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIuj51FWOhDN; Mon, 30 Aug 2021 21:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE004038F;
	Mon, 30 Aug 2021 21:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9AD01BF86C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4B694038F
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 21:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1iUbwu0JgJk for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 21:56:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4294040117
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 21:56:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 415221C0005;
 Mon, 30 Aug 2021 21:55:59 +0000 (UTC)
Date: Mon, 30 Aug 2021 23:55:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20210830235559.795cf97f@windsurf>
In-Reply-To: <DM6PR04MB70813B0A7EC96D8CE9D4B79FE7CB9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
 <20210830233204.2d8dcfad@windsurf>
 <DM6PR04MB70813B0A7EC96D8CE9D4B79FE7CB9@DM6PR04MB7081.namprd04.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Damien,

On Mon, 30 Aug 2021 21:42:02 +0000
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> On 2021/08/31 6:32, Thomas Petazzoni wrote:
> > Hello Damien,
> > 
> > On Mon, 30 Aug 2021 13:40:51 +0900
> > Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >   
> >> Christoph Hellwig (2):
> >>   package/elf2flt: add RISC-V 64-bits support
> >>   package/Makefile.in: Fix NOMMU RISC-V 64-bits toolchain base name
> >>
> >> Damien Le Moal (7):
> >>   arch/config: Make RISC-V 64-bits MMU optional  
> > 
> > Just tested with the first 3 patches applied the following defconfig:
> > 
> > BR2_riscv=y
> > # BR2_USE_MMU is not set
> > 
> > It fails to build with:
> > 
> > /home/thomas/buildroot/buildroot/output/host/riscv64-buildroot-linux-uclibc/bin/elf2flt: Loading to RAM ('-r' option) 
> > is required  
> 
> Yes, this option is mandatory for rv64. The elf2flt patch checks for it, but
> only for rv64. Other architectures should not be affected.
> The following patch that adds the Sipeed MAIX bit board support adds that option
> to busybox build. So I guess that build option should be moved to this patch ?

I see:

+CONFIG_EXTRA_LDFLAGS="-Os -static -Wl,-elf2flt=-r"

in your Busybox configuration file indeed. But what about other
packages ?

If this is needed for all packages built for RISC-V 64-bit noMMU, then
we need to have it set as part of the toolchain wrapper. Actually, the
toolchain wrapper already passes -Wl,-elf2flt, so it would only have to
be tweaked to pass -Wl,-elf2flt=-r instead.

See:

#ifdef BR_BINFMT_FLAT
        "-Wl,-elf2flt",
#endif

in toolchain/toolchain-wrapper.c

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
