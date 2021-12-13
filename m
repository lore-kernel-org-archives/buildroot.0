Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6171BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 17:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05AD080C45;
	Mon, 13 Dec 2021 17:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9O5CIOIbxmb; Mon, 13 Dec 2021 17:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8296580C44;
	Mon, 13 Dec 2021 17:55:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DDD51BF3C4
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A4E160598
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_2et3vB99HM for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 17:55:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9D160596
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 17:55:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b516:f6a7:f8a5:a82e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 09572200055;
 Mon, 13 Dec 2021 18:55:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639418128;
 bh=Pgqd5egdMgwk0g5SRGeerJD/6eMAJdh9J2VyGFqE/oU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZOBG1MVhI8wCiPYwFAqBt9s7PCWMNPvw7j1fIs14+KVxzELLf8MGQOhJN347meji
 GV+n1KW2jofYKh/3Mg7PSbiG+ejHZIhcynG/UrPV+fdT7zu9mAgILwVuzAEyCeXBR3
 zFzpQHSKZj4/8nE4H0IkGCzXcbZHJc+zZ3qETgEZ4qvrGRNiPZhQV2lgHnqH5P1CGk
 MEQp65ZcKuf7xz6cjx5LAzTPY2qF0e7BwxusBGTSCTZuf0hH+57OFpwKlFqCf3jjyA
 N7ST2sj/drUiSwjfuDEmtAXZ7wIz2LuLrf4TIb2utlC1qi+r41QDaqoMiidY41Vpr0
 b2koxir9BGffQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 13 Dec 2021 18:55:21 +0100
Date: Mon, 13 Dec 2021 18:55:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andrey Nechypurenko <andreynech@gmail.com>
Message-ID: <20211213175521.GF2603@scaer>
References: <CAOiXNkBa2iycZvTW3pmSzHq6EmWTGoQfD_iHQ5mWyDyVRBYHeg@mail.gmail.com>
 <5be296cc-0cc1-77c1-01dd-8cffc8ecbefd@mind.be>
 <CAOiXNkCVncE4gGNU9Bhu_sZcVgZfF5eemYGrLRdk1DHeuFSu+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOiXNkCVncE4gGNU9Bhu_sZcVgZfF5eemYGrLRdk1DHeuFSu+Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] -E flag in apply-patches.sh
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

Andrey, All,

On 2021-12-13 17:44 +0100, Andrey Nechypurenko spake thusly:
> > > I am wondering if there are any particular reasons to have the -E flag
> > > and if it would make sense to remove it from the script?
> >
> >   I think that's purely historical, from back in the days when many patches were
> > downloaded externally and some of them could be really odd.
> >
> >   I expect that none of the patches that we have now still need this. However,
> > you should probably check:
> >
> >   - all patches in the buildroot tree;
> >   - all patches downloaded from somewhere (git grep 'patch\|diff' -- \*.hash)
> I looked through the patches and did not find anything suspicious (however,
> no 100% guarantee :-) ). So would you consider removing the -E flag from the
> script in the upcoming release?

Could you send a patch that does that, with a commit log that summarises
the situation, please?

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
