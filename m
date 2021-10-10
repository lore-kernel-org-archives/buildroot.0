Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D172DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 14:03:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C04761058
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 14:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C04761058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CB282A5D;
	Sun, 10 Oct 2021 14:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7xK2cZ84xCj; Sun, 10 Oct 2021 14:03:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A647082A4E;
	Sun, 10 Oct 2021 14:03:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30E51BF403
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 14:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECBF782A4E
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 14:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wL9yBSobgA_g for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 14:03:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9841D826C8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 14:03:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1EBA720004;
 Sun, 10 Oct 2021 14:03:18 +0000 (UTC)
Date: Sun, 10 Oct 2021 16:03:18 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211010160318.6fab0072@windsurf>
In-Reply-To: <87bl3xs2z8.fsf@dell.be.48ers.dk>
References: <20211008224605.884413-1-giulio.benetti@benettiengineering.com>
 <20211008224605.884413-2-giulio.benetti@benettiengineering.com>
 <87bl3xs2z8.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: disable package if
 affected from gcc bug 43744
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Oct 2021 10:23:07 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> What about the reverse dependencies, E.G. gqrx?
> 
> package/gqrx/Config.in: select BR2_PACKAGE_GNURADIO

Gaah. I've stopped reviewing/merging Buildroot patches for too long,
and I've forgotten even the most basic checks... I'll try to be more
careful.

Giulio: I suppose you will provide a follow-up patch that addresses the
reverse dependencies?

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
