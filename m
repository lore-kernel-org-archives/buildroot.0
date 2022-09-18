Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D60BECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 19:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D6283E6E;
	Sun, 18 Sep 2022 19:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D6283E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0rjXiwaA6CY; Sun, 18 Sep 2022 19:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1376083E65;
	Sun, 18 Sep 2022 19:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1376083E65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE6431BF3F6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B932440154
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 19:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B932440154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RmbndecaXTL for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 19:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74924400DA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74924400DA
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 19:36:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4908:486:8484:20b8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 26ACE19F5A6;
 Sun, 18 Sep 2022 21:36:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 21:36:26 +0200
Date: Sun, 18 Sep 2022 21:36:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220918193626.GK1419013@scaer>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <212daefb880a3c5e49ff4aa8278cc4c3bc67360e.1660931225.git.yann.morin.1998@free.fr>
 <d707dd32-af74-0d63-c890-7d81e29ca454@mind.be>
 <20220917211914.GB1127102@scaer>
 <95ed1fd5-7c46-c59e-dc5e-bca4fbd5958a@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95ed1fd5-7c46-c59e-dc5e-bca4fbd5958a@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663529791;
 bh=uexOInYmy7yQrNpipBvWeA08K5Bf7VmZ8gJK05aPJSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DUS/WXneFDvP/FV1Met8CU5zQ8HHKT8RAzHoAD4ZxV/SlOs2dr20ek/rhCPb3dwME
 ZTGORElIwcPsblQkNJQ/PWJ3E6rFG0wLDC1nzXV6KbMWWEG/JvQ1fDhPWN6QqL1kI2
 7yG7Sz7BuNO4jjYnegg12jNU/iuUYsLKFmnT3p4MwCZPSr4bkXwAJdnV9lcZcVNOFg
 PUbd7dmXANPbQ55wQAYNx1Q4bJ5eCHrqxYhVRDQJ5TRnMONndz0wauPcMBNPL5Tj8B
 kQwOEglI/fHn4W4HgQEBP32v/kX7ZeOJ9cYm++GxZa9lwJTzalm4C11UBr76OdKUEf
 b+0WspdsEy6lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DUS/WXne
Subject: Re: [Buildroot] [PATCH 2/4] package/dracut: allow users to provide
 their own modules
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-18 10:57 +0200, Arnout Vandecappelle spake thusly:
> On 17/09/2022 23:19, Yann E. MORIN wrote:
> >On 2022-09-17 22:17 +0200, Arnout Vandecappelle spake thusly:
> >>On 19/08/2022 19:50, Yann E. MORIN wrote:
> >>>Add an option to the host-dracut package, so users can point to a list
> >>>of modules to install.
[--SNIP--]
> >>  In other words, I think this should be moved to cpio.
> >I beg to differ (of course!). ;-)
[--SNIP--]
>  However, looking at it from a usability point of view, that is no longer
> the case. In the head of the developer, what they want to do is to make sure
> the right stuff ends up in their cpio archive. They don't actually care if
> the dracut package is used for that.

A final nail in the coffin of a host-dracut option, is that host-dracut
is not user-selectable; the kconfig symbol does not have a prompt, and
is only selectable by something else, like fs/cpio's dracut option.

On another note, users who had a post-image script that uses dracut from
before we introduced it, were obviously not using host-dracut, but a
dracut from their host, and so they most probably can't use extra
modules in that case, so we do not need to catter to those either.

So, I'll resubmit as you suggested.

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
