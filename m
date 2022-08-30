Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087A1ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC1C813AB;
	Tue, 30 Aug 2022 19:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EC1C813AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6ChF-3QaPUc; Tue, 30 Aug 2022 19:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5756A813A4;
	Tue, 30 Aug 2022 19:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5756A813A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB89B1BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9720660E7D
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9720660E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHaOuSijwocg for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:48:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C6F360E65
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C6F360E65
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:48:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:677e:d766:490c:af47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1462AB00715;
 Tue, 30 Aug 2022 21:48:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 21:48:10 +0200
Date: Tue, 30 Aug 2022 21:48:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20220830194810.GF68979@scaer>
References: <20220830080447.7426-1-buildroot@heine.tech>
 <20220830194629.GE68979@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830194629.GE68979@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661888894;
 bh=0aV5f/2HlsSn7sJ/S+08HU95Zyq+jeSWTE51wEYuJvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WOsSfHFfcEhhtqv+d+AKsP/tX0pSklYeF09WUIrCSlZj11j8iFYjpbR+KJ9b+dx7M
 3c7aHwMUHcsfmKbcRJH+/Re24bj3zVE67/z5fBgrQJFBB3pn1/e9IZWXrYoQa54the
 7geQq9q1RUDJMZm7hg0ssNmVcoO71zqrzyzkds8HRDhRHGAgqnPFmrzGTQF0PZeCtS
 g8LBGHr1aBC16y7oVp3MlwmwsXqrnUY42I4fYisLh/yx9RBFVKXi2WNpH8LsZr507u
 Ei7b3/oDgZKb2csi7chPSV9gQB+N9l3CyBsHi8pXnzvQBLWJDiMH7hOpnzBAYudduo
 SW9bg/clVfKOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WOsSfHFf
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 9.1.0
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
Cc: Semyon Kolganov <semenak94@mail.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Micheal, All,

On 2022-08-30 21:46 +0200, Yann E. MORIN spake thusly:
> On 2022-08-30 10:04 +0200, Michael Nosthoff via buildroot spake thusly:
> 
> I've added your SoB-line, which you provided later in the thread, and
> applied to master, thanks.

s/master/next/

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
