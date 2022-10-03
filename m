Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D251C4332F
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E2D408C8;
	Mon,  3 Oct 2022 15:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E2D408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75f0aRS9lxJV; Mon,  3 Oct 2022 15:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BA34037E;
	Mon,  3 Oct 2022 15:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50BA34037E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6077E1BF398
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D9A6415E2
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D9A6415E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6DuhNoaYxzw for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:45:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3AD415E0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD3AD415E0
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:45:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8960CE000A;
 Mon,  3 Oct 2022 15:45:36 +0000 (UTC)
Date: Mon, 3 Oct 2022 17:45:35 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221003174535.12946beb@windsurf>
In-Reply-To: <CA+_SqVbs4_tPr4y9kMCP0f9dsjxO5bX48zvz45ABynfpbVzaEA@mail.gmail.com>
References: <20220925160320.80027-1-angelo@amarulasolutions.com>
 <20220925214143.05ba673a@windsurf>
 <CA+_SqVbs4_tPr4y9kMCP0f9dsjxO5bX48zvz45ABynfpbVzaEA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664811937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVl2xOzpZJwUGokaJ4Rn6B3SGOjIbPaZ3DcAspwZ6bM=;
 b=pcUWyT8IUZV3eD2jS4cPX4FTpf/Pu+2W9LmiX6anWB9XvUZsqFpYon3SHnHSORXDbFzMMT
 4jiwYrIDjM3qWLB2QsD0ytTn+nB6db0fyvDr0n4mQkcBlV62zhYdY8959Ir7QJjpLbbQm0
 MdFb88h0SMD+pOt7AuPc+GzUj5VGPupV86NVc9QN29IBkQm/pkTUWePzvzDSNoEGw/Hutk
 ISGo41e4i2nNjUSdifNgZ6u/cj4qn5AZkl1T8qhWnMBkwj6suYWsJfZW9mZtmMXU4xqv9R
 GGPllOxOeD5nZ2vqXBeK0EbvghkMM0b9Bh5PsfwBN8PPc0/epNuLdPvWz/s0YA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pcUWyT8I
Subject: Re: [Buildroot] [PATCH] docs/website: fixing js for the new feed
 source
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 3 Oct 2022 17:25:18 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> > Thanks a lot for working on this. Based on the cron job like that you
> > propose, I can see how this can fix the list of last e-mails on the
> > mailing list, but how can that fix the other box visible on the web
> > site, which lists the latest commits ?
> 
> This feed mixes commit/non commit entries, so the choice on which box fill
> up is in the js code.

Aaah, it uses the git commit notifications available in the mailing
list. Smart thing!

Thanks for this contribution. We'll have a look at setting it up, with
the cronjob that it requires.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
