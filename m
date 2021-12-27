Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49279C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E845981AD7;
	Mon, 27 Dec 2021 14:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6Ky1CsS_rNw; Mon, 27 Dec 2021 14:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470B481A6A;
	Mon, 27 Dec 2021 14:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25D211BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 232D581765
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waUfk17Tq1Cj for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:43:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B86D4813EC
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:43:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B2D6C40006;
 Mon, 27 Dec 2021 14:43:37 +0000 (UTC)
Date: Mon, 27 Dec 2021 15:43:37 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211227154337.702d0de1@windsurf>
In-Reply-To: <20211219142035.6220-1-peter@korsgaard.com>
References: <20211219142035.6220-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2]
 board/orangepi/orangepi-r1/genimage.cfg: fix build after move to genimage
 15
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

On Sun, 19 Dec 2021 15:20:32 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935239
> 
> ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> 
> So change to partition-type-uuid instead.  With that fixed, genimage-15 then
> also complains about the overlap between the u-boot partition and the GPT:
> 
> ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
> 
> So adjust the u-boot partition to end just before the GPT.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/orangepi/orangepi-r1/genimage.cfg | 6 +++---
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
