Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5227CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA0A83396;
	Wed,  9 Feb 2022 21:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rG_x73czFotu; Wed,  9 Feb 2022 21:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61759832C7;
	Wed,  9 Feb 2022 21:55:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDF341BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E91A760E38
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6YNKAb3S4ep for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:34:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E45D860BF2
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:34:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d4bd:3395:fce0:5749])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 23A9D7802C2;
 Wed,  9 Feb 2022 22:34:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644442480;
 bh=utp5O4tRMA5J/QYyA0ih3FkbW6fbX453JJLJfxY+x+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmKCpzE3l28IyWrQFU00jGzofGEmmjbVVOd8uSlsh8ZPA/LEY8HOQbh0F+QxTZAxm
 xnwYG7rGm2HZ91kf/kiZqNpgirNqkC/fgWmK/6LHfNliVfJeJIZspEwYsvNALYYPGM
 vQj0oLM/jQ8cDtgkMT+ktcgI180D4ZRR+6tpzd1uIEyJaxQ/OXQHvYSFdVJPEew3bm
 Ffx8xpGlYYouxzNjXz9vJ5XshcrtuFGrUBAfBI5cmXAzov6LI3T8eY32/kQBgyvkXx
 rhAjRjcs8uvMbfpyd+7IcbKFyuVgw+fOC9zuGnEHCKxxAxanMERnWC5vIOVw19zK5f
 o5OELaB3njbmw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 22:34:37 +0100
Date: Wed, 9 Feb 2022 22:34:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220209213437.GF2249818@scaer>
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209165213.4498-85-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209165213.4498-85-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 084/107] package/python: drop host package
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

Peter, All,

On 2022-02-09 17:51 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
...
>  package/python/Config.in.host                 |  16 -
>  package/python/python.hash                    |   5 -
>  package/python/python.mk                      | 302 ------------------
>  37 files changed, 2301 deletions(-)

You forgot to update DEVELOPPERS, so I cherry-picked the hunk from patch
102 and applied it here.

Applied to master, thanks.

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
