Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C950FC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 15:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5594E409A6;
	Mon,  1 Aug 2022 15:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5594E409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w05tT26b5Ydx; Mon,  1 Aug 2022 15:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F397140996;
	Mon,  1 Aug 2022 15:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F397140996
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED0621BF343
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5245600CC
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5245600CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHKnxEziliFm for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 15:30:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE83C60B7D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE83C60B7D
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 15:30:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a573:58bd:e1d1:c541])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3A16419F746;
 Mon,  1 Aug 2022 17:30:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Aug 2022 17:30:13 +0200
Date: Mon, 1 Aug 2022 17:30:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Roosen Henri <Henri.Roosen@ginzinger.com>
Message-ID: <20220801153013.GC3168@scaer>
References: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
 <20220730121955.GS3168@scaer>
 <c25e9cda-9f84-6049-fc24-a8f442d8455e@theobroma-systems.com>
 <57a89f2ad4d1ffe52344135368be359347d600ac.camel@ginzinger.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57a89f2ad4d1ffe52344135368be359347d600ac.camel@ginzinger.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659367817;
 bh=FzffuyanqhPqiF4nt/IeKvQbK+CWt0Zh+J9PXFnVrIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ClMDnCckao7F5g0XF+mYBk1Kv9rbnTU6QR031L5tCGLqoBmoEmpl6aSKwT6NzpAm6
 b1fQcvDD7FW6BP7Ig7CehwCLY9ljjTRfoqs9rCZn0OapL+9mK7f8F2sMeVx2KqAK1j
 0jQRpLPxXh3w/Dp8T0NfiID4avOBh9mYgkNW2xqRoaCBDQmlNXi07m7WKaEnKrXO8V
 HwETRcV+2F6aPq6rRUGtzDwHxFlDuZ1AenlCb29dwBohKKg2xCe0YuK6yadO6yy3rP
 DGHZVK7YUjIc3wzhABFAb0SDOOST41CScKwoM51mVPjlJpumorI30a1c5zUzzbutqO
 hXeisMKuu8pSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ClMDnCck
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: workaround make 4.3 issue for
 'printvars and 'show-vars'
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
Cc: "quentin.schulz@theobroma-systems.com"
 <quentin.schulz@theobroma-systems.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Henri, Quentin, All,

On 2022-08-01 14:49 +0000, Roosen Henri spake thusly:
> On Mon, 2022-08-01 at 15:36 +0200, Quentin Schulz wrote:
> > On 7/30/22 14:19, Yann E. MORIN wrote:
> > > On 2022-07-29 21:49 +0000, Roosen Henri spake thusly:
> > > > As the root cause seems the 'filter' command cannot handle large
> > > > chunks of data, like .VARIABLES, we can workaround the problem by
> > > > using a foreach command over .VARIABLES, then use the filter
> > > > command.
> > Just a heads-up that `make printvars` is broken (I've sent a patch
> > for 
> > it just now) and also that I get a segfault for `make show-vars`
> > (`make 
> > show-vars VARS="BUSYBOX_%" works just fine).
> 
> Thanks for the heads-up! I can reproduce your tests-results.
> 
> I made the workaround to get the 'make pkg-stats' functionality up and
> running again on recent systems with make 4.3. So I did my testing for
> 'make printvars' and 'make show-vars' with the VARS variable set to:
> 
> "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"
> 
> Sorry I missed testing the empty VARS (=all).
> 
> We might revert the workaround for 'show-vars' and install the make 4.3
> check again. For 'printvars' we might keep the workaround, as until now
> no segfault could be reproduced and I think the 'pkg-stats'
> functionality is a nice to have.
> 
> What do you think?

Yes, please partially revert the change to protect just show-vars, so
that the autobuilders and plg-stats are still happy with printvars.

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
