Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C3EC3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EE9481CD0;
	Tue,  3 Jan 2023 20:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EE9481CD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Krz5vHq1HePx; Tue,  3 Jan 2023 20:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A6881947;
	Tue,  3 Jan 2023 20:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A6881947
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC5021BF574
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7CBA60F93
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7CBA60F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfFGRUTEM-vi for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 20:32:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DCB4607BC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DCB4607BC
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 20:32:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3893:55a9:bd48:a433])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 673E82003D0;
 Tue,  3 Jan 2023 21:32:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Jan 2023 21:32:33 +0100
Date: Tue, 3 Jan 2023 21:32:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dennis Van Hoorick <dennis.van.hoorick@gmail.com>
Message-ID: <20230103203233.GA2498764@scaer>
References: <20230103103438.1889-1-dennis.vanhoorick@barco.com>
 <20230103103438.1889-2-dennis.vanhoorick@barco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103103438.1889-2-dennis.vanhoorick@barco.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672777956;
 bh=iY/FjJzYZOSPBvTXdcYWjd4NIQiybtR0+Ak3SJYq+M4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZ0wXLT6AoOkS+CyeaE81nmZyjPYh4qvDJzhBkuVECY/5dXHYfubO82LZIrfj1LrY
 4DDKRjUhHA7B6eZ/a2FC5Eqf6kG7bWSpJ7/M1Hc7CENUFFqsTHmJKtOnLklnHy3XoZ
 u/B06TKHo+cWxnrNAw7gfVyNtMllFpDOa3ZZcjTxx7zKs/gAWVXnwAeNv0JxMW5v7l
 4QBpGjd2PTW8xis5fUH2l2bR65/NEiZ/i08W/PsaJ4c5N0N43NeQVTpgxNx4nqUQbW
 9pRPxB/Y9OcZyBwUqk1/zF3+F0jcxyN3bSy0O/AJMN7BKmJDrAs9LYM9cNy7SWPBD5
 tUI7v0CbcY9zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EZ0wXLT6
Subject: Re: [Buildroot] [PATCH 2/2] package/ncurses: Switch to git repo
 with snapshots
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
Cc: Dennis Van Hoorick <dennis.vanhoorick@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dennis, All,

On 2023-01-03 11:34 +0100, Dennis Van Hoorick spake thusly:
> Switching to Thomas E. Dickey's github (Thomas is the ncurses maintainer, so we can trust him).
> This avoids needing to list all incremental patches, and will make future bumping easier.

I've extended on the commit log a bit, but mostly see below...

> Signed-off-by: Dennis Van Hoorick <dennis.vanhoorick@barco.com>
[--SNIP--]
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 4d93a992e4..0ba98b4d64 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -4,79 +4,20 @@
>  #
>  ################################################################################
>  
> -NCURSES_VERSION = 6.3
> -NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses

So, 6.4 is out now, and I was wondering what would happen if we wanted
to use a version that had no snapshot yet [0]...

> +NCURSES_VERSION_MAJOR = 6.3
> +NCURSES_SNAPSHOT_DATE = 20221224
> +NCURSES_VERSION = v$(subst .,_,$(NCURSES_VERSION_MAJOR))_$(NCURSES_SNAPSHOT_DATE)

... so here we would generate version like "v6_4_" which is not nice at
all.

First, we do not include the 'v' prefix in the version string; we only
add it in the call to the github macro.

Second, of course, is that the version ends in an underscore, bleh...
And the version people are usually used to is 6.4, not 6_4, so meh
too...

So, I extended a bit to fix all that. Please look at the resulting
commit.

Applied to master, thanks! :-)

Oh, and since 6.4 is out now, I'll take you at your word: "This [...]
will make future bumping easier". So... ;-)

[0] There actually is a snapshot now, but I don't think we can rely on
one to be available on the first day of the release.

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
