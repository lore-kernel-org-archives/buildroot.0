Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD32C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC1E81413;
	Sat, 22 Jan 2022 15:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVXirCM2oVJK; Sat, 22 Jan 2022 15:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69B7813CE;
	Sat, 22 Jan 2022 15:09:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4C4B1BF391
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 15:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B212940191
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 15:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4IK699wGoOs for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 15:09:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3094A400C4
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 15:09:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8143C1C0003;
 Sat, 22 Jan 2022 15:09:15 +0000 (UTC)
Date: Sat, 22 Jan 2022 16:09:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vyacheslav <adeep@lexina.in>
Message-ID: <20220122160914.7e4cc513@windsurf>
In-Reply-To: <27eb54d9-6897-a2df-00c3-fb6dca8aba91@lexina.in>
References: <20220118111457.2491318-1-adeep@lexina.in>
 <20220122143327.7d1a1cf7@windsurf>
 <27eb54d9-6897-a2df-00c3-fb6dca8aba91@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/amlogic-boot-fip: new package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 22 Jan 2022 18:05:06 +0300
Vyacheslav <adeep@lexina.in> wrote:

> > So how can the contents of this repository be useful? OK, then can be
> > used locally for your own experiments. But for building an actual
> > device that you can ship/provide to others, using the contents of that
> > repository, because Amlogic does not even allow you to distribute the
> > contents of this repository.
> > 
> > So I am wondering if it's really reasonable to package this in
> > Buildroot.
> >   
> You already have package/odroidc2-firmware with same license.
> amlogic-boot-fip just put all similar binaries together and Neil 
> Armstrong made a build system for aml uboot binaries.

Well, I wasn't aware package/odroidc2-firmware was under the same
restrictive license. Are the license terms for
package/odroidc2-firmware available somewhere? This package is
downloaded from https://github.com/hardkernel/u-boot, but I don't see
the license terms from Amlogic preventing redistribution. Of course, I
understand that they simply may be missing (which would be really bad!).

But how can anyone use those blobs? You can't redistribute them.
According to their license, just putting them on Github is not even
allowed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
