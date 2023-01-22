Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C9EC25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 09:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 997684050C;
	Sun, 22 Jan 2023 09:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 997684050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swp3HYnFGdgn; Sun, 22 Jan 2023 09:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E298840186;
	Sun, 22 Jan 2023 09:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E298840186
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D708E1BF36C
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 09:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD0D840186
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 09:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD0D840186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wfPRvVK3bn2 for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 09:13:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7442E400E7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7442E400E7
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 09:13:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 43C645FFA3;
 Sun, 22 Jan 2023 10:13:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Jan 2023 10:13:18 +0100
Date: Sun, 22 Jan 2023 10:13:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nevo Hed <nhed+buildroot@starry.com>,
 Romain Naour <romain.naour@gmail.com>,
 Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230122091318.GG558596@scaer>
References: <20230105015759.63582-1-nhed+buildroot@starry.com>
 <20230105015759.63582-2-nhed+buildroot@starry.com>
 <20230121222752.GF558596@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230121222752.GF558596@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674378804;
 bh=pblCOD5M4OH61j8JqDGV0Y2riWDA8a1TRP85JdkPX4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gh/2B1d0p2OD11+NMPoMBocdWP9ZTuyfdlSu/D+Oj7R1kowahBggy7M7k44hytw5N
 ARBsv37aQhn02xnygowe8mEEpOJEOtJHDd0MZscO6e8izHL7AzmskoMPbmi7Ix6S4U
 uATucwrVEpQ9zJDIono1cKxpOsDRRIPjZSFis39f6rWXyIkBCmHxRYGY1znu5rNJCK
 DbhvC5rJZYkTRvDbgMWX+CQBPNTxqV6p7xrM3xSPaAzkoEvooKs0ElI+cn3EHIacr8
 lsh7joqGrcxD7/M5dzGZy84OZKLNC0GJd1CRbcRVMs1bV050WgMujAHwrdLWe8RqOO
 PZvujfBJ1kJ0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Gh/2B1d0
Subject: Re: [Buildroot] [PATCH 1/1] core: Use of percent_defconfig seems to
 impact performance
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nevo, All,

On 2023-01-21 23:27 +0100, Yann E. MORIN spake thusly:
> On 2023-01-04 20:57 -0500, Nevo Hed via buildroot spake thusly:
> > Noticed a significant slowdown with rise of number of external trees
> > in our env.  This slowdown seemed to be related to invocations if the
> > percent_defconfig function (GNU Make 4.3).
> So, the following change:
> > -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
> [--SNIP--]
> > +%_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
> broke the build when the output directory ends with _defconfig. For
> example:
>     Makefile:1015: *** "Can't find /some/path/meh_defconfig".  Stop.
[--SNIP--]
> So, I think we have two options:
>   1. quickly find a fix that is not totally hackish (but with Romain, we
>      could not find something trivial that worked)

Hopefully I've found a non-hackish fix:

    https://lore.kernel.org/buildroot/20230122090947.1369673-1-yann.morin.1998@free.fr/T/#u

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
