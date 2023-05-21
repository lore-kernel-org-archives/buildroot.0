Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C088C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D4C82D17;
	Sun, 21 May 2023 15:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D4C82D17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cy5CxN1Fkcbf; Sun, 21 May 2023 15:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D06C8291C;
	Sun, 21 May 2023 15:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D06C8291C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 084BB1BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4F3A60BC0
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F3A60BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1I4A5F-gmfTW for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:16:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA88B60B98
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA88B60B98
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:16:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8CDC5B0055E;
 Sun, 21 May 2023 17:16:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:16:44 +0200
Date: Sun, 21 May 2023 17:16:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230521151644.GC171618@scaer>
References: <20230520210153.3944842-1-dario.binacchi@amarulasolutions.com>
 <20230521151038.GA171618@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521151038.GA171618@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684682207;
 bh=sqtOj5igcNH6C5/bsv11gZ7bfTt8Cgr51Uxd9bIKRl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3W1w0nrJHq6Q+DZ/++dHC4SK4PmK9z8FpXi7MD8189x+0RJI4AnnLZ3xF0eMEDk6
 bzPwfVBsHhwyHetSWZi97rDBsqRp4g20CBCC++crB/TmdCmQmhsHbq2eTy+YzpWlhg
 FXaUaNHjhuJO+OGALA8py+M+IXAUJ7sC2DTRufNfN+a3C+HAiG18WBZV51dNSq3z/4
 ij/J70bwFGy3IO0nHJZjYpqel7GQu9X8LHlwBpjzMKLnmVZ3HnFV6OQfgPVDXSgHq/
 CFXW326F58XWBLPZIWGBnw8WBfkjiRdLCi+SjHVTl82V1hB/r7Il84hDsR5kjF4TTP
 1QiI3HhcwvukQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R3W1w0nr
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: fix build failure
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
Cc: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-05-21 17:10 +0200, Yann E. MORIN spake thusly:
> Dario, All,
> 
> On 2023-05-20 23:01 +0200, Dario Binacchi spake thusly:
> > The added patch is an adaptation of the one submitted to the libmnl
> > project.
> > 
> > Fixes:
> > - http://autobuild.buildroot.net/results/36c1619c8b02efeaf9caebae8bb5c3eb8a26238b/
> > - http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e/
> 
> Those failures are due to improper dependency on kernel headers:
>   - IFLA_CAN_TERMINATION        -> introduced in 4.11
>   - CAN_CTRLMODE_FD             -> introduced before that
>   - CAN_CTRLMODE_FD_NON_ISO     -> introduced before that
>   - CAN_CTRLMODE_PRESUME_ACK    -> introduced before that
> 
> So libmnl needs to gain a dependency on kernel headers at least 4.11;

Ah, it's in fact just the new CAN tool that needs that dependency, so it
needs not be propagated, sorry.

Still, the proper way is to add a dependency on kernel headers >= 4.11
for the libmnl examples.

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
