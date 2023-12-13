Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028E1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77825435F7;
	Wed, 13 Dec 2023 20:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77825435F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUYzD-5ZEm4H; Wed, 13 Dec 2023 20:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 688A543608;
	Wed, 13 Dec 2023 20:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 688A543608
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A65431BF475
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 781CF615F3
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 781CF615F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UB8bK-Mj1KL for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 20:41:43 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27C41607D0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 20:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27C41607D0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e0bf:72a9:b9c2:ca5c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B635B5FFB1;
 Wed, 13 Dec 2023 21:41:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Dec 2023 21:41:36 +0100
Date: Wed, 13 Dec 2023 21:41:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Message-ID: <ZXoXAGjMvtSoahwd@landeda>
References: <20231209214918.2071047-1-michael@amarulasolutions.com>
 <20231213210804.39fe194f@windsurf>
 <CAOf5uw=zfi=zOPh=K-kaT5MmScBxqod3okjxtnK600qn4_sZpA@mail.gmail.com>
 <20231213212416.642d5dab@windsurf>
 <CAOf5uwkdWm8kWZT2y_ZHO9H26hUri9jZgYHj37ah1VjhNm4LmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOf5uwkdWm8kWZT2y_ZHO9H26hUri9jZgYHj37ah1VjhNm4LmQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702500099;
 bh=wv6oF/YFl1lA+5Bk3s2eHN0iV+GnMNyiH63BHf3G8iA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKv3gUVUDKvCfVSgQR8LNuJBoftWlxtDL1yEBWhhzAY8QQeT3f9rPjjwftXuhx15i
 OMRRl/7JGMQi3LBdcxuxK7VZz2e8KQ4Js4qFa78yco6Il/mIPYIJQr3ydA9tvz3KvS
 3RTexo9uEEYcUyQQ8r4KmlOOB6StIAW6mmoaQEpuiNg+WruUB+yvO+H53xrtx1yJZr
 ZK34u6S4vRphVdGRmFaap6RPkXmoUd4pkGs9oF6LIZfW/916volYFzr13GOwiLfCJC
 Xs5uLh1uO2YQT4S+46anXd/bJAyheqBVydx2XCTV80NwunmS16TPF8uWWuVos3MrFL
 5NKiMRVRgJfOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fKv3gUVU
Subject: Re: [Buildroot] [PATCH V2] package: gdb: Add helping kernel gdb
 functions compilation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Micheal, All,

On 2023-12-13 21:32 +0100, Michael Nazzareno Trimarchi spake thusly:
> Il mer 13 dic 2023, 21:24 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ha scritto:
> > On Wed, 13 Dec 2023 21:17:34 +0100
> > Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:
> > > My V1 was addressing your concern?
> > No, your v1 was just adding a Buildroot option that allows to enable a
> > kernel option. This is useless, as you can simply enable the kernel
> > option in question, and it doesn't make any sense for Buildroot to
> > replicate 1:1 each kernel option as a Buildroot option. It only makes
> > sense to do so when enabling the kernel option requires that Buildroot
> > builds additional host tools/libraries. But for something as simple as
> > enabling CONFIG_GDB_SCRIPTS, just enable it in your kernel config.
> I don't think that I enable any option and I just run an other kernel
> target. Yes but definitely I understand your point. My idea was to keeps
> some tools build as option as the serial proxy.

Thomas' point is pretty fair, in fact, and it should have hit me as well
when I reviewed v1: if one wants to do kernel debugging, they should be
responsible for enabling all appropriate options in their kernel. One
such option will have this script installed.

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
