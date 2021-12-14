Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D68C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 12:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C713B60881;
	Tue, 14 Dec 2021 12:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWJzyvLQudhx; Tue, 14 Dec 2021 12:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489AE6080B;
	Tue, 14 Dec 2021 12:57:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0907C1BF30C
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 12:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 062966080B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 12:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wM2yWqsgNT5 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 12:57:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7252D6066D
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:57:46 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id x32so45882370ybi.12
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ltq1yQMaOUzt1zCul5jLgwzCMX1uYvoPWNWZyoln5X0=;
 b=pRwmptwR09PLzbdaKd/18vuy+hzPZyqZ+cIuVue3VfW8mHIR8BAs/yLF0wLf/Po5bs
 UOvE3BRUb9jEhdfi5rA9y/vjUf3bbT9km8lhkYDjkbC9ez2Gy4bqBuw/FHnTGUK+jWI6
 ykWHdz+9Y9wRCNOCi9g6byGpLcOqjF8Uio44LHaZGQY9aEZJAktZP2qg84P26YKRpSEC
 HYq0MgzlIxvUBu/wLY2aSTKybjtTSjhxrgBQMQ57A1TiHJOG97cnpCixYxrHQKYUcNdT
 bpKfWi9YFtnZB/yHtGGznkgXkAZ9xZ9omOGDnlYvDrcwdXizeckCI/ZA5RhivqmBmr/T
 D9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ltq1yQMaOUzt1zCul5jLgwzCMX1uYvoPWNWZyoln5X0=;
 b=EUcGaiUAo6XXdSWPKB2l8VYn7jT3V7hIBPYXxYPFwUP6PDoJvvHBAw5k7Jh215dNEk
 HN//pCjdQEKGP5tbs3HUZzJ7GXfbB5taU/EPOAYSW81hfcLDSlcOsFt2mNz4XB8x31gG
 WypiYiha7gHQdx18L6UNkZA5BQU0lToCYG1IZo8MgFjT8hCXKvoLavAjm4QOC6jBdIHO
 8TYB+TgUsYLuPpIqEUMpyaemom0wDHvDPHGjFMRoAFeIgaoVjPGd0XE9/t+xsgGAQacJ
 AXD5t4bnPteC2JJ+S0G9wLGMDiy27/GF2OZjR/jrg+FpNvSmjFIENgV8TvjoYrHTcl3j
 YWCg==
X-Gm-Message-State: AOAM533PVcxceQonJVL6chMrWdZz0MVT53bEsx1buAI/Ss0msOH4nOrE
 bCXppS/d25X0unq6Mt8WCeZG23K1Atc1BKbjYOtJoaVIrjImug==
X-Google-Smtp-Source: ABdhPJyJk0BZJ+k5cCUklA4dvSPbSsQKOaIyaaAhkfbPlhRtMbB2gGgH9lph6L2ngo9Dv+j2w6jvXA1Wo/wpTolVEGo=
X-Received: by 2002:a25:db8e:: with SMTP id g136mr5372469ybf.301.1639486665358; 
 Tue, 14 Dec 2021 04:57:45 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkBa2iycZvTW3pmSzHq6EmWTGoQfD_iHQ5mWyDyVRBYHeg@mail.gmail.com>
 <5be296cc-0cc1-77c1-01dd-8cffc8ecbefd@mind.be>
 <CAOiXNkCVncE4gGNU9Bhu_sZcVgZfF5eemYGrLRdk1DHeuFSu+Q@mail.gmail.com>
 <20211213175521.GF2603@scaer>
In-Reply-To: <20211213175521.GF2603@scaer>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 14 Dec 2021 13:57:33 +0100
Message-ID: <CAOiXNkDjkt-8dwsypLkOKqagOuG=0-fHuW7FjM=SdsqJ=TL++Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
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

Hi All,

On Mon, 13 Dec 2021 at 18:55, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Andrey, All,
>
> On 2021-12-13 17:44 +0100, Andrey Nechypurenko spake thusly:
> > > > I am wondering if there are any particular reasons to have the -E flag
> > > > and if it would make sense to remove it from the script?
> > >
> > >   I think that's purely historical, from back in the days when many patches were
> > > downloaded externally and some of them could be really odd.
> > >
> > >   I expect that none of the patches that we have now still need this. However,
> > > you should probably check:
> > >
> > >   - all patches in the buildroot tree;
> > >   - all patches downloaded from somewhere (git grep 'patch\|diff' -- \*.hash)
> > I looked through the patches and did not find anything suspicious (however,
> > no 100% guarantee :-) ). So would you consider removing the -E flag from the
> > script in the upcoming release?
>
> Could you send a patch that does that, with a commit log that summarises
> the situation, please?

Done.

Regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
