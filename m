Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE8C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 13:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B9841C02;
	Sat,  4 Dec 2021 13:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7Hvygdzh-7z; Sat,  4 Dec 2021 13:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D50D41BFB;
	Sat,  4 Dec 2021 13:46:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29B8C1BF2EF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 13:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18ADF83F62
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 13:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qwKHpbCXTi6 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 13:46:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBF2B83F5B
 for <buildroot@busybox.net>; Sat,  4 Dec 2021 13:46:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B257D5FF23;
 Sat,  4 Dec 2021 14:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638625594;
 bh=t16fGEFucfVQ0xT1/9qpY3EGBywBJhqQramUNm/Mttk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZQW1iYA/qg3KSo5RARCJ0yRfM7MyQ8eBia0wPVHNgDNuzrFcwJck71oDqEjgbJEvm
 i5Elmhu9RPW5K2HFfJLlcH5ao087qH1Bj6lrSsJPPsFBdjlIrOf35WS3NJGRTK5964
 03KHYtLpsWmbHsvqHAfB2K+k3lMjKoqs/pDYtb8bJou6xGHGArN2ffJQ5kWQ5TGeSJ
 JRyTION4ebCrreXfUvcYoMu1s3vlf6qxvjnOYV1MBNzhr2N74fbD2SIkb6HQDdMh/T
 po3z/jWndberJerYM7Wu65Boj4iw/iSY2tU/dXt3q20NNlfgupk+KSknlb7Dzdh40t
 iSKdeL5egm7RQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 14:46:25 +0100
Date: Sat, 4 Dec 2021 14:46:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: guillaume.bressaix@gmail.com
Message-ID: <20211204134625.GK50662@scaer>
References: <20211204120548.31170-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204120548.31170-1-guillaume.bressaix@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next v2 1/2]: pybind11: new package
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
Cc: buildroot@busybox.net, asafka7@gmail.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillaume, All,

On 2021-12-04 13:05 +0100, guillaume.bressaix@gmail.com spake thusly:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> fixes http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
> fixes http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
> fixes http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
> fixes http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
> fixes http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
> fixes http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
> fixes http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69
> list goes on..
> 
> ---
> v2: Reviewed by gwen@trabucayre.com,
> Removed some non needed empty lines,
> force -DFINDPYTHON=OFF when using pybind11 without python,
> handle legacy package properly in a seperate patch
> 
> v1: python-pybind was not the right approach and is in failure since
> it's been upgraded to V2.6.1.

This form here:

> Building with setup.py now requires a cmake build first.
> With this new approach we can build the package with cmake
> for python bindings in C++ AND we also have the
> C++ bindings in python as an option (depending & requiring the first one).
> 
> I make this a host-only package, in the sense that other packages will
> require it at build time, and I don't forsee any reasons to have
> such a package as a target package.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

... to here, should be part of the commit log, i.e. before the first
'---' line, above. Otherwise, it is dropped by git when the patch is
applied.

However, I am still not sure what is going on here...

First, you are removing pybind to then introduce pybind11, although they
are the exact same package upstream:
    http://pybind11.readthedocs.org/en/master (home)
    https://github.com/pybind/pybind11 (repo)

But since this is the same upstream, you should just fix the existing
pybind package in-place; there is no reason to intriduce a new pacjage
to fix an existing one.

Then, I did not find the explanations in the commit log very convincing.
Why state that "python-pybind was not the right approach"? As far as I
understand, it was working as expected until the bump to 2.6.1, and thus
was not a "failure".

If the bump to 2.6.1 broke the package, then that means the bump was not
careful, not that the package is a failure.

Fionally, why is a host-only package? If it installs C++ headers, then
we can expect packages built for the target to include those ehaders,
and so we need them in staging too. And this is made obvious by your
post-install hook, that uses STAGING_DIR. This is ultimately wrong,
because then that means that host packages won't be able to find/use
those headers.

Minor nit: the commit log should not be in the first singular person,
ie.e do not use "I", but in the `neutral' first person plural, i.e. use
"we".

However, I admit that the whole situation evades my understanding, so I
may have miss more tricky details... I will gladly accept being
corrected on those. ;-)

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
