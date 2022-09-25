Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55991C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED06F813AB;
	Sun, 25 Sep 2022 08:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED06F813AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZea-nLZDtFM; Sun, 25 Sep 2022 08:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2783481379;
	Sun, 25 Sep 2022 08:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2783481379
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2971BF4DD
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E02402BC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E02402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGr9PqlEf-fY for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:38:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B23FE40191
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B23FE40191
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:38:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10C83E0004;
 Sun, 25 Sep 2022 08:38:36 +0000 (UTC)
Date: Sun, 25 Sep 2022 10:38:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220925103836.778a4279@windsurf>
In-Reply-To: <20220925103019.1febbac3@windsurf>
References: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
 <20220925072502.GU1419013@scaer> <20220925103019.1febbac3@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664095118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFe/R89+//wxP8q2qFcNgRqJrYiEqbZd8kEiAN3EVRk=;
 b=bqbvLQAwqT8wGYuuCsf+nu5/y5K86h8FoM0PBC8alSz3DB+v6GVXZaHVjiinXsh5XCch5d
 2qL/GjUhWXCSRdsAglGUcCqeUxeD21tC8hhn6/3T0qRccpmVSFT5XLdoxp8Va2UJXiqBww
 Kj5T8nTkHL4tLKnLw+H80tHxwvr9MCk4Gq0KflZ7VHxIRuBnQwQKw4bsLDaMtwImjP/yAj
 Gpc2puu5VG7KxGIouRqoktmmnmghNadDbt2SulUzt6wRUOIAANLU4uudJm6OViVn+cg1Me
 71FJ/3IAjKow1m9Uu6Jyj8Xc88hL58wKVpNEkHq74gEcWt2404zrrFfM7ckf0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bqbvLQAw
Subject: Re: [Buildroot] [PATCH 1/4] arch/Config.in.xtensa: adjust
 endianness logic to avoid bogus configurations
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 10:30:19 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, 25 Sep 2022 09:25:02 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > >  (1) Showing the overlay file option only when building an internal
> > >      toolchain. For external toolchain configurations, it does not
> > >      make sense to show it as it will have no effect.    
> > 
> > This should be a separate patch.  
> 
> ACK.

Except in fact the overlay thing needs to be allowed even with an
external toolchain: it can patch Linux and U-Boot as well as the
toolchain components.

I'll rework the patch series with this in mind.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
