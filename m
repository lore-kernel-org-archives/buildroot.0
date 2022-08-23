Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DEEC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 17:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF7960F69;
	Tue, 23 Aug 2022 17:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFF7960F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HI2HxYN5CVBK; Tue, 23 Aug 2022 17:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E7160F67;
	Tue, 23 Aug 2022 17:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E7160F67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE4181BF417
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 17:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B448F40190
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 17:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B448F40190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wf1w0eTXDXLl for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 17:26:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53BD740135
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53BD740135
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 17:26:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5cb:81c2:970c:cd58])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0E363200587;
 Tue, 23 Aug 2022 19:26:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Aug 2022 19:26:47 +0200
Date: Tue, 23 Aug 2022 19:26:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220823172647.GJ2167049@scaer>
References: <20220823054811.360322-1-christian@paral.in>
 <4931af16-cd09-8bbe-842e-9836bbd1e7c9@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4931af16-cd09-8bbe-842e-9836bbd1e7c9@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661275610;
 bh=0J/40jDp+GoEcLG2Ukt3u/p/i97ogjft58R9b7usQ/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HCH0IJqLhETIaF4eQFaCNJMbTjeOHWLW4kbNfrBofdhYJ8ptPy1CVndMLgthQuBX6
 Y2R404RsAdFT7wGTyRcnH24jbZ9gLxDDK3AgZAVUxu1nAfothQxckmFKRMoNn2Q6Xi
 Fv1ylp8FjWj3TiIVVCj/hjINad+WbLd6Eakwhz3YF4r6rcIF1yBwIR+27DzWtChpAZ
 uZe6PRkdJRcoWSbxbznjG9pXhp8aaIWGEUS5TFO9uPXOzjVBH24CquDsGoHpxo20Ay
 giWaU/7BEHTFjKCHdy3FavHnl40JHF6v2zj5upJoyGl0pAQbkzlKudiMGPp8ANCp2p
 HA1eWaSwdnBoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HCH0IJqL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/crun: new package
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

Yuanhao, All,

On 2022-08-23 05:31 -0700, TIAN Yuanhao spake thusly:
> Maybe we should explicitly enable these kernel configurations:
> CONFIG_USER_NS # setgroups
> CONFIG_BLK_DEV_THROTTLING # io.max

Are they strictly required for runc to be functional at all, or are they
just optional?

We try to be very conservative about the options we en able in the
kernel, to just the ones that are strictly needed.

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
