Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B8C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 14:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E16A06080B;
	Sat,  2 Mar 2024 14:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mgIvcsDPbPR2; Sat,  2 Mar 2024 14:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA1A6081E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA1A6081E;
	Sat,  2 Mar 2024 14:37:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 739F81BF5B4
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F0C407B6
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnLg7eezNw6M for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 14:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D4594079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D4594079A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D4594079A
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 14:37:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 775F313F8B9;
 Sat,  2 Mar 2024 15:37:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 15:37:33 +0100
Date: Sat, 2 Mar 2024 15:37:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZeM5rb57dMFPvyIL@landeda>
References: <20240226203532.12112-1-ju.o@free.fr> <87y1b2bbqu.fsf@48ers.dk>
 <6d71ebe7eaf04f68ec07509930728eeb@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d71ebe7eaf04f68ec07509930728eeb@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709390256;
 bh=hEZ49a46gR+dfHFROOCK3WJFzxfxi5/wHF5iG7PZlds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FzYkOOw+AL9q9WiQ3GxDBPBuOJBUhiZCopQf37Y4bjo/qsXef9agioG+75TN0tSXv
 xlg4h8qBzC0cwGb76vGSAG2jr0aRmyKxlSx2weMeIvEKrvVR1XRgWF0JNxpG6+8PnM
 VKVyzzG2NptfhILvuC3N1dDQCerNsONJeZFk7+1Sd9SmDjznwOn2xNiDMGRkh0qjQ1
 4wkcFsE3WvgPMSrxKK/TZvEu6+e2WbP4GJ+bF1RGtx/MdgUmd5ulv4EYLfTHGPuAIk
 CPovBa7mnT+qiCCTbRa6DKH7KNjBXTm5UCrGyECQzWuUXja3c8OkULO2q9gYD+Z+WA
 O85WyhtAFI9Og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FzYkOOw+
Subject: Re: [Buildroot] [PATCH 1/1] package/mysql: change default
 implementation to mariadb
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-03-01 22:45 +0100, Julien Olivain spake thusly:
> On 01/03/2024 09:24, Peter Korsgaard wrote:
> > > > > > > "Julien" == Julien Olivain <ju.o@free.fr> writes:
> >  > The mysql package is a virtual package with two implementations:
> >  > oracle-mysql (the initial project), and mariadb (the fork of mysql).
> >  > This virtual package was introduced in commit [1] (2016).
> >  > The last version bump of oracle-mysql was in commit [2] (2014). This
> >  > mysql version 5.1.73 dates from 2013 [3].
[--SNIP--]
> > Thanks. Maybe we should instead get rid of the oracle-mysql package (and
> > the virtual package) if nobody cares about keeping it updated anyway?
> I was initially thinking about proposing a big bump to mysql-8.0.x some
> time later. Upstream has still specific features that could be interesting
> to somebody...
> 
> I personally don't need those for the moment, so I am also OK to drop
> it with the virtual package.

Let's face it: noone cared about that package for most than ten years,
not even for those features you mention, so it means noone is interested
in using that package.

So if you do not use it, don't bother expanding the time to update it.

> My initial intent was to raise the attention on this decade old package,
> with quite a few CVEs associated to it ;)

"Quite a few" is probably the best understatement of the year (and it's
only March!). ;-)

So I'd side with Peter here: drop it, and then drop the virtual package.

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
