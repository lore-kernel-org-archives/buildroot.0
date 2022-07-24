Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837A0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BDF61ACB;
	Sun, 24 Jul 2022 10:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18BDF61ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-SEcFpEaZmV; Sun, 24 Jul 2022 10:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE7861ABA;
	Sun, 24 Jul 2022 10:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE7861ABA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF5821BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A764E61ABA
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A764E61ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEMueqQTppyH for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:35:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD5C0617A0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD5C0617A0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:35:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 15E747804FD;
 Sun, 24 Jul 2022 12:35:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 12:33:42 +0200
Date: Sun, 24 Jul 2022 12:33:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220724103342.GS2641@scaer>
References: <20220724095505.6CAA485B23@busybox.osuosl.org>
 <87y1wihl1f.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1wihl1f.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658658956;
 bh=U4ZYsBXVqZQ/OI+eyDT8o79sopdpxFu6kCGRuytt42Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FebSdL8e9Pr1yXBCPMZLrb9y+oIzU0fpVvagNzKCF60cwHopO/hTiQi1dxZVUAakq
 GqK+pDjASq/lT1c7IHm/vWzMCkvAeeiq6/twJfAM75qSMeqr9+FLnsEiVqUHB0Qidc
 /xjh3T75+pzMEJwcBnmKRcfmQTLuba+mdRium+QScjy3hSI7kcJNBAtAOYgIFo5au/
 Jjr4w+uDOPzk8ojJb87Fc28lnf1/ubdWcix78Rejo3KyfGNuXLVC7ZVglyi5zWbynn
 5RZ+Yy3g1oeaE9OcZzZ07Qmd9x1+6hjzhK5qifbmK2eiNeJijo42kqPyeeuunzfKtE
 S4lzpP1d4iOJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FebSdL8e
Subject: Re: [Buildroot] [git commit] package/rustc: fix target names for
 i586 and i686
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

Baruch, All,

On 2022-07-24 13:15 +0300, Baruch Siach spake thusly:
> On Sun, Jul 24 2022, Yann E. MORIN wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=b4e706a6e320d5035cf05e8af3c6d9b8bb74fc33
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> >
> > Commit d69d40c029dc (package/rustc: add support for Tier 1 and Tier 2
> > platforms) misspelled the config options for i586 and i686.
> >
> > They are BR2_x86_i586 and BR2_x86_i686, not BR2_i586 or BR2_i686.
> >
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Baruch Siach <baruch@tkos.co.il>
> > Reviewed-by: Romain Naour <romain.naour@smile.fr>
> >
> > ---
> > Changes v1 -> v2:
> >   - in commit log: s/BR2_i386_/BR2_x86_/g  (Baruch)
> Did you mean to push this commit to master with the changelog?

No, indeed.

I wrote the changelogs before we discussed IRL and Arnout said I should
just pushed, so the changelogs sneaked in...

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
