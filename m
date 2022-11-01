Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B4EFA373D
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 10:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CA1260C34;
	Tue,  1 Nov 2022 10:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA1260C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PO2OJjm6rwVq; Tue,  1 Nov 2022 10:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCDA60C20;
	Tue,  1 Nov 2022 10:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCCDA60C20
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 970791BF873
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 10:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7956760C20
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 10:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7956760C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDifUVTtj3tV for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 10:02:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B8360AEE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8B8360AEE
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 10:02:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:50d3:260a:b461:e6c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D411019F5AE;
 Tue,  1 Nov 2022 11:02:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Nov 2022 11:02:44 +0100
Date: Tue, 1 Nov 2022 11:02:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20221101100244.GF1058960@scaer>
References: <20221031213926.50d3c778@windsurf>
 <f7086aad47234c089332330689ae9a42@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7086aad47234c089332330689ae9a42@AcuMS.aculab.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667296973;
 bh=A7gzo/QwGYDWv6kk6mq0u3y1BGFDk5wk0eLcQd4w9y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ks2JkIIPpS86jo5RItLDHtOy2ooG5cKdG+cGD7H6icmQbhU+37zQwAjvfYTOiwJoG
 CPQPoP29TGzlKMnlQFnshjwrZ1m2/RLxF1BMuFKNB1RMLKdwrNIMjmpAfKuXi/E/Rj
 42kmrQJ+EHXnGxoBKdQH43PrZfFPGun0KBHD4ISlO74+lbriWKH1MT7PeYMR9bRqvu
 o+as6bEwxdctg58Wn2LLyEZi8fHUfDRw/ByxaloXB8L+7lljhFBoLFg5zpwiVELN65
 Ulvg4RFZW4f/4o8Ru6gDUGiR8A22Ivpt0moCsTWZLIk2HpOURnVq/w4VMhCbMwfS9Y
 DbAXuZ5NJjoTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ks2JkIIP
Subject: Re: [Buildroot] NodeJS, qemu wrapper and ELF interpreter fun
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
Cc: 'Thomas Petazzoni' <thomas.petazzoni@bootlin.com>,
 "f.rogall@gmx.de" <f.rogall@gmx.de>, "mail@jens-maus.de" <mail@jens-maus.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "fesc2000@mailbox.org" <fesc2000@mailbox.org>,
 "oliver.kasten@trsystems.de" <oliver.kasten@trsystems.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

On 2022-11-01 08:46 +0000, David Laight spake thusly:
> > (C) Pass LD_LIBRARY_PATH pointing to $(STAGING_DIR)/lib and
> >     $(STAGING_DIR)/usr/lib in the Qemu wrapper. This works because
> >     LD_LIBRARY_PATH paths have precedence over paths given by
> >     ld.so.cache.
> > 
> >     This is the solution already used by the GOI qemu wrapper in
> >     package/gobject-introspection/g-ir-scanner-qemuwrapper.in, and
> >     which was suggested in bug
> >     https://bugs.busybox.net/show_bug.cgi?id=14366.
> > 
> > Any opinion? Or other ideas?
> 
> Using LD_LIBRARY_PATH like that is a bad idea.

Yeah, we know quite a bit about some LD_LIBRARY_PATH woes ;-)

> Just google for it and you'll find a load of stuff about it.
> LD_LIBRARY_PATH should only really be used not substitute a
> non-standard library - eg for testing.

In this situation, the issue is that we are running a *target* program,
on the *build machine*, and we want it to pick target ilbraries, not the
host libraries.

Of course, during cross-compilation, we can't run target code on the
build machine, so we run it through qemu-user.

However, as Thomas explained and demonstrated, qemu-user intercepts and
emulates the open()-like syscalls. Then it has a heuristic to resolve
the opened path. This heuristic fails for us in some cases, however.

Thus we need a way to force-tell where to look for libraries.

So, yes, LD_LIBRARY_PATH is far from a panacea, but technically it makes
things work.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
