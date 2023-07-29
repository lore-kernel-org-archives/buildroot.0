Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA15C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 16:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 456C6833CA;
	Sat, 29 Jul 2023 16:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 456C6833CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iy9y2ejzChtk; Sat, 29 Jul 2023 16:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF62832EA;
	Sat, 29 Jul 2023 16:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF62832EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 332731BF409
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CE7940443
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 16:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CE7940443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kKs0eWCSU6eS for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 16:13:20 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13BAB40003
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 16:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13BAB40003
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3ce4:463b:40b1:7148])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 177BF13F8C4;
 Sat, 29 Jul 2023 18:13:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 29 Jul 2023 18:13:10 +0200
Date: Sat, 29 Jul 2023 18:13:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230729161310.GB229077@scaer>
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
 <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
 <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
 <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
 <CA+h8R2p0VrrNpSA=sMqs5C8bpe41L9sOfo_5z6E8X9z6T_m9-w@mail.gmail.com>
 <CA+h8R2qm2i94fcggkXvScyv9unAWa6S6pF8TwYWTQLPt=r9eDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qm2i94fcggkXvScyv9unAWa6S6pF8TwYWTQLPt=r9eDw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690647197;
 bh=djUgmqMdiRCqliTdKnOdYlfx5J6/jOc+2AsXOoESjgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a/1yoFmN+2rm775LrYeGxEoBxWmZpznuHI1k4iwcQ6m98T8cVltljHs5rPt+LOGf1
 Xrc6aGEN6VrwJG5+tIuCkjiEkafiqIhBp6VAKxptwJZ5GVwuBk8LRZGe4m+pGsRnzP
 znpRFukKaywE32HdDrO1rS6rbob1/T914TQGHevW2vyAwZAWy+MQ1WTDtKjHg/2PuX
 HV6WDZx1tWxXbPWqZ8h12zfDC1iIq7PFMZNN7emNsAix9HWKnXIyE/ielOsvrWDEFh
 63lnsB8TNWmHOhvr4ioEe+qBDSwbpvhDBtKvLn2DqITX5io8d5hloo+ehb+9qc2egU
 rYZySPPBEydmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a/1yoFmN
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-07-27 21:24 -0700, Christian Stewart via buildroot spake thusly:
> > > > >>> host-go 1.20.6 Building
> > > > ...
> > > > Building Go toolchain1 using [...]test-output/TestMender/host/lib/go-1.19.10.
> > > > error obtaining VCS status: exit status 128
> > > >         Use -buildvcs=false to disable VCS stamping.
> > > >
> > > > [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
> It took me a long time to find a reproduction for this issue,
> 
> I finally traced it: if there is an invalid .git in any parent
> directory of the GOROOT_BOOTSTRAP, the build will fail. Reproduction:
> # This reproduction sets up a directory structure that breaks Go make.bash.
> # make.bash should not break due to .git files outside of the Go sources.
> #
> # The error specifically occurs when an invalid .git is present in a parent git
> # directory of the GOROOT_BOOTSTRAP. Go issue #61620
> mkdir go-issue-61620
> cd ./go-issue-61620
> wget https://go.dev/dl/go1.19.11.src.tar.gz
> mkdir go-bootstrap
> tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
> cd ./go-bootstrap/src/
> bash make.bash
> cd ../../
> wget https://go.dev/dl/go1.20.6.src.tar.gz
> mkdir go
> tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
> printf "gitdir: ../../does/not/exist/.git" > ./.git

So, I believe this would be fixed by the recent change by Brandon:

    90790790925c  utils/docker-run: fix support for git-worktrees

Regards,
Yann E. MORIN.

> cd ./go/src/
> GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash
> # Build fails using -buildvcs=false errors.
> ```
> 
> Submitted to the go issue tracker: https://github.com/golang/go/issues/61620
> 
> Best regards,
> Christian Stewart
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
