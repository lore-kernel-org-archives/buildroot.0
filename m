Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267CFC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 20:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C166483B47;
	Tue, 16 May 2023 20:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C166483B47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DK8faXVP9T1; Tue, 16 May 2023 20:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D2783B40;
	Tue, 16 May 2023 20:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D2783B40
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D76191BF426
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDEE783B3E
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDEE783B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khTiu3tUbUmM for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 20:40:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805C983B3B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 805C983B3B
 for <buildroot@uclibc.org>; Tue, 16 May 2023 20:40:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f076:d76d:8eb4:8bac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3F30D13F846;
 Tue, 16 May 2023 22:40:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 16 May 2023 22:40:42 +0200
Date: Tue, 16 May 2023 22:40:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230516204042.GQ2582048@scaer>
References: <20230516173411.823978-1-bernd.kuhls@t-online.de>
 <20230516190356.GP2582048__25958.2416781754$1684263867$gmane$org@scaer>
 <pan$57d23$1814592f$72a94616$524b4e2b@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$57d23$1814592f$72a94616$524b4e2b@ID-313208.user.individual.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684269645;
 bh=mPYXiUBWzF5DMWSERMK/GTbOyeI/UmHl/MEZsKpMgv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OijDEZgSUftOy7asYYaCn1ZUHKCKC5Z53ufbbp/yRo47bHeaFj96ydlQng/bv7VSC
 UJ88o3Td+y3nsA7f+BuY2vvY8YGPh/ropkTFhaCH1K7NfpJ9zXX2N7h9PiQDZJhizM
 exXqPyK3FJNKEzNfb79CfvJfMRWi1on0WG9IqUemzPpnPJLEmzpmebH/9BnCCL2Nej
 okhEdgSPA//JkHaBgRfvC5HBJ7Mk7ZtYIwxfE1K6itA2wGXfUluNrFf14N6h6xALy3
 VdydzQftSi4vHqOV4+RfTAbaw80djieisk+yJmz0Cc6T8oIX+5cbXpLkMMhKu0Abxq
 kYSc1ZOAQ+rgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OijDEZgS
Subject: Re: [Buildroot] [PATCH 1/1] package/icu: disable icu-config for
 host package
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-05-16 21:08 +0200, Bernd Kuhls spake thusly:
> Am Tue, 16 May 2023 21:03:56 +0200 schrieb Yann E. MORIN:
> >     diff --git a/setup.py b/setup.py
> >     index 176c9ab..961a7e9 100644
> >     --- a/setup.py
> >     +++ b/setup.py
> >     @@ -68,7 +68,7 @@ elif platform.startswith('freebsd'):
> >      
> >      CONFIGURE_WITH_ICU_CONFIG = {
> >          'darwin': False,
> >     -    'linux': True,
> >     +    'linux': False,
> did you run-time test your proposal?

Nope, it was just a quick analysis to drive you in another direction
which I believe is better.

> During my tests a similar fix was not enough due to https://
> gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L93

Indeed. Then just patch it out too...

If we don't do that, then an icu-config on the host *is* going to cause
an issue, even if that's not our icu-config. So pyicu must be fixed.

And since pyicu already has support for using pkg-config, then let's
just ensure it uses that instead of icu-config.

And of-sourse, that means pyicu needs to gain a dependency on
host-pkgconf...

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
