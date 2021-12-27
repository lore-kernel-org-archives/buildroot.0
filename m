Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5F2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D44C281A92;
	Mon, 27 Dec 2021 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYOfXPRP0txb; Mon, 27 Dec 2021 20:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB65881A65;
	Mon, 27 Dec 2021 20:06:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9B41BF3C6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0639481A8E
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FYhz-zOuzG8 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:06:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F28E281A65
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:06:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id EC57060006;
 Mon, 27 Dec 2021 20:05:59 +0000 (UTC)
Date: Mon, 27 Dec 2021 21:05:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20211227210559.7169afc0@windsurf>
In-Reply-To: <20211227173430.1007471-1-geomatsi@gmail.com>
References: <20211227173430.1007471-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/orangepi/orangepi-pc-plus: fix build
 after genimage update
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 27 Dec 2021 20:34:30 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> 
> To fix the first genimage error report, change 'partition-type' entries
> to the appropriate 'partition-type-uuid'. Then genimage starts to
> complain about overlaps:
> 
> ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
> ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> 
> To fix the second genimage error report, update the size of bootloader
> file. Do not reserve additional space for GPT partition table since
> new genimage is able to keep track of it.
> 
> Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006300
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  board/orangepi/orangepi-pc-plus/genimage.cfg | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
