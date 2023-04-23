Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A2FC77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 19:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBCA81F07;
	Sun, 23 Apr 2023 19:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CBCA81F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gt1t7MSJHmkj; Sun, 23 Apr 2023 19:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D46881E05;
	Sun, 23 Apr 2023 19:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D46881E05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 336EC1C2B1E
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 19:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D02D81E05
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 19:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D02D81E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbE--oMl5pn5 for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 19:41:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C340381E04
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C340381E04
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 19:41:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:786a:5f81:2188:6ed4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AECB75FFBA;
 Sun, 23 Apr 2023 21:41:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 21:41:38 +0200
Date: Sun, 23 Apr 2023 21:41:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230423194138.GO2696@scaer>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
 <20220731193521.1217825-15-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220731193521.1217825-15-ricardo.martincoski@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682278900;
 bh=gVqvBBWHm/MMbFT81QcRaz++ASHBeL1V0HGDAk4x0VM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d28srx6yyr7GvuqTWzHw0cDqA7f9eH3C5V1CnutR1cHucg0kZDNuEN49eSNlAyjQg
 YN16F9V77McV+sdYjenS7/VB9/7RHlRY2q9rDNcS1j74qwRkiUaj/fC14w4mFj83dh
 Bxq3xD3fETaCPI5K12x1uq80E7GjRq4p+05OMBfyCVFSHERlDiOVSTPH046EScwt28
 ZtuzvLT8etRbqrQ84UcGbMt+VdswdaLoQYhdFwVe10D0yUeI89C0mfCuGs6dyHzb0h
 +8OyVrSK2+hAo8BKWWh1oTT1VqYHMFlPfVAeA8DGVQO06joHuD60uigcwnGG/O8JEE
 SG+qMn9OvZCAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d28srx6y
Subject: Re: [Buildroot] [RFC 14/14] utils/git_hooks: new script
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

Ricardo, All,

On 2022-07-31 16:35 -0300, Ricardo Martincoski spake thusly:
> Add a pre-commit hook that can be used by any buildroot developer to
> prevent local commits that introduce warnings that check-package would
> catch.

The thing is, most users will not add that hook before comitting and
submitting patches.

> It can also be used by maintainers.

In fact, as maintainers, what we are more insterested in, is a
post-applypatch hook, not a pre-commit one. However, your script
does not work as a post-applypatch hook.

Furthermore, maintainers already have their hooks. For example, I have
been maintaining and publishing mines:
    https://git.buildroot.org/~ymorin/git/buildroot.git-hooks

Even if the history only dates back to 2021-11-14, I had those hooks
even before, and they are an aggregation of what Arnout and Peter
already had before and shared with me.

My hooks are a bit slow to run, as they run on all commits, even during
a rebase, or when applying a series of patches (which I do with a helper
around patchwork API). I am OK with the extra time it takes, but that is
not necessarily the case for other maintainers.

> This hook checks only the files added/changed by the commit, so it runs
> fast.
> It also skips the check when working in branches that do not have this
> infra.

> But when there is a change to check-package itself in the commit being
> performed, the shole tree is checked, since new warnings in the tree can
> occur.

Ah, this last part is nice, indeed.

But as a maintainer, when I see changes to, say, check-package, I do run
it to validate it, so changes in the ignore list, or new issues, or
similar, would get caught.

And if check-package et al. add new checks, either the issues it reports
were previously fixed (so we can run that new check unconditionally), or
the offenders have been added to the ignore list (or will be in the next
patch).

So, I am not sure this is important.

> At same time, add an option -T to utils/docker-run so docker can run
> without a tty, otherwise calling it from inside the commit hook would
> lead to this error:
>  the input device is not a TTY

I already applied a better patch, that automatically detects if a tty is
needed or not, see 3d8212c4b29d (utils/docker-run: allow running without
a tty).

In the end, I am not convinced we should have this hook in the tree...

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
