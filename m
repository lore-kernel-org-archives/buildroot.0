Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1796CC433FE
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 13:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 542D861152
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 13:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 542D861152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F068C81A15;
	Thu, 11 Nov 2021 13:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfXyrig3RHJY; Thu, 11 Nov 2021 13:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44160818EC;
	Thu, 11 Nov 2021 13:55:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B55781BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 13:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C296C606ED
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 13:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50JPHwjx4Dma for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 13:55:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92E7460731
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 13:55:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9FDFE1BF207;
 Thu, 11 Nov 2021 13:55:11 +0000 (UTC)
Date: Thu, 11 Nov 2021 14:55:10 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211111145510.57fc4222@windsurf>
In-Reply-To: <20211111101556.GC2504300@scaer>
References: <20211109220328.388872-1-romain.naour@gmail.com>
 <20211111082548.GA2504300@scaer> <20211111110225.50c73fd9@windsurf>
 <20211111101556.GC2504300@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 RFC] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 11 Nov 2021 11:15:56 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > I hadn't had the chance to chime in on this one,  
> 
> Sorry, I could have waited a bit more indeed...

No, no, I think it's good that code gets reviewed and merged quickly.
We can't wait on every patch for everyone's opinion, otherwise the
project wouldn't move at all. So I really have absolutely nothing
against the fact of merging patches quickly.

> Again, agreed on principle.
> 
> But as Romain explained, that creates too much jobs when a tag is cut,
> so much so that a lot of them do not even stand a chance to even start.
> 
> In that case, the CI is not usefull at all either.
> 
> On the other hand, the defconfigs are already built reasonably often,
> every week, with a scheduled pipeline. It is thus pretty quick to notice
> a build failure.

True.

> So, my opinion is that I prefer a partial CI that is stable and
> dependable, where each failure is an actual failure, rather than a
> full-range CI that has a very low SNR, where people eventually stop
> caring about failure reports because they are often spurious failures.
> 
> Of course, we can reverse course on that commit; after all, that's what
> git-revert is for! ;-)
> 
> The better course of action, obviously, would be to have an infra that
> is strong enough to absorb all that load when we push a tag, but that's
> an order of magnitude more complex to achieve.

Indeed, I think we both agree that we should ideally be able to build
defconfigs every time a tag is pushed, and it's only a
practical/pragmatic reason that leads us to not do that. Fair enough.

> One thing, though: maybe some of the runners could be configured to
> accept more jobs at once, so even if each job then takes longer to run,
> we start them faster and thus do not hit the 24-hour blockage limit.

Things get really really slow if you build too many jobs in parallel,
as the runners start swapping like crazy.

So all in all, I'd say Romain's patch is OK, even though I wish we
could do better. That being said, when the tag is pushed it's a bit too
"late" to fixup defconfigs: they should ideally build properly *before*
a tag is created/pushed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
