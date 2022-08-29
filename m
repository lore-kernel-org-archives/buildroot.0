Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BCFECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 19:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 779B84048D;
	Mon, 29 Aug 2022 19:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 779B84048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X33XIU2J8PKp; Mon, 29 Aug 2022 19:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92B2C40465;
	Mon, 29 Aug 2022 19:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B2C40465
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 399381BF379
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 146D0812E1
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 146D0812E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvWqk0zoS9pT for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 19:48:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9A808109A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9A808109A
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 19:48:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [80.9.176.139])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7C3C9780501;
 Mon, 29 Aug 2022 21:48:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 21:48:28 +0200
Date: Mon, 29 Aug 2022 21:48:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20220829194828.GA3615594@scaer>
References: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
 <20220614180152.15846-1-raphael.pavlidis@gmail.com>
 <a7ed0285-fea7-16f6-6ef8-9ff93fee1461@googlemail.com>
 <20220827120837.GV37358@scaer>
 <553c9903-0b75-d35b-cd30-848a05168eb7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <553c9903-0b75-d35b-cd30-848a05168eb7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661802511;
 bh=3yLNWbJrqBFJ6a+5ATCMaGrPjQDs1zRtHqrWKWZAhWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZ9acLuFRWLFmlDGGmbxPcxmK/D5yFjQOaab7720zdm4wSifWrJg2yD5Y4O+qk97l
 vBUZTuUbGoHst0PyKzuJxwV9ratD5sYu9UJs0uVrGkkox58BR87/dpkIelDzUoojrA
 yp0va5DVdSkrYcA2yODo3+I5rBNfCX6NwTAI4b+7/bgWnGmdNJSHYXUUQih8M7x/IR
 ZjTtmLVfCUvvja+6PjImu9/gKYSuquU+0CEMWpZNIsvuhYMFHmMx0E92XQc7ag9hJr
 ZwdSq6G2PJ4Um2o0UZTq7zBL/W4MJOqlvlhSnnADkcWlwg8lkhfqqMl6TjdI5fk+QG
 A0iJNtkwydLMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MZ9acLuF
Subject: Re: [Buildroot] [PATCH v2] package/slirp4netns: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2022-08-29 20:55 +0200, Raphael Pavlidis spake thusly:
> On 27.08.22 14:08, Yann E. MORIN wrote:
> >You forgot to add an entry in the DEVELOPERS file, and I forgot to
> >commit-amend my change, so I pushed a follow-up commit to add it.
> Thanks. I did not know that I have to add an entry to DEVELOPERS. So, the
> creator of the package have to be in the DEVELOPERS?

Yes, the idea is that, by submitting a package, you show an interest in
having that package work flawlessly in Buildroot.

Listing the package in DEVELOPERS will ensure that you are copied on the
build failures about that package, that the autobuilders [0] may uncover
when running the random configurations.

It also ensures that, should someone submit a change to that package,
you get listed by the utils/get-developers script, so they would put you
on Cc to the change, on the assumption that you know (at least a bit)
about the package.

[0] http://autobuild.buildroot.net/

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
