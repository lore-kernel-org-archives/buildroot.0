Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404D6C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D321F40887;
	Sun, 11 Dec 2022 17:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D321F40887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YogIOv4Kda9J; Sun, 11 Dec 2022 17:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD74408C9;
	Sun, 11 Dec 2022 17:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFD74408C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27AC11BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 100C640363
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 100C640363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1ck2oPnB6a4 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 850504026A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 850504026A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:17:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 74D2913F854;
 Sun, 11 Dec 2022 18:17:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 18:17:35 +0100
Date: Sun, 11 Dec 2022 18:17:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20221211171735.GV1044805@scaer>
References: <20221208110247.7002c3ca@c3po> <20221208141647.0ca26b3c@windsurf>
 <b8157c6b-cf89-4d3d-bafc-fba182f8cf5a@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8157c6b-cf89-4d3d-bafc-fba182f8cf5a@app.fastmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670779057;
 bh=KYNPEk01QKDvWpLZL20WEJ5yQtI9tQsL8AZ/AEuw/A4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=adVe/LaTTJKnwPhnOK4jGScGyhUEHb517JQo/Nw3qHOYrWvAFhi3uqy1mlxnGG62q
 tH55uFJ7WFtSxwnNG709tUmDd098g9TMdHFOXZFWEdIpH9vpQu71yiKJFujouW2FHw
 q8bGE1rE2obhR6YMsrUAaiQd+Lj/MTRQ6KVx/kdQ5gNiPyePsfXg/abHMkDX5VqImX
 no9FY6QOEJMpmfalUlxb3ZDidnv+5zP1vdJqFScMUGz4z/r8cme5V5GR0CkWpvIYSL
 l6HZOIu55kS/brmfI2moHQoGzWAD/QIVaHapAQPVG81GdUIMp3AMvIqbG9AHgEaSbC
 dFsTF0JsjPjZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=adVe/LaT
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: exclude unsupported
 targets
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Danilo, All,

On 2022-12-08 16:48 +0100, Danilo Bargen spake thusly:
> > Side note: overall, if you take a step back, it is absolutely
> > mind-blowing that a simple application showing tldr pages has a
> > dependency on architecture-specific things. There is really no sane
> > reason to have such dependencies, but apparently the Rust ecosystem is
> > not completely sane... :-/
> 
> The reason is that Tealdeer uses https://github.com/rustls/rustls for
> TLS, which depends on the "ring" library
[--SNIP--]
> Previously tealdeer used OpenSSL, but quite a few of the users had
> trouble with broken OpenSSL installations. Plus, it made
> cross-compilation and static builds much harder. Using rustls makes
> this much easier on the common platforms, but of course, this has
> certain limitations with regards to more obscure target architectures.

cross-compilation with openssl is very easu. It just works.

That static build is harder I consider that a benefit rather than a
deficiency. ;-]

> If you would rather remove tealdeer from Buildroot (because the config
> is getting too complex), that would be OK for me. Otherwise, I'd
> update my patch based on your suggestions.

I think what Thomas meant, was that it is a pity that we need a TLS
implementation just to read the equivalent of man-pages, which by virtue
of being local oalways work, and that that TLS implementation has
limitations on architectures, which man-pages do not...

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
