Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D072C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BC0B400C1;
	Wed, 10 Jan 2024 20:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC0B400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YC283b8LO0un; Wed, 10 Jan 2024 20:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C165436E5;
	Wed, 10 Jan 2024 20:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C165436E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DDB41BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03F5F61493
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03F5F61493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2r-8DF3VyFAt for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:28:05 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B791613FF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B791613FF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 317ABB005A2;
 Wed, 10 Jan 2024 21:27:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 21:27:58 +0100
Date: Wed, 10 Jan 2024 21:27:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZZ79zkGzIJT0P9CR@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
 <ZZF8dBumVmvof2KW@landeda>
 <05f3360d-4383-4c7a-9b49-b453dd0ae46e@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05f3360d-4383-4c7a-9b49-b453dd0ae46e@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704918483;
 bh=Od0+inxqZynaUNsoX/iCCbl4OCJlCM0YAlbgvOUEH+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SwHclNjAT839Ge+8xjtyfOgejO9hCHmZzLBS9aEDpdmgkevLqgrrBUAAnQ8ff5yxn
 xJAtO/ipENqzlvacPAa64oLojvX0I9pqjnt7YaFjM6kK/xHR9ezXziiiyfsarNwNd3
 DH8hg9B6KTxT5mDkC+dJAS37wzWBAZCo/l/FMH8xHrGsTZEqqzzYSoIeNvzgLwXCDs
 I844RL7yE7yM2zNwiu3HUCVmJvPgmg7ExNxJuxBveKFbcKpJoriynpv2hhmYLcUWK0
 6SnmIQYbzFtkQudnJ85nghopiDwsUUpXungaIVbt9tG0HIj6LwTVCLg9BscAZPbFFI
 rGAvbt8iBMVjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SwHclNjA
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: romain.naour@smile.fr, sebastian.weyer@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

On 2024-01-10 15:29 +0100, Antoine Coutant spake thusly:
> On 31/12/2023 15:36, Yann E. MORIN wrote:
> > On 2023-12-28 16:26 +0100, Antoine Coutant spake thusly:
> > > ripgrep previous version hash is no longer valid.
> > > The tarball is modified by rust vendoring so the hash
> > > may change with rust versions.
[--SNIP--]
> > However, as you can see in the rest of this thread, the issue has
> > nothing to do with cargo vendoring, in fact, and is caused by an
> > unrelated change in the download infra (my fault!).
> I'm sorry for the confusion I caused by my misunderstanding.
> Thanks for all your research!

Don't worry about it. I got to identify one of my screw-ups, so that's
fine!

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
