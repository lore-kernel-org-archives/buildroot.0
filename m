Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1BBC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 06:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA04340B7A;
	Mon, 25 Jul 2022 06:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA04340B7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMK3CXM7xty8; Mon, 25 Jul 2022 06:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC9340CB0;
	Mon, 25 Jul 2022 06:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC9340CB0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C77F41BF38C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD45F4174B
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD45F4174B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aLBnvQXuAFz for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 06:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D654E41705
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D654E41705
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 06:25:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2FDD820009;
 Mon, 25 Jul 2022 06:25:57 +0000 (UTC)
Date: Mon, 25 Jul 2022 08:25:56 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220725082556.33cfb04b@windsurf>
In-Reply-To: <CA+h8R2qUUZ9q9L1Xs4V5GOB1W1iJcKPaMxs_-h0d2dAOKwybGg@mail.gmail.com>
References: <20220625224224.1446787-1-christian@paral.in>
 <20220723184104.0032a7dc@windsurf>
 <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
 <20220723222237.7989b5c6@windsurf>
 <CA+h8R2qUUZ9q9L1Xs4V5GOB1W1iJcKPaMxs_-h0d2dAOKwybGg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658730358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pW1eA0Q0ky9/TBBW9+yafxIw2aZxFoiAFH3GCHbLyC0=;
 b=Hl1IvmsM3aLNjv7mVW/svc+8yZC9NOD5jOt2rCwtvFm3ZQTUeo1D8nP0Z4NgXKAl9F2Uo4
 J6obv5Lp0Nkgg+uMVltRDuy25YzIMHVHjTuSyksrNEU8A+auFB3uctRMVpDvaIBq15cSp3
 ehkL/v7KWpFdS2V3OcFO8oNZaIxntD/07hmdNAZerHyVYvm2mdluYwn9u2iXcg89RSligP
 ncECmLJLXktYj0C76T2kK5jHhRDtLrVDvBkweLMuyQDbOiEFO9fTHPIF8zmkCbnfeoUygK
 nObvrToN3u92lmb2HtCUf3BDXXRy2v/gx8VeDumUT0jG2pmhwZJYMpB/C4uXJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hl1IvmsM
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
Cc: Anisse Astier <anisse@astier.eu>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Jul 2022 16:42:30 -0700
Christian Stewart <christian@paral.in> wrote:

> On Sat, Jul 23, 2022 at 1:22 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > But I see this:
> >
> > -# github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd
> > -## explicit
> > -# github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff
> > -## explicit
> > -# github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11
> > -## explicit
> > -# github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb
> > -## explicit
> >
> > So these lines are really removed.  
> 
> If you run 'go mod tidy' it removes these lines.
> 
> So, I guess they are unnecessary / not needed after the "replace" is added.

But that's precisely the part I don't understand: the fork of the
crypto lib is supposed to only have a fix to build with RISC-V... so why
does the fork has changes on its dependencies?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
