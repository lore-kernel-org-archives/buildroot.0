Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F05C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A554660F13
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A554660F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452A8403B1;
	Sun, 25 Jul 2021 21:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSE1YU2r3_UD; Sun, 25 Jul 2021 21:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 886D2403AB;
	Sun, 25 Jul 2021 21:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 853591BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74769832C6
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ewx3ujnD6Wj for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:14:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49A5B82993
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:14:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C00B7200002;
 Sun, 25 Jul 2021 21:14:05 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:14:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210725231404.4ec6afdb@windsurf>
In-Reply-To: <YP3GPccSpJbFMAgv@pevik>
References: <YP3GPccSpJbFMAgv@pevik>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC] rpcbind: Remove
 0001-Remove-yellow-pages-support.patch
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Petr,

On Sun, 25 Jul 2021 22:14:53 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> I'm thinking about removing
> package/rpcbind/0001-Remove-yellow-pages-support.patch patch.
> 
> It was originally added in 2012 in 8bc245da21 ("rpcbind: new package").
> At the time constants YPBINDPROC_SETDOM, YPPROG, YPPASSWDPROG were missing in
> rpcbind (added in 2015 in rpcbind commit 9e0c7ac ("configure.ac: Check for rpcsvc/mount.h").
> 
> I'll verify it, but I'll strongly suspect the only problem was in these missing
> constants and very old libtirpc. Thus it should be working now.
> Probably the best approach would be to disable legacy yellow pages in upstream,
> I can ask for some configure switch. But if you're don't require it, I'd just
> drop the patch which is not needed any more.
> 
> Patch was also somehow related to package/libtirpc/0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
> (originally added as package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch),
> which was removed in 883a33ece5 ("libtirpc: remove NIS patch") as not needed.

Sure, if it all builds/works fine with a more recent libtirpc, I'm all
fine with dropping this patch!

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
