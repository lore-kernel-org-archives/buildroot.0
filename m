Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A01DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 20:35:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858F561212
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 20:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 858F561212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA61404AC;
	Wed, 20 Oct 2021 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joCuJqRK9pJT; Wed, 20 Oct 2021 20:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242CD403E2;
	Wed, 20 Oct 2021 20:35:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77E521BF2C0
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74819403E2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 20:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXLjYCG9y3YN for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 20:35:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93D3A4031D
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 20:35:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6961F1BF205;
 Wed, 20 Oct 2021 20:34:58 +0000 (UTC)
Date: Wed, 20 Oct 2021 22:34:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20211020223457.29d301e3@windsurf>
In-Reply-To: <CADjhFRBrddV3BCrC7FOEaBjzzvpWDshvO3SCA8Cq1uXby4at1Q@mail.gmail.com>
References: <20211011210241.396390-1-glex.spb@gmail.com>
 <20211011212125.402086-1-glex.spb@gmail.com>
 <20211011212125.402086-3-glex.spb@gmail.com>
 <20211017113717.3f642315@windsurf>
 <CADjhFRBrddV3BCrC7FOEaBjzzvpWDshvO3SCA8Cq1uXby4at1Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 2/2] package: add smpq
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
Cc: Samuel Martin <s.martin49@gmail.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gleb,

On Sun, 17 Oct 2021 09:05:34 -0500
Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

> The use case for me is to build DevilutionX (Diablo 1 source port) in a
> gaming-oriented buildroot-based distro (batocera.linux).
> 
> DevilutionX produces an MPQ archive during the build process using smpq, so
> smpq needs to be a host package.

OK. But are you going to submit DevilutionX as a Buildroot package? My
only concern is that just by itself, smpg is not very useful. So having
that in Buildroot without having any of the packages that use it and
that provide some "useful" functionality is not very interesting from a
Buildroot maintenance point of view.

> I'm not near a computer for the next few days so I'd appreciate if you
> could adjust the commit message and DEVELOPERS when merging.

No worries about the timing, we're not in a hurry. There might be other
aspects in your patches to review, but I'd like first to understand
whether we want these packages in Buildroot in the first place.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
