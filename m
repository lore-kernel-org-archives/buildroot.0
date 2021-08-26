Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C664EC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 12:43:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23F2A6109E
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 12:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23F2A6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D7940218;
	Thu, 26 Aug 2021 12:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtaP0r6SX6oU; Thu, 26 Aug 2021 12:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9508A40356;
	Thu, 26 Aug 2021 12:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9EA21BF873
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 12:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5D3581C20
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 12:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4ex-V4rPncN for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 12:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67C6D81B71
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 12:43:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3DC022000C;
 Thu, 26 Aug 2021 12:43:31 +0000 (UTC)
Date: Thu, 26 Aug 2021 14:43:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <20210826144329.768936d7@windsurf>
In-Reply-To: <CAGm1_kuW=EYjpXAL3g2mZhBxh4tAyB8633D+49Wiwij8-JbspA@mail.gmail.com>
References: <20210825090243.30444-1-yegorslists@googlemail.com>
 <20210826002909.777698f8@windsurf>
 <CAGm1_kuW=EYjpXAL3g2mZhBxh4tAyB8633D+49Wiwij8-JbspA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/libqmi: bump to version 1.30.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Yegor,

On Thu, 26 Aug 2021 06:01:07 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> > Are you sure it is still fixing this issue ? I already made the same
> > comment on v2, pointing other commits that fixed gobject-introspection
> > issues.  
> 
> OK. I'll remove this comment. Though in the context of the next
> branch, it really fixes the compilation issue. The general fix is only
> in the master branch. libqrtr-glib still fails in the next branch.

Everything that is in the master branch will appear in the next branch,
either when if we merge master into next, or when 2021.08 is released
and we merge next back into master, and kill the next branch.

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
