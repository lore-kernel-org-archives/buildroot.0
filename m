Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C4EC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C27441223;
	Tue, 15 Apr 2025 19:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR-dH92VCJUE; Tue, 15 Apr 2025 19:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914B74121B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914B74121B;
	Tue, 15 Apr 2025 19:47:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DF95109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C3996178F
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISi3W2DwciEl for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C7006129B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C7006129B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C7006129B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:47:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6028919F734;
 Tue, 15 Apr 2025 21:46:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 15 Apr 2025 21:46:57 +0200
Date: Tue, 15 Apr 2025 21:46:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <Z_63sTGxwXvJJhEp@landeda>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <7fec02abce143ebc20b3656c6cdcdf803c7dd760.1744229017.git.yann.morin.1998@free.fr>
 <56bc8-67fe2d80-1-26168cc0@111660538>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56bc8-67fe2d80-1-26168cc0@111660538>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744746420;
 bh=2B2fb1qmumZYuSe4oOS/CO7iWcgJ+KtXlIFMTaA3y7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMM/sZKIZ+3apVPBUdzIq++2zltd1SUrUw52gShnImnAuqnlY4XSuMjF8fYMWrWDH
 z7vmaglEbet6NQn/JhmI2BQQNwGmGXBQWNZVRf2b3f4OCzS62SegdjYLaH/TCvG0Ec
 cHJHA9crgpy1TmZAn4p0KG2EWfwoonMZKIsy4AmB3uVfSuvtwkhKleYpyCaHnA1ZB9
 POMRD8R2XuiBL6mRpmgNKaRumcFaBCDlnWZMKOu7yAwYBuhnV90/HPpIBMWfKT2oxZ
 gyP+MD57k1C65N2a8RyVCt0avMa13enpTh2v9PNHCIxcXwloSrCq7haPS2slEnlG67
 2jIT04gQAtYmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kMM/sZKI
Subject: Re: [Buildroot] [PATCH 23/29 v2] package/boost: bump to version
 1.87.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2025-04-15 11:56 +0200, Michael Nosthoff spake thusly:
> On Wednesday, April 09, 2025 22:03 CEST, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> Great that you took the time to clean up the boost package and bump it.

And just right after I sent the series, they released boost 1.88.0!

I guess I'll have to eat my own dog food to prove that my cleanups and
rework do indeed make it easier to bump. ;-]

> I had the bumping on my list for some time now but didn't manage to
> finish it due to the many C++03 deprecations in the last releases.
> I discovered some issues with some boost internal dependencies.
> Especially troublesome was using a gcc < 6.0 where C++11 is not
> set as default mode and the package pulling in the header dependency
> that required C++11 wasn't setting C++11 mode.
> 
> As I don't see any new BR2_TOOLCHAIN_GCC_AT_LEAST_* lines in the
> patch I assume you didn't look at this?

Indeed I did not.

I first wanted to make it easier to test boost, but this package is just
insane.

Currently, to update the dependencies of libraries is very difficult,
especially to drop no-longer needed dependencies. For example, since
1.72.0, contract no longer needs system. With the current Config.in,
this is totally impossible to detect, so much so that it has lingered in
Buildroot up until now.

To properly detect that, we need to manually edit the Config.in, remove
all dependencies, and build (configure is enough) libs one by one until
one breaks, at which point we can add the required dependencies, and so
on and so forth until all libs are covered. Given the amount of libs in
1.87 and beyond, this is just an insane work...

And when we have a solution for that problem, then it becomes easier to
pass boost through the ./utils/test-pkg harness, to test-build libs one
by one to check whether they get new toolchain dependencies...

> Here my list of packages that now require a newer C++ version (taken
> from the release notes):
[--SNIP--]

Thanks, that's very useful information! I'll have a look at 1.88.0 to
update that list...

Thanks for the feedback! :-)

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
