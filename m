Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30A0C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 09:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87420403B8;
	Fri,  3 Jun 2022 09:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsxfcKVnIXQw; Fri,  3 Jun 2022 09:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A41B4400E4;
	Fri,  3 Jun 2022 09:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D57F81BF346
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAC91409F7
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Gfk7NRB87JO for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 09:47:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69418409A8
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:47:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F37160005;
 Fri,  3 Jun 2022 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654249645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCpzMeaNy/ld6mj/2zOj40B+XsBQTwNRg0UxbU93fBY=;
 b=juDvmIodo3Vjgsjxja+A7bH7iu8F6pT2YCPX4uZUj2vJ0rd4USZfSLT5V3/g3YqSbUQLyt
 NTy1vaTX6gzcW5yZheQ02oohqzFZxR9+EnFgzVf9A4p+SDnrBQCkTQghVGLutcDExkHA7b
 krqqVsN/QFvIuUnWO+Qw8pDCLjDkGvgeEGqHXNxglbD9lt7ymK3kAqvCLs9G6ERVJ8EZ/U
 O2G2/S0CBZJmvnIt/5z5UHqpNTyKyJAmYkwUZHXkMcPgCOhdMOj0ayaH+OPh1H+YoKazCp
 CDfk65/tPiO1/Nq2i2fhpiPnTIwU/38WZ6VA6OFGlm4xXZoVRYZWFOTyH1Is8w==
Date: Fri, 3 Jun 2022 11:47:24 +0200
To: Nicolas Carrier <nicolas.carrier@orolia.com>
Message-ID: <20220603114724.5cf56736@windsurf>
In-Reply-To: <b203b8a90944c5f307c113ba8db8e377a627017a.camel@orolia.com>
References: <084d72797070bdd11665d39bdb0d3df277c88b78.camel@orolia.com>
 <b203b8a90944c5f307c113ba8db8e377a627017a.camel@orolia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 03 Jun 2022 11:09:48 +0200
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> Hello,
> I tested this morning against the master of buildroot (with an ubuntu 20.04) and the issue doesn't
> appear anymore.
> So there must be some change "recently" merged, which solves the issue.
> 
> An idea anyone?

Not yet an idea, but I confirm that I was able to reproduce on
2022.02.2 (just so you know that your e-mail and issue have been seen!)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
