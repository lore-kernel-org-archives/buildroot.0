Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E04E95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 514B161286;
	Mon,  9 Oct 2023 15:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 514B161286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5skG6Jt-d14Z; Mon,  9 Oct 2023 15:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48A4061274;
	Mon,  9 Oct 2023 15:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A4061274
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB6511BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D9E80B8D
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D9E80B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILZjcM3ULNUZ for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:14:13 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFDC28205E
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFDC28205E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d143:e10c:f714:dfc9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E86405FFA3;
 Mon,  9 Oct 2023 17:14:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 17:14:08 +0200
Date: Mon, 9 Oct 2023 17:14:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231009151408.GE14234@scaer>
References: <20231009080612.23347-1-adam.duskett@amarulasolutions.com>
 <20231009080612.23347-2-adam.duskett@amarulasolutions.com>
 <20231009151200.GD14234@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009151200.GD14234@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696864451;
 bh=CXPXc6R8xCAWuAhSKSExH5dFbW19NaRWvPHF0XtKDQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rptx8SIbblDrlRU/ZrtRW8mx5PzGgh7xYMpztca+WVlhmpSPL5w0J8cvNzN8KJQIy
 6b3jGJaspPKf1ntLQ4kUU6N3SO0Bvz9zdUh793QJfhCmnOGMB30H3gCef5s0TvM3cn
 +xarMMxC9u0P72bttDtnuxV/j2ovE/ovkv9Ekc6hMvZgfZb9glFGLGpBzmiXoKn21X
 b+NIUm5z3lCD0775R+NbtZodE5pViaAdBb68oNh6ToYYV7oa4Iu3aQThRZaYFO88JD
 M8YCrxiSwSJmKjyQ6/tU6Lz+3QlEoB2Prk1K4GbRfguL1YlzRZBuJ5NCYk9J+A1dg9
 pLyXX7fFBKQOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rptx8SIb
Subject: Re: [Buildroot] [PATCH v3 2/2] package/refpolicy/Config.in: depend
 on merged usr when selecting upstream
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

Adam, All,

Sorry, O was too fast at sending my reply...

On 2023-10-09 17:12 +0200, Yann E. MORIN spake thusly:
> On 2023-10-09 10:06 +0200, Adam Duskett spake thusly:
> > Refpolicy contexts expect a merged /usr file system. In fact, there
> > are no references to /bin, /sbin, /lib, or /lib64 at all

Is this due to the version bump?

If yes, then it should be part of the same patch. If not (i.e. that was
already the case before the new version), then it should come before the
version bump (so tht it can be more easily backported to maintenance
branches)

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
