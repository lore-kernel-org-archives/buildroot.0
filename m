Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F331C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F317B400E4;
	Mon,  3 Jan 2022 15:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id At0Uf5p1avUM; Mon,  3 Jan 2022 15:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED3A04011B;
	Mon,  3 Jan 2022 15:25:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5280B1BF2FF
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 15:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41C714028D
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 15:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPvEPunoDrA6 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 15:25:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A12F40275
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 15:25:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A13C460011;
 Mon,  3 Jan 2022 15:25:21 +0000 (UTC)
Date: Mon, 3 Jan 2022 16:25:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20220103162520.07b40bf0@windsurf>
In-Reply-To: <ba60fa7b8380ce6c817bb5bb2ada0283752efdfe.camel@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
 <20211230212742.030be8c5@windsurf>
 <ba60fa7b8380ce6c817bb5bb2ada0283752efdfe.camel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
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
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Damien,

On Fri, 31 Dec 2021 00:39:14 +0000
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> My apologies about the delay. I have been swamped with the kernel and other
> projects. I kept at this a little though, mainly trying to address the elf2flt
> issue which seems to generate unworkable binaries for Peter, while it is always
> working for me... Really no clue what is going on so I am a little stuck with
> that. I will work on updates addressing all of Peter's comments and see how
> that work.

No worries about the delay. I took advantage of the Christmas/New Year
quiet period to help catch up with our patch backlog, and stumbled
across your patch series, which is why I asked.

I also saw the on-going discussion with Peter who had issues with
non-working binaries produced by elf2flt.

> >  - The readme.txt file for each defconfig should be added in the patch
> >    adding the defconfig  
> 
> Hmm... It is the same procedure for all boards, only the defconfig name
> differs. Hence I added this README file last with all board defconfigs
> mentioned. I can add the README file with the first board and update it with
> each patch adding a board ?

Yes, that would work: add the README file with the first board, and
update it progressively for each board.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
