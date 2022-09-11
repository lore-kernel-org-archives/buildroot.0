Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B979FECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B338140F;
	Sun, 11 Sep 2022 19:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B338140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zb2a3hijgBPz; Sun, 11 Sep 2022 19:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 543DA813F5;
	Sun, 11 Sep 2022 19:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 543DA813F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 583A01BF281
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E046424E0
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E046424E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fon-zJOrUQc7 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:54:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9008424DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9008424DC
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:54:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BB54813F85A;
 Sun, 11 Sep 2022 21:54:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 21:54:29 +0200
Date: Sun, 11 Sep 2022 21:54:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220911195429.GJ898622@scaer>
References: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
 <20220911193046.GH898622@scaer>
 <a94b9207-0af3-10c0-dbde-1b7dbd8d8880@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a94b9207-0af3-10c0-dbde-1b7dbd8d8880@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662926077;
 bh=FyPIHbJZG0q+jN/vlmdq+khSwWds49qKDB6FUQVJR+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mT5eeGoGBu8YrkTSbLdiXHioYEnMEglilcxmwTZPm8Zra4hi1JsOjsdwM9GNL3/zJ
 n49p0Oy5E17PL5jv3c4LQ+LkmdOJ/3py1mYQYIzl0CKdFDdYJy7uU9lF0Co2jKRkp5
 6v8iPJq51NwWUfbcvN7QHQwuokZmhOkVDeAIgFod4mZ9pxIV2YElylAnVl8nAt6KpF
 yGaYm0xsRLlTd7mxiCkttJXcD+Esx72jMxMiA1M8gVSEDigogTsd2zWdVpWMiYB+7i
 gQP+H3oohkA0xdjf+9ET9lYzmBPK0OH/KSRhC5pSBcKENki/3WjEJWbcGIpwidawdV
 YNAIQNk5gcOyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mT5eeGoG
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc bug
 90620
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-11 21:43 +0200, Giulio Benetti spake thusly:
> On 11/09/22 21:30, Yann E. MORIN wrote:
> >On 2022-09-10 15:52 +0200, Giulio Benetti spake thusly:
> >>Gcc bug 90620 reappeared with gcc 11.x so let's update
> >>BR2_TOOLCHAIN_HAS_GCC_BUG_90620 conditions.
[--SNIP--]
> >>-	default y if BR2_microblaze
> >>-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> >>+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> >>+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_11
> >>+	depends on BR2_microblaze
> >
> >I am not sure why the switch of default to depends is needed, because the
> >same condition can still be written without changing the default:
> >     default y if BR2_microblaze
> >     depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
> >             || BR2_TOOLCHAIN_GCC_AT_LEAST_11
> It was an attempt to propose a standard shape to use here

Yes, yes, I see that it looked like other similar cases around it.

But my point is that, this make symbols with a single or with two
dependencies on gcc versions differ:

  - the former have a deault on the arch, and depends on the gcc
    versions,

  - while the latter have a default on gcc versins, and a depends on the
    arch.

[--SNIP--]
> >Note: this is *not* a plea for patches to fix that, at all. I just like
> >ranting a bit. ;-)
> Why don't we choose a standard way instead? This for next patches, or
> even to send a patchset to keep consistency between all the bugs, but
> I know that it doesn't add anything and can add regressions.
> 
> What do you think?

I a not even sure what the best is. The best is that they all folow the
same logic, but we currently have (at least) three.

The question is: what is the most important and defining dependency: the
arch or the gcc versions?

I'd argue that, for those microblaze-related bugs, the arch is more
important than the gcc version, so the default should be on the arch,
and the depends on the gcc versions.

So, if I were to handle following changes in that area, that's what I'd
like to see. But others may se things differently. It's a rather ad-hoc
situation anyway.

And no, no patch to standardise that.

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
