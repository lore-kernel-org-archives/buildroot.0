Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD9CE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 19:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C1C608BA;
	Sat, 28 Dec 2024 19:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX78H04BoC6m; Sat, 28 Dec 2024 19:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24617608BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24617608BE;
	Sat, 28 Dec 2024 19:29:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3DB3E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 19:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5DA9608B3
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCirhJUz0A9f for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 19:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F267F608BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F267F608BA
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F267F608BA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 19:29:55 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 26054240A1D;
 Sat, 28 Dec 2024 20:29:54 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 05C5F240573;
 Sat, 28 Dec 2024 20:29:54 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 40B9D240A79;
 Sat, 28 Dec 2024 20:29:53 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, mark@dibsco.co.uk, alistair@alistair23.me
Date: Sat, 28 Dec 2024 20:28:59 +0100
Message-ID: <1990935.PYKUYFuaPT@kilian-laptop>
In-Reply-To: <ead4cfe5eaae652ae308c78b6b23e66b@free.fr>
References: <4632342.LvFx2qVVIh@kilian-laptop>
 <2761179.mvXUDI8C0e@kilian-laptop>
 <ead4cfe5eaae652ae308c78b6b23e66b@free.fr>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1239
X-purgate-ID: 154282::1735414193-81D3E89E-532DC0BA/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735414194;
 bh=PejxOKDUNTmFbDI/74UwbpLcuoFVr6FeGlaYHUmBO5Y=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=IM42ryoHaZcB+XqU1mEOX96No98HEVuwD03Ew7Z89GlXmfRkMdRLCpNcA6eR6oGws
 QUycWA8IcLc1noUWhRLe+oglvtp3G15C1vGFo+LnCyBrxiErkCFIzpqNMvQIm911P2
 oCHUQRFYGG95PXfqMdKJoaHQTiQPQiSTAcaKtVm+kz6Z5PgZl6JCHpVk8dmBT5RX2g
 mpto9D0nfh0OILe9vT/Z3/rTg6vW8H9fcKl45GYh063xpC3bqyU6q5dQUF7HhdtpTM
 2wftHyd2moZIS0c6LjpuhdX+GvMC8tQf5qfNMBDQFuxcJKA3Vc5UwBGabigEys9g9O
 K3IU1Ql1sB/+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=IM42ryoH
Subject: Re: [Buildroot] [Help] How to bump a package, e.g., OpenSBI?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

[--SNIP--]

> I was able to reproduce this issue.
> 
> I was also able to work around it by replacing "fw_jump.elf" by
> "fw_jump.bin" in [1]. See also [2].

Great, thanks!

> So, to summarize: it is OK to bump the default opensbi version to 1.6
> in a commit (without touching the defconfigs) since we are able to
> make it work in qemu with a workaround. IT might be a good idea to
> add a reference to [2] in the commit log.

I just sent a patch. I hope it is as expected. I added a "Tested-by" with your 
name and email - hope this is ok?

> Since we learned that opensbi 1.6 no longer start our qemu defconfigs,
> we could update those qemu_riscv{32,64}_virt_defconfigin in separate
> commits
> to use opensbi 1.6, and also the corresponding
> updating board/qemu/riscv{32,64}-virt/readme.txt which is used to
> generate
> the output/images/start_qemu.sh script.

Do you want to adjust the defconfigs or shall I give it a shot? If the later, 
shall I add you also with a signed-off-by to the patch, as if I assemlbe the 
patch, I heavily rely on the information you provided? 

[--SNIP--]

> This is a known issue. See [3] for some details.

Ah, thanks!

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
