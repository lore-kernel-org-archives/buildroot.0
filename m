Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A34C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 11:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCAA60769;
	Sun, 31 Dec 2023 11:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDCAA60769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8awNtqjOc4h; Sun, 31 Dec 2023 11:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 051F360774;
	Sun, 31 Dec 2023 11:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 051F360774
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6F3F1BF289
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 11:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8534840924
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 11:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8534840924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eP6nUP8d8S98 for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 11:02:09 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F9504090B
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 11:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F9504090B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 37839B0057C;
 Sun, 31 Dec 2023 12:01:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Dec 2023 12:01:58 +0100
Date: Sun, 31 Dec 2023 12:01:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZZFKJtLm9ko7L6se@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
 <ZY9Ej76T9DYHuLe3@landeda> <20231230190019.434e1b4b@windsurf>
 <ZZBzIdHGdJufQNWn@landeda> <ZZEzoC30PnpTgqLa@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZEzoC30PnpTgqLa@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704020526;
 bh=fk/1qmJk/FAtNm8jvAxgJDe0zcLU5E1qlTLzOvW37IQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XiR9RrWOuP98s1OQ3FINv4n+LnEuNrROqtYDFCCeOZlDCmxhTeKKfvhn9Q2J9lJro
 iU82JMMDftZQt9ZK994geQcNaVDf66RQ5z+Weah1TA6E5O/pSEnQtchj75W/k/LKlG
 D++pdgDSF8jReqsznxEsl6pLJk9APJaptFmw1NDtS9T7pPnM9y8v/Z2qolBiz79BDn
 Q8vH6CNNw4PO4z2QhQxKrnnsYQ7Y1hs0yyKBlizmC1m9/4tHBNZkrIU5rLeHxwqum9
 Te07BVleS9j62yD7gfax5jyWf2SwewOvUq2hfILzp77uSopRn0jMWhUXemEGclPL81
 9QV5QS21xx4rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XiR9RrWO
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, sebastian.weyer@smile.fr,
 Antoine Coutant <antoine.coutant@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-12-31 10:25 +0100, Yann E. MORIN spake thusly:
> On 2023-12-30 20:44 +0100, Yann E. MORIN spake thusly:
> > On 2023-12-30 19:00 +0100, Thomas Petazzoni via buildroot spake thusly:
> > > Note that I also encountered some hash mismatch on some Rust/Cargo
> > > package recently, and BR was falling back to sources.buildroot.net. I
> > > did not have the time to investigate at the time (I was looking into
> > > another issue, and didn't want to enter an infinite recursion of
> > > problem solving quest). And now, I don't remember with which package I
> > > encountered this. But yes, it seems like we have a reproducibility
> > > issue.
[--SNIP--]
> I took some time to try and pinpoint the issue. Alas, I have no clue,
> just more questions.
[--SNIP--]
> As a reminder, commit e27a700f3e contains the core infra fix just after
> the conversion of ripgrep to the cargo infra. Here's a little summary of
> what happens
> 
>                             e27a700f3e      master
>     Ubuntu 16.04.7;
>       - native              OK              KO +
>     Fedora 39:
>       - native              KO *            KO +
>       - ./utils/docker-run  OK              KO +
> 
> So, we have two issues:
>   - the cargo version has an impact on the vendoring
>   - the build environment has an impact on the vendoring.

So, turned out that, on F39, we hit the tar 1.35 issue on e27a700f3e.
Building host-tar before trying to vendor ripgrep fixes the issue.

So, at least, that's that: we *can* reproduce the proper hash for
ripgrep at the time it was bumped.

So, we're now left with just the cargo version issue... Which is in fact
rather good news: we do not have an unknown dependency on the build
environment.

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
