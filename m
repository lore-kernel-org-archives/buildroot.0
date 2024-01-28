Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3592C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 21:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE454027D;
	Sun, 28 Jan 2024 21:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CE454027D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TVBs9g6-5X3; Sun, 28 Jan 2024 21:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7162740101;
	Sun, 28 Jan 2024 21:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7162740101
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41D0A1BF321
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21B4C40391
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 21:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21B4C40391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyj75n0WwYCo for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 21:02:50 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DC0D4016D
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 21:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DC0D4016D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6BCFF13F880;
 Sun, 28 Jan 2024 22:02:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Jan 2024 22:02:44 +0100
Date: Sun, 28 Jan 2024 22:02:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Abilio Marques <abiliojr@gmail.com>
Message-ID: <ZbbA9L77KcWxTr_y@landeda>
References: <20240128183024.3322187-1-abiliojr@gmail.com>
 <CAFOYHZAFjAyu38jik9KSX8CfVdjRHJE4yPdgSC6tNY=C3UAnqA@mail.gmail.com>
 <CAEWqYrWrwGjAsNht+0bjJyXaTc3XGwpz+cdZGoQHCrzifYSYMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEWqYrWrwGjAsNht+0bjJyXaTc3XGwpz+cdZGoQHCrzifYSYMQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706475767;
 bh=l591aXBBPxdWtnWrBF2xoFUWodkCGuE964u1wzOi4Yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bh0mEGT3CQ3/MGJmccaPV9VcHeRMBNohsQGCiWvGjWTdUrEDeUQCPcDNSOvxeAZwR
 rsT3Nj5gJdfgtbKZhm0RqgAFOjJ9B/iSvdlFMD/JQeOgidXu9SojKmKsk2sycJLt/r
 /nyzm2kkFPiU2Y9xIgkdyZR0rf/26nPtq9OU6t6BkZVIJFSsNhirNv3mca6csgYHzN
 zTujUgqI3aNCLmsDjMPpQn02gF42IAucWTrf9Ql1jhNMLeUFqQRAFlm9vLtXRmCJgb
 aPNrJTcVv3oeQrlxkagfrQF8PfhaNkOEP5EAL65uKPcLkfnHrIZgQswsDvMrb9EDsx
 mSHUokyzaJqEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bh0mEGT3
Subject: Re: [Buildroot] [PATCH] package/micropython: make use of recent
 micropython-lib
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
Cc: Chris Packham <judge.packham@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Abilio, All,

On 2024-01-28 11:28 -0800, Abilio Marques spake thusly:
> Because this is my first buildroot submission, I tried to keep it simple. It
> makes use of existing micropython tools (used to process manifests) to discover
> the list of packages available in micropython-lib. My hope is that by relying
> on them, any future changes in directory structure will be covered by their own
> "manifestfile.py" tool.

This is a good rationale, and maybe you can add that to the commit log.

> Also, it still copies the files as plain source code ".py" files. I did it this
> way to avoid abrupt changes that could annoy people using the package.

Yes, agreed.

> I have an idea that mixes part of my code (the one that discovers the packages)
> and freezes them (using the same manifests tool), but I thought it would be a
> bridge too far for a successful first submission.

Agreed: I like that your commit does not change the existing behaviour.
This is good.

> Also, I want to find time to
> make it configurable using menuconfig options (each one has it's drawbacks):
> - frozen as mpy files
> - frozen inside the micropython binary
> - keep current text files

We have a similar choice for the full-blown CPython, where we can keep
only .py files, keep only .pyc files, or keep both. So si=uch a choice
for micropython seems totally acceptable. Just o make your future
changes better, it would be two separate changes;
 1. introduce frozen vs. text choice
 2. add frozen-in-binary to the choice

> If there is interest, I can prepare it in a couple weeks from now. Ideas are
> welcomed.

The interest is on your side: if you do not have that interest, do not
do it just for the show; a new feature needs to have someone that
actually needs it and tested it (to some extent).

And speaking of tests, we now have a micropython test:
    support/testing/tests/package/test_micropython.py

So it would be nice that, when/if you add the frozen support, you extend
that test to also test frozen libs.

Thanks!

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
