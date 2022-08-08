Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D8CC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 08:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8076E416F8;
	Mon,  8 Aug 2022 08:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8076E416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M78XVZEwaTcL; Mon,  8 Aug 2022 08:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B6B4148D;
	Mon,  8 Aug 2022 08:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B6B4148D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60B241BF591
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03FB160BF3
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03FB160BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBPwZ7AqPEXU for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 08:27:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2223D60AB5
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2223D60AB5
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 08:27:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C35D8240002;
 Mon,  8 Aug 2022 08:26:54 +0000 (UTC)
Date: Mon, 8 Aug 2022 10:26:53 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20220808102653.5a7a0584@windsurf>
In-Reply-To: <20220808101452.566fd732@tuxfamily.org>
References: <20220806224338.0159e15c@windsurf>
 <20220808101452.566fd732@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659947218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKVw3pR/4GK8KdFCLF0SVOKpWCQ+ENRzWDjPHm3B9aE=;
 b=lEzEzg/H45wcBpjvX9W7BSLfJXt5NrXWw3I4RYJs2JeaxaLxzqAZIj7Fg6iDjKTuhdpZRZ
 4wv+s07G/dHwtwNDpMsv+G3+LfEez14G0PSSO9FMxHvIHDok8JtpdQIIbHrHHz0WZ+8tcQ
 SU9osxHitEefOow6sAI7FIrmq6K79mC5qBFQXcX8Aj4sBEc6MI5FVENjjlHp2TR2EcCi/F
 CMrF8frDEE49az8fMgn4ajWtwmgeKRVXoYW8JGq07Nc9Ynl3H8hYwCczpWt/bpjD4h+qlP
 AxoO5ECV+svHUSEPOG+3+2BYESGPWj3s8WVLLP9031NqiQ+IOP4JWzcttKdbHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lEzEzg/H
Subject: Re: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Davide Viti <zinosat@gmail.com>,
 Mike Harmony <mike.harmony@snapav.com>, Peter Seiderer <ps.report@gmx.net>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 8 Aug 2022 10:14:52 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> > qemu_xtensa_lx60_nommu_defconfig -> elf2flt segfaults
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053940
> > 
> > qemu_m68k_mcf5208_defconfig -> elf2flt segfaults
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053827  
> 
> I'm interested in keeping the qemu defconfigs alive, please don't remove
> them yet. I'll try to figure out what's going wrong here.

So these are "special" issues. The elf2flt segfault is caused by the
changes in elf2flt to support RISC-V 64-bit noMMU, in commit
32f93b0ef2c602dfa1f5b243ba865d5b16e2fa33.

However, even with this removed, we have issues with elf2flt. See
https://lore.kernel.org/buildroot/20220725164425.7316b2e3@windsurf/ for
more details, and also
https://lore.kernel.org/buildroot/ce677d88-8f8e-2d81-4e7b-69a35a99c6b9@smile.fr/.

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
