Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B4AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 08:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BCFD40273;
	Sat, 20 Nov 2021 08:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlvGFlmArksu; Sat, 20 Nov 2021 08:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 373C640282;
	Sat, 20 Nov 2021 08:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3523D1BF304
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 08:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 324FB80E3F
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 08:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mp_8BQEbgK7 for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 08:50:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B46E080DEB
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 08:50:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8ce3:604:2d0f:2718])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id ED0782003C3;
 Sat, 20 Nov 2021 09:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637398211;
 bh=TYh1E9Bz/E9kSDQWLn4YgNFwu8wVJ2Pj+kTy6U4BVy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=boTEdGIZDwNzPejJmqbVW+RJZt4mZB7P9OerL4jyeTXux57K5yNajqVmPPTNbwoxp
 bKVx4zZnRueHYldwqHYJfrHgvzc7lIIW0qlk/a5sNeqP5iNRBUG19B1L8tdDUMVLWc
 RebY61vzufiaQkgU8ahmunMvkUcE+6VB5xr0oNzrKBv2kYhEQL3PfQeqjOiZTTyQfa
 WWVcUleEjMaPhnDbXRQdH/Ss62A52IWCN9EA2nFgToO7ubgdmpSLeHIArHz/vrbTUm
 16YahLyX0JnwWYWbFWOKajkMxBqDtPr2Mnw9+hfjZh+zL6ROPHgJmO1Fi9+GU6vIfI
 H7vKUngfp31cg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Nov 2021 09:50:04 +0100
Date: Sat, 20 Nov 2021 09:50:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211120085004.GS247986@scaer>
References: <20211117213348.231529-1-romain.naour@gmail.com>
 <87ee7drf65.fsf@dell.be.48ers.dk>
 <9880ded2-bde8-8321-9a61-d281be2db2ff@gmail.com>
 <87a6i1r6va.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6i1r6va.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH for-2021.08.x] support/docker: remove
 expired mozilla/DST_Root_CA_X3.crt
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, Romain, All,

On 2021-11-18 13:22 +0100, Peter Korsgaard spake thusly:
> >>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
>  >> > https://stackoverflow.com/questions/69408776/how-to-force-older-debian-to-forget-about-dst-root-ca-x3-expiration-and-use-isrg
>  >> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>  >> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>  >> > ---
>  >> > Backport this patch for 2021.08.x and 2021.02.x using buildroot/base:20200814.2228
>  >> 
>  >> How does this actually work? Who builds that container? Do we not need
>  >> a corresponding update of .gitlab-ci.yml then?
> 
>  > Well, usually it's Arnout or Yann that build and push containers to dockerhub.
>  > On master we recently switched to gitlab registry, so maintainers and developers
>  > of Buildroot gitlab project can update containers.
> 
>  > The .gitlab-ci.yml is changed as soon as the container is rebuild using the
>  > updated Dockerfile (after the commit of Dockerfile change).
> 
> Ok, so all manually.
> 
>  >> 2021-11-18 09:20:10 (16.5 MB/s) - 'aarch64--glibc--bleeding-edge-2020.08-1.tar.bz2' saved [127456563/127456563]
>  >> 
>  > Indeed but we may introduce some (unlikely) regression in the testsuite.
> 
> If there are regressions, then it would be better to handle them as
> people might run into the same issues. Debian 9 is old, no matter if we
> look at the 2017 snapshot or the last bugfix (2020), so I testing
> against that might be the best solution?

I was not sure Stretch was still maintained (I did not even check), but
now I tested the stretch-20211115 snapshot, and indeed the certificate
issue is no longer.

The risk of regressioni if we update is very low, because Debian really
is stable; after 4 years of maintenance, there is not many things that
move anymore.

So I agree that updating to the latest stretch image is better than
hacking our ways by removing some certificate.

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
