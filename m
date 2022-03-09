Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065A0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7933460F8C;
	Wed,  9 Mar 2022 20:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wk3Hk279uJN2; Wed,  9 Mar 2022 20:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A37CE60F18;
	Wed,  9 Mar 2022 20:10:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC271BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 075BB60F18
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3eHqpy7QgH22 for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:10:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A757160C2D
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:10:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:959:4871:d6cd:4ee3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3737913F814;
 Wed,  9 Mar 2022 21:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646856634;
 bh=qzyf3WM3BOmNrqIXWPR9WVpl+GZdikRiAPQzJicu7RU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mtGTkB98aiQSUPz+YPkz/zo8R938G58rxh9AiXI1/0atjLFbA2U/6g5ZYKXw9lAMG
 O3h9Av+vI+chOIikZjmdEeVeGjuHIpWCdQJ5HTESS1NHAw29bU+bsfQA3ciAhpA917
 UsOLNrymRXgC4oa1FQXENMVo0emPfaV+wYvzkhdHqX6xbshNAwP1sNRtR/V5LWnAg5
 h7w+g1HxQsJ1d4s8Yz0+aY8nA3Q7hdpmtMyUHJgF239WPauBW2JLQw8p30dEDaUSxQ
 cIZb+8RMf+mvAkFXB7btcC1PtuwvGfrcT6F8BmQ4I+qkSjqrUYO39Vo1pmRltBdQ/N
 bdmKnOzucIesw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Mar 2022 21:10:30 +0100
Date: Wed, 9 Mar 2022 21:10:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Simon Doppler <dopsi@dopsi.ch>
Message-ID: <20220309201030.GA23050@scaer>
References: <0e6293a1-fa3e-4399-b963-14634d3578ad@www.fastmail.com>
 <f4e356e6f59e8746890bbdc07ed684115043e762.camel@dopsi.ch>
 <94327194-ed5b-42c2-8ece-45c0368c9622@www.fastmail.com>
 <3677050fbcbf7d7e31d8c6c12924f648d0e37d2a.camel@dopsi.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3677050fbcbf7d7e31d8c6c12924f648d0e37d2a.camel@dopsi.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Patching buildroot package makefiles with
 BR2_EXTERNAL
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
Cc: Danilo <mail@dbrgn.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simon, Danillo, All,

On 2022-03-09 11:30 +0100, Simon Doppler spake thusly:
> > > I did expect that adding the dependency as you did would work but
> > > it
> > > failed: they show up when running `make arm-
> > > trusted-firmware-show-depends` but not in `make arm-trusted-
> > > firmware-show-build-order`. Does the same happen for you?
> > 
> > Yes, same issue for me. "make nginx-show-depends" includes "nginx-
> > rtmp-module",
> > but "make nginx-show-build-order" does not.
> > 
> > Manually building the module before building nginx does work, but it
> > would be
> > nice if there were a clean fix.
> 
> I submitted a bug report [1], with some extra info I found by digging
> around today.
> 
> I will continue to dig around in the coming weeks but it will still not
> be high on my priorities.

The value of FOO_DEPENDENCIES are used to generate Makefile-level
dependencies, and that is done at the time a package infra is called.

I.e. when your foo.mk has:
    FOO_DPEENDENCIES = bar
    $(eval $(generic-pakcage))

This is turned into Makefile code like:
    foo: bar

Which means that, modifying FOO_DEPENDENCIES later on will have no
impact in the actual dependency chain.

br2-external trees are meant to add new packages, and it is not possible
to modify existing packages.

In the current state, you have no way but to modify nginx.mk in the
Buildroot tree.

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
