Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33658C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:04:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 745AB61A3D
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 745AB61A3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29B5403DF;
	Thu, 30 Sep 2021 20:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4bb76a3RapU; Thu, 30 Sep 2021 20:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DFE6403DC;
	Thu, 30 Sep 2021 20:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0CC1BF9B6
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1988B607EF
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Ga223EyYcfj for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 20:04:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48706606E9
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 20:04:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1957:9ac2:5e5e:60b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E0465B004E8;
 Thu, 30 Sep 2021 22:04:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633032249;
 bh=fhp4Gta8Y32Dm6BmdmjlEMlfvEeX25Qgzbb/mYuTJ2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DApL6QWS2GDaaA7LnjAI/5MUbU1gEC4B2YHYMlkb0uoO3iGoN8kdY6IaWlpW3gE29
 J6qchweXwem1BZppHKkkVszqwjCp0mD6J8Q7JkByNDJKlJHtQg+LjLvGEhAAzXLGUT
 PSJg4/sgUzLTy3RjUyedvRTsCP+QKf1HClw23TzvCTA71L39LNo/8UqNmG73C20Dpm
 XJGmxfL9JL/X3Rfk4SqGPWh12WM+Wjga4zIqAQcjnUkjT5tJ2O0u7lAI//GvXslnkB
 j3YgRWVnD0s5dZ+OMuw85azcjY6yu8SHabvm/U7u1mkpi8GMPsp3ce87G706gs822A
 dK2NMCxTshInQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Sep 2021 22:04:02 +0200
Date: Thu, 30 Sep 2021 22:04:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210930200402.GO1504958@scaer>
References: <20210921205112.39176-1-petr.vorel@gmail.com>
 <fee5adb3-0cd8-3538-bf3e-d04af8153007@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fee5adb3-0cd8-3538-bf3e-d04af8153007@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC PATCH 0/2] use `command -v' instead of `which'
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

Petr, Arnout, All,

On 2021-09-26 23:32 +0200, Arnout Vandecappelle spake thusly:
> On 21/09/2021 22:51, Petr Vorel wrote:
> >I've tested the patchset on dash as the default shell. But it certainly
> >deserve more people to have look and test.
> 
>  Well, as the commit message says: it's POSIX so it should be supported by
> everything. which has a much smaller chance of being supported.

This is causing quite some issues.

First, 'command -v' does not behave the same way 'which' used to, when
passed more than one parameter, because some shells are not compliant to
POSIX (this might be a bug, but nonetheless it affects the most widely
used shell out there, bash) [0].

Second, this is causing a lot of error messages:

    $ make defconfig
    [...]
    $ make help
    make[1]: command: Command not found
    [...]

The original commit reports that 'which' is broken in Debian, but I was
not able to reproduce in Bullseye, where 'which' still works as expected
and does not emit any extra warning.

So, we are trying to fix something that is broken on a development
version of Debian, but that still works in all known released
distributions.

I usually am quite in favour of sticking to POSIX tools, but which has
been ubiquitous in the past 30 years or so, and I would consider that
Debian's which *is* broken for reporting such deprecation warnings.

So, I suggest that we do revert this patch, and work on a better
transition away from which, if at all. One very quick solution would be
to bundle our own which in Buildroot and then we'd have a quick way out
of that Debian's mess...

Anyway, I'd vote "revert".

Regards,
Yann E. MORIN.

[0] https://lore.kernel.org/buildroot/YVTIghzHs82uFBIe@pevik/T/#m95c17eb8374e4e3dd6eee700d397aa12cca0739e

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
