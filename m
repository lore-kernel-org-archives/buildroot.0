Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C7EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 20:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA28860BFC;
	Thu,  6 Jul 2023 20:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA28860BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVj9mrITCdgm; Thu,  6 Jul 2023 20:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF6B60B33;
	Thu,  6 Jul 2023 20:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF6B60B33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 530E11BF4DB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C85060B33
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C85060B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hq1q90LUcuew for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 20:28:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A74460AE8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A74460AE8
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 20:28:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7ae6:b65b:4981:3222])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AC5B319F59D;
 Thu,  6 Jul 2023 22:28:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jul 2023 22:28:40 +0200
Date: Thu, 6 Jul 2023 22:28:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230706202840.GB2664@scaer>
References: <20230703182930.B08CA863E5@busybox.osuosl.org>
 <20230703205631.4dd121b0@windsurf>
 <38008674-4a63-4223-84d1-c55aa52f023b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38008674-4a63-4223-84d1-c55aa52f023b@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688675330;
 bh=ioPj/HlRSxfZlhgA+jNLNgQJciPu2l5MO3RNK6cckmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VMmU1Y4FXh90GvmmdTOsa30w1fQFxkgvlCWTe3TXp4sh+V5Y/TOg41Jcyxce3shtc
 JVPpBMqZEpWrgM0bQBJBSg4fTrb0E6x4ibOymZ6nK8dIlUxN6sZC3oW/vrl5PFwGgc
 t6L3H5WX6Dz2PUX7GUQqryri3ylqFfyH6kdxbAt5Z5jg9RTPgnDh/wC2jpww72COeU
 bbsRxVXaIds0mFI5Pzfaa0lykcBjNxlp2ruTrgaQCIISb1ipsosrx10mxI5djyjjWY
 sSHoTUVNkIQEmGyP0yRFbJRhx8Rb0MNdbv2P//NDNLI7pCmbDu7p/APtyl49KBbTqq
 ITghsTTXbKG7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VMmU1Y4F
Subject: Re: [Buildroot] [git commit] package/python-setuptools: add missing
 dependency on host-python-wheel
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
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-07-04 22:28 +0200, Arnout Vandecappelle spake thusly:
> On 03/07/2023 20:56, Thomas Petazzoni wrote:
> >On Mon, 3 Jul 2023 20:20:31 +0200
> >Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> >Hu, this was not in the patch from Romain I believe.
> >>+	select BR2_PACKAGE_PYTHON_WHEEL # runtime
> >This is not correct, there is no such symbol in Buildroot, and it
> >causes a check-symbol error:
> >https://gitlab.com/buildroot.org/buildroot/-/jobs/4586144848
> >What was the motivation behind this additional select?
> 
>  Because setuptools has a runtime dependency on wheel. The pep517
> infrastructure does a build-time check of this runtime dependency, but due
> to the way we run python, the build-time check looks at what is installed
> for the host, not what is installed for the target. Therefore, we have a
> dependency on host-python-wheel instead of target python-wheel.
> 
>  Since setuptools clearly defines that it has a dependency on wheel, I
> thought it logical that we would reflect that dependency in Buildroot as
> well. It is really a runtime dependency, not a build-time dependency, so I
> added this select like we do for runtime dependencies.
> 
>  Of course, I didn't notice that we don't have a target python-wheel
> package, so it doesn't actually work.
> 
>  So, dropping this select I'm pretty sure is going to break something, at

Dropping the select can not break anything: there is no package to
select to begin with. So it can't be more broken than it was before the
select was introduced.

Of course, if we really need wheel as a target package, then it should
be made such a package before we can select it.

Although having sheel on the target jsut because some (most?) packages
have a spurious dependency on it, would be seriously a shame...

> some point. I've looked a bit closer now, and it turns out that wheel is
> actually only imported in one specific function, in the "editable_wheel"
> command. So it's quite unlikely anyone will ever see this breakage.
> 
>  However, now I look a bit more in detail at it, it looks like this commit
> is in fact bogus, and Yann's original comment that the wheel dependency
> should be added to the infrastructure is in fact correct. From the
> documentation:
> 
>    Historically this documentation has unnecessarily listed ``wheel``
>    in the ``requires`` list, and many projects still do that. This is
>    not recommended. The backend automatically adds ``wheel`` dependency
>    when it is required, and listing it explicitly causes it to be
>    unnecessarily required for source distribution builds.
> 
> And it's pretty clear what is adding this dependency: the pep517 infra calls
> the build with
> 
>    python -m build -n -w
> 
> The "-w" stands for "build a wheel" and I guess it's obvious that that
> implies a dependency on host-python-wheel? And I guess that the relatively
> few pep517 packages we have already have a setuptools-based package (and
> therefore host-python-setuptools and host-python-wheel) somewhere in their
> dependency chain.
> 
>  So, I do think this dependency should move the the pkg-python infra _for
> pep517 packages_, as Yann originally commented.

I'd defer to James to find a better solution, because I don't grasp even
partially all this pep517-introduced pain...

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
