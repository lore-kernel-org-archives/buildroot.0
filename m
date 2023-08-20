Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97647EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 19:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F14D60B9E;
	Sun, 20 Aug 2023 19:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F14D60B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0s18W2SZRtc; Sun, 20 Aug 2023 19:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E31060ACD;
	Sun, 20 Aug 2023 19:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E31060ACD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2041BF2A9
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C96A409A5
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 19:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C96A409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ji6HaMZv8GqA for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 19:59:26 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 516994099F
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 19:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516994099F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:583d:50bb:f558:e336])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 70B3619F5A8;
 Sun, 20 Aug 2023 21:59:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 21:59:21 +0200
Date: Sun, 20 Aug 2023 21:59:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230820195921.GS1778688@scaer>
References: <20230820190438.101920-1-kilian.zinnecker@mail.de>
 <20230820190438.101920-2-kilian.zinnecker@mail.de>
 <20230820192912.GR1778688@scaer> <10326829.nUPlyArG6x@kilian-aisec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10326829.nUPlyArG6x@kilian-aisec>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692561563;
 bh=7E79yX9LEmt6INMxUkaJen+ANhTHsGiRNl4UOqe2LWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GE1YGQAqamFxFjS4GXCMRLLAsLVKJqCdInbxo/cw6/hV1WEbNtX9NcLS8ItM04OcD
 3GKycBARuFL9wJY736n9f5v/4pZouCaq/WPWZHhRMYn1nywldjDKI9tHB9MDqnEPCx
 wqUiI1Zv3GM+GpUhbs5ooQHUy+CeK9B5E69duuHzF0qgkgr2GGBylRFoqsLqli9d+0
 Z2LEYyB1HGFR6Tg2Oz/a4wxEjZlZiBMpeHW7mh72WHvTwPHiq6+iYypu7+xUGC+UDF
 XG6yguaA6HED7dj/siv5H3bpua2SmLQXEx84qgZGqTkR2z1WtQfKQwON0mxXNBUron
 a2rqWGGTpPqqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GE1YGQAq
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/rock5b: Add patches to fix
 gcc12 warnings
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

Killian, All,

On 2023-08-20 21:42 +0200, Kilian Zinnecker via buildroot spake thusly:
> Thanks as well. I don't yet fully understand how the git branches in open 
> source projects work, i.e., what exactly gets into the "next" branch (i.e., 
> how the next branch is actually defined) and what gets a release candidate "rc" 
> tag. However, I just wanted to add that imho this patch then should also get 
> into the next rc for 2023.08, because else the freshly introduced Rock 5B 
> support in 2023.08 will be broken.

I guess every project has their own branch management.

In Buildroot, we have a three-month release cycle. The first two months,
there' only master which gets commits. The third month, master only get
fixes, and the 'next' branch gets new features. About every week in the
third month, we tag an rc release on master, and eventually we tag the
release. Then next is merged in to master, and we start a new cycle.

It may happen that, after an rc is tagged on master, we merge it into
next, so that next also gets critical fixes from master. We don;t do it
very often, though...

And now that I wrote the above, I remember we should have something the
manual... Yes, we do:
    https://buildroot.org/downloads/manual/manual.html#RELENG

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
