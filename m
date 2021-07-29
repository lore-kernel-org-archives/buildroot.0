Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9089C4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:50:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ACF060F4B
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 20:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6ACF060F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E9A160C0A;
	Thu, 29 Jul 2021 20:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Sez_B02CAZ7; Thu, 29 Jul 2021 20:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B95F60BE5;
	Thu, 29 Jul 2021 20:50:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D43B81BF317
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B4F82784
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 20:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOcOmS1XHma0 for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 20:50:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFC7D8274D
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 20:50:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 63511FF80C;
 Thu, 29 Jul 2021 20:50:18 +0000 (UTC)
Date: Thu, 29 Jul 2021 22:50:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210729225017.00d8ed93@windsurf>
In-Reply-To: <20210729203247.GG3189549@scaer>
References: <20210725125746.1169974-1-daniil.stas@posteo.net>
 <20210726235821.58ea502b@windsurf>
 <20210729004347.15063008@ux550ve> <20210729203247.GG3189549@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/htop: fix sources location
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
Cc: buildroot@buildroot.org, Daniil Stas <daniil.stas@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 29 Jul 2021 22:32:47 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Daniil, All,
> 
> On 2021-07-28 21:43 +0000, Daniil Stas spake thusly:
> > On Mon, 26 Jul 2021 23:58:21 +0200
> > Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:  
> > > On Sun, 25 Jul 2021 12:57:46 +0000
> > > Daniil Stas <daniil.stas@posteo.net> wrote:  
> > > > Change sources location from bintray to github since bintray doesn't
> > > > work anymore.  
> > > Applied to master, thanks.  
> > I think the original htop-3.0.5.tar.gz was overwritten after Yann
> > applied the first version of my patch. And looks like now it's removed
> > from http://sources.buildroot.net/htop/.
> > That means that htop package is broken for the released versions of
> > buildroot...  
> 
> Indeed, I can't see the archive there...
> 
> Peter, Thomas: did you happen to remove the tarball from s.b.o ?

No, I didn't do anything related to s.b.o.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
