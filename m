Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0810C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 17:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7981C401F4;
	Mon, 13 Dec 2021 17:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZW3umoeKApk; Mon, 13 Dec 2021 17:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E7E401F5;
	Mon, 13 Dec 2021 17:57:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAFBB1BF3C4
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D61B26059B
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKqywhySiaAP for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 17:57:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0677660596
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 17:57:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b516:f6a7:f8a5:a82e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CFC1E2003ED;
 Mon, 13 Dec 2021 18:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639418250;
 bh=yY0MfGHTbSBVvMCl+QrD6NQkX9UFBKJ9CgsrwKk4fxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=erjICUHfTl2rJ9e/XP+mQLIDsmzsMbA37w+CMNBiV6DUk9lQEBLWu94lfL2ncPrAL
 5X5a8aMxya/TyKG+E1yuz32gXA/n/76/dI3og909oERhk0yC1ZwQM6MThxwdJz9eBT
 wl9tf9PxEl01b1UAkD1OKZryG2o5Y3rU0BzANd4pe0r3q43Upm0nxmJgRIFsEPnsZQ
 Vkzh+ilyckbcVGASDPMzb7PvVd0ecL5zWYWweYurSR6p4beZgLqQ64jpl2X8UzANn/
 FN9z5L1/8nzPzREkFdx2ePJxnidrzeTBFA4GGf/07FHtP+TRksCcxacU/aLHiSelJO
 UHOQMMNZflm1w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 13 Dec 2021 18:57:23 +0100
Date: Mon, 13 Dec 2021 18:57:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20211213175723.GG2603@scaer>
References: <20211119163001.GP247986@scaer>
 <95d95463a351d4c6d2144cffd2824f92@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95d95463a351d4c6d2144cffd2824f92@umbiko.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] linux: add dependency on host-libyaml
 for v5.16+
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2021-12-13 09:20 +0000, Andreas Ziegler spake thusly:
> On 2021-11-20 10:24, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >Paul, All,
> >On 2021-11-17 22:06 +0000, Paul Cercueil spake thusly:
> >>Starting with 5.16, host-libyaml seems to be required to build
> >>Device Tree blobs.
> >
> >So, as we've discussed on IRC, this is far from sufficient to make
> >linux-5.16+ build.
> 
> With version -rc5, Linux 5.16 dropped the dependency on dtschema and yaml:
> 
>   "Revert schema checks on %.dtb targets. This was problematic for some
>    external build tools."
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Makefile?h=v5.16-rc5&id=a84e0b319908e297b04392879bd8ce7a8338c1ab

Great news, thanks for the heads-up!

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
