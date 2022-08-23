Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF63C32792
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 09:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A03D181763;
	Tue, 23 Aug 2022 09:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03D181763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0i5LVZsdSmn; Tue, 23 Aug 2022 09:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA1AA81375;
	Tue, 23 Aug 2022 09:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA1AA81375
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D51F1BF294
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 09:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21A5C404CF
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 09:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A5C404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hmxg_nrrE3ob for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 09:30:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD23E40168
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD23E40168
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 09:30:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5cb:81c2:970c:cd58])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 21F962003DD;
 Tue, 23 Aug 2022 11:30:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Aug 2022 11:30:51 +0200
Date: Tue, 23 Aug 2022 11:30:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220823093051.GA2775145@scaer>
References: <20220820113352.4976-1-fontaine.fabrice@gmail.com>
 <20220821094911.GR2775145@scaer> <20220821120304.GU2775145@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821120304.GU2775145@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661247054;
 bh=fdkzEWqoo05BdiyMND5KUJAxu7IlABTRrdTD/foVJMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFRTs1t1D9HfreRmT2gOwk4BOVcK6MLgeas27VMisEbUeLw6frobZq7nlU+szDX98
 U3eFt1w/U4LrSY50jDuwvS+I/z5yROAX1vcsoF4k1VzZgJ/+obFb1Jpep/orOqQnCy
 4QFv5mrs8thiqQ3iYquKs0KDnpM59lzkaFfwKVvT7kmOkiAIUKvtz+1gkHrTJEnfvu
 2bMQSAilfhdz/t1zw2h95R32/1x2Fz3klgq+RTv8fIYilAY1GuvRxt+Yg897tQ47Uu
 Fo7ZTUC27QujwdL8Ltk37X7o7Z2sGEuoRfJzqjFHO0h/U8CE5XcDmTSLtgiHUbkHvz
 6Qx5Qks1nW7zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JFRTs1t1
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add
 jquery-ui-themes handling
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

Fabrice, All,

On 2022-08-21 14:03 +0200, Yann E. MORIN spake thusly:
> On 2022-08-21 11:49 +0200, Yann E. MORIN spake thusly:
> > On 2022-08-20 13:33 +0200, Fabrice Fontaine spake thusly:
> > > Add a custom case to make sure that a random configuration with an empty
> > > theme for jquery-ui-themes doesn't fail. It reverts to
> > > BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE in that case.
> [--SNIP--]
> > I am not sure how we can end up with an empty BR2_PACKAGE_JQUERY_UI_THEMES_THEME.
> > Indeed, it is filled from a choice, and unless there is a typo in one of
> > the config options, there are as many defaults for it as there are
> > entries in the choice...
> > 
> > And if you look at the .config file, there is actually something
> > selected in that choice, BR2_PACKAGE_JQUERY_UI_THEMES_VADER=y, but
> > indeed BR2_PACKAGE_JQUERY_UI_THEMES_THEME is not even set. It's not that
> > it is empty, it is not set at all!
> > 
> > So, the .config file is not correct.
[--SNIP--]
> So, for fun, I had the following snippet run:
>     while true; do
>         ./utils/genrandconfig 2>&1 |grep KCONFIG_SEED=
>         if grep -q BR2_PACKAGE_JQUERY_UI_THEMES=y .config; then
>             echo 'Got JQuery UI themes...'
>             grep BR2_PACKAGE_JQUERY_UI_THEMES_ .config
>             grep -q BR2_PACKAGE_JQUERY_UI_THEMES_THEME= .config \
>             || { echo 'Missing theme...'; break; }
>         fi
>     done

This has now been running for almost 48 hours straight, and there has
been 10005 configs generated, 55 with BR2_PACKAGE_JQUERY_UI_THEMES
enabled, of which none with BR2_PACKAGE_JQUERY_UI_THEMES_THEME unset.

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
