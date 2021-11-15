Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989E9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:50:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F39F3610CA
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F39F3610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BB324017E;
	Mon, 15 Nov 2021 15:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcOMA0AwDb4z; Mon, 15 Nov 2021 15:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEC0440178;
	Mon, 15 Nov 2021 15:50:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CBC41BF3BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C4C4605F1
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AmJVzOQ8BPrK for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 15:50:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A59E605E4
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:50:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1570C10000B;
 Mon, 15 Nov 2021 15:50:44 +0000 (UTC)
Date: Mon, 15 Nov 2021 16:50:44 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20211115165044.5a524d4b@windsurf>
In-Reply-To: <87r1bhl97g.fsf@tarshish>
References: <20211115133000.72041-1-kory.maincent@bootlin.com>
 <20211115133000.72041-2-kory.maincent@bootlin.com>
 <20211115153825.251bff20@windsurf> <87r1bhl97g.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/psplash: add support to missing
 configure options
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, phil.eichinger@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Nov 2021 17:37:49 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Thomas,
> 
> On Mon, Nov 15 2021, Thomas Petazzoni wrote:
> > On Mon, 15 Nov 2021 14:30:00 +0100
> > Kory Maincent <kory.maincent@bootlin.com> wrote:
> >  
> >> Add support to three configure options:
> >> --disable-startup-msg: Disable text banner output on startup
> >> --disable-progress-bar: Disable progress bar
> >> --enable-img-fullscreen: Enable the logo image in fullscreen mode
> >> 
> >> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> >> ---
> >>  package/psplash/.Config.in.swp | Bin 0 -> 12288 bytes  
> >
> > Are you sure we want this file in Buildroot ? :-)  
> 
> A file of this name is already in current master branch. Introduced in
> commit 70440e28c8eef ("package/python-pudb: bump to version 2021.1").

I was confused initially, I thought you said
package/psplash/.Config.in.swp already existed, but it's .Config.in.swp
in the python-pudb package. We definitely want to get rid of it, indeed.

As an Emacs user, should I also suggest to forbid the usage of vim? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
