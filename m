Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2DCC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 12:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37FF340A15;
	Sun, 17 Jul 2022 12:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37FF340A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tv6gAj1RSKkt; Sun, 17 Jul 2022 12:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4105D40412;
	Sun, 17 Jul 2022 12:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4105D40412
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B15481BF228
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B54A60B09
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B54A60B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOTltpy1ET6y for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 12:59:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805E360AFD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 805E360AFD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 12:59:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A8D2D7804FE;
 Sun, 17 Jul 2022 14:59:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 14:59:24 +0200
Date: Sun, 17 Jul 2022 14:59:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <20220717125924.GE2107091@scaer>
References: <20220711131823.116481-1-foss+buildroot@0leil.net>
 <165756918502.1398129.13899758729447253604@Monstersaurus>
 <d94fd831-60af-3837-f32c-e598863f5106@theobroma-systems.com>
 <165770292986.1813977.9808714201757010261@Monstersaurus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <165770292986.1813977.9808714201757010261@Monstersaurus>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658062768;
 bh=35X/rQCEawFyd48ou+S+Hb0AMJb6/6hDyqs0Q/zGaVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQJm9K5prsSs9G9ODp65fp1RXO3vUlz+1IoBHC5GjuFQrLhuGctTwGIbuyg3+3ctb
 fv5e6yStRHPyPG7W5pxyWVGuv8uBnu9niLk3Z10AqS6WfruGmn/QF8ynZe3A2pJvng
 d0imcN1PYDLvcueoweODBzriZmeptMsDlJNXiFDztMaLvY4kxVKzbbHkobP18MCIJX
 HdY0U9CQKuKonfb1X4ILcrWb7n1Y0RKLGgmUsS811XEaATIkLgAhc38Nh3mLl9MNfw
 i+gT7Da8ctxseGNCOVttVr4XcKZYu4D/XmoA39SQZJnCVbGUQ7vLzhyO3ZQIoWsNrG
 XwQAloB19o2FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NQJm9K5p
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: add explicit
 dependency on libevent if libevent package to be built
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kieran, Quentin, All,

On 2022-07-13 10:02 +0100, Kieran Bingham spake thusly:
> Quoting Quentin Schulz (2022-07-12 09:00:51)
> > On 7/11/22 21:53, Kieran Bingham wrote:
> > > Quoting Quentin Schulz (2022-07-11 14:18:23)
> > >> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > >> If libevent is present in the sysroot, cam is built.
[--SNIP--]
> > >> This fixes the possible race by expliciting the dependency to libevent
> > >> if the libevent package is enabled. Otherwise, explicitly disable cam
> > >> building as it's already known that it isn't going to build.
> > > I'm not opposed to this as it fixes the race though. I guess it depends
> > > how much resistance there is to adding a specific libcamera kconfig
> > > option to select cam.
[--SNIP details--]

For now, I've applied just this patch. Since you said can is just an
optional, test component, that is good enough as is.

If there are more complex conditions and new dependencies in the future,
we can revisit that, and add a Kconfig option to explicitly enable cam.
That option would be responsible for 1) select-ing needed dependencies
in Kconfig, and 2) add the proper dependencies and config flags in the
.mk.

Until then, the current situation is good enough (for me!). Thanks!

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
