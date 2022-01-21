Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8115FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 20:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9BFB60F5F;
	Fri, 21 Jan 2022 20:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYeRAV9BVZUj; Fri, 21 Jan 2022 20:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4246F60B89;
	Fri, 21 Jan 2022 20:44:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF54A1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 20:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1284170A
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 20:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKWfjZM9oBQz for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 20:44:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F369041708
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 20:44:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90bb:6e44:a706:407c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 221FD780344;
 Fri, 21 Jan 2022 21:44:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642797889;
 bh=lIc1NT3+73cj4eZKUxTgV38BkN938WYGB+LvT36sxy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XmkLX1f4ewkHjX2c0yGKbg1kVVsWmcFyvG8/yRUFLkIT8a7+ukIwCv+ph5ttpLP7x
 EZn04+Dizue1PPG16Tim+tgIPIKm5l5E0GetJNnwjVAx8lCoaWhD57eKsGSJLwnD6e
 bkK3HijXufG05E+EOOByVMJPzZVpVfLEM86H+wFE9SHFh66TjAbSk7VW7unkqqMK+t
 +WpU/yD+6LKDaDLcXj1rpByjPrp0mmX1+EteeTdzZqKxYkF4vfcM4e4nM9MsCRY1a7
 W34wsAf7sEEnXjh7rhOHIFOi+ib1Eg5WBcOLxsoEs6Rf9gPdyMAi9yEDLIJHqn59PO
 Yb3ThBqtcdQZQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jan 2022 21:44:46 +0100
Date: Fri, 21 Jan 2022 21:44:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220121204446.GJ3252931@scaer>
References: <20220120211941.1033249-1-angelo@amarulasolutions.com>
 <20220121203946.GI3252931@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121203946.GI3252931@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.3
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

Angelo, All,

On 2022-01-21 21:39 +0100, Yann E. MORIN spake thusly:
> On 2022-01-20 22:19 +0100, Angelo Compagnucci spake thusly:
> > Update project to its new location and move to use the package provided
> > init scripts.

Oh, and this is just stating what the patch does, but is missing an
explanations why this is a better idea than using our owns, the latter
being the really interesting thing that we want to record in a commit
log... ;-)

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
