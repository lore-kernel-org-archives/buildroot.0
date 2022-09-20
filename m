Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEDFC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 15:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402CD40993;
	Tue, 20 Sep 2022 15:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402CD40993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxxUFT2HYIAm; Tue, 20 Sep 2022 15:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB3BE40980;
	Tue, 20 Sep 2022 15:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3BE40980
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA1531BF350
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 15:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85EC681468
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 15:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85EC681468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iv_n4ODiIlBF for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 15:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D1048145B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D1048145B
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 15:11:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b795:8a2b:1e98:bedc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D5A6F5FFAE;
 Tue, 20 Sep 2022 17:11:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 17:11:49 +0200
Date: Tue, 20 Sep 2022 17:11:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220920151149.GE1127102@scaer>
References: <CAMdwsN8FyQD4ofHfVgorNvX4kBDArfK6t9dBqgG=3xHrkFOuag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdwsN8FyQD4ofHfVgorNvX4kBDArfK6t9dBqgG=3xHrkFOuag@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663686712;
 bh=RBvwr2Kmg4uO0+X8FQf2NYQA0pa14IG8gnG9wP5D5aQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OLhTm1uIp2WxpcefUSlJVGXUpI7NSxuKlW/MXKdhGApD5ixCmoRWNlpnhN4T2ZwX2
 PLVbtDFUJhHLt/i/IAiLmhFleroeRNfKWN/C+kVkUn6o9QyAv3w1gFmFxcersLAbFd
 6d4pHpeDmZ1K33CGSbFnHLs73iWnbSWzikbmb5pow+KUI01n7qHRxOz2cH0eztM9yG
 BePwyZvXwlPWelrfDrQe1lutIHpvD5+lP7biU6mDlp6OzH/QTviGf+R0s+5HHmd1eT
 c9mpwnpiGqrR6frIric7j4PwCm+SmYQaO+h4fLADjkxHtKtRO+bMItKkOfl+/sXS8y
 VpAVmKQ5iPFXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OLhTm1uI
Subject: Re: [Buildroot] Forcing fresh clone/checkout of custom linux/uboot
 SVN urls
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

Jesse, All,

On 2022-09-20 16:43 +0200, Jesse Van Gavere spake thusly:
> I wanted to gauge for interest (or if I could be given the opportunity
> to) for adding an option to buildroot that would instead of making a
> tarball of a custom version, force a new checkout to be done rather
> than an extraction of an existing tarball. (along with the option of
> making it a checkout rather than an export as it does initially)
> My use case for this is the following:
> We have our own linux/uboot (svn) repositories, however we currently
> have to modify the linux/uboot makefiles because trunk development for
> us is not possible if we point to the trunk url of our linux/uboot
> repository and then use "HEAD" as the custom repo_version. It will do
> an export once, put it in the download folder and extract that later
> on.

Please, look at my proposal about the notion of "transient downloads":

    https://lore.kernel.org/buildroot/20200930173030.2461586-1-yann.morin.1998@free.fr/

IIRC, the conclusion was that the implemetation was OK (maybe barring a
few minor details, I can't remember exactly), but there was no consensus
on the wording to describe that feature in the manual and in the commit
log.

Since I did not agree on changing the wording, and since noone picked it
up to rewrite it, it was not applied.

I ultimately believe this transient stuff was a mis-feature and a bad
idea to begin with, and would be better served by people providing the
appropriate FOO_OVERIDE_SRCDIR in their local.mk, and/or have their CI
setups actually do the checkouts of the appropriate components and
set corresponding FOO_OVERRIDE_SRCDIR before spawning the build.

I don't think adding new features for which we already have a technical
superior solution, is a good addition to Buildroot.

Finally, using a branch name in FOO_VERSION is also a very bad idea, as
this makes the build non-reproducible, and non-predictable. See the
manual for more explanations, section 18.6.2. generic-package reference
about LIBFOO_VERSION:
    https://buildroot.org/downloads/manual/manual.html#generic-package-reference

Regards,
Yann E. MORIN.

> We would have to remove the tarball in the download folder for every
> change in our trunk repos and because it's an export we also can't
> develop on it.
> My idea was to add 2 new config options that are enabled if
> KERNEL_CUSTOM_SVN or UBOOT_COSTOM_SVN is selected, one that would
> override the extract command so it won't look at the download folder,
> and another one that would make it perform a checkout instead of an
> extract.
> Is this something I could add to the main buildroot or do I best just
> keep this inside our own buildroot repo?
> 
> Regards,
> Jesse
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
