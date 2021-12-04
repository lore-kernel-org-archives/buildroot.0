Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F96C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1850860A7C;
	Sat,  4 Dec 2021 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BN1pDHJDKhp; Sat,  4 Dec 2021 20:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF2D60A83;
	Sat,  4 Dec 2021 20:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBCE11BF2C6
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC4C60A83
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXGhOFYkInHa for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:59:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 679B860A7C
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:59:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F2DC05FF9E;
 Sat,  4 Dec 2021 21:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638651570;
 bh=pRG5wrp5CI1fSMFTewcTtkJE+eWahTCDNN1D9FlVc1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIFy9r5CujeWC81GRYvN4wSWddXJaHA2XQrEsoSIlJBIRLRVEFlaqVp+vWw9ibiGd
 idmcGMUZ6ixD9AvuGSgGQHirnLfUoz3dPGPKtUPzkvUTW2SNyL2CGlLW36Wgi64cp2
 od6d7nw+7ILAsj7WTbHVlmdT9A9ZLB92S+j6q5AzJM4jrM67qJPIARklgocdLbLRsi
 DV724IfOz0U04OAWqhD5BXNAseP11X8jg1dmmrlG5fp5YwpvO998XtnSrI1DfpEhjj
 X25ujawW9qmFA9DDapinwXiZWUXgo1cABh5eNLgffB7pvA0MebAAYPDEaoWbdg4Hm4
 5TwlyfLGlvbJg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 21:59:21 +0100
Date: Sat, 4 Dec 2021 21:59:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211204205921.GD472627@scaer>
References: <20211202013902.1593562-1-troglobit@gmail.com>
 <20211202013902.1593562-2-troglobit@gmail.com>
 <20211204210459.461e4f39@windsurf>
 <0f7d1dfe-07c3-198f-3449-9179db0e385c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f7d1dfe-07c3-198f-3449-9179db0e385c@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH next 1/2] package/watchdogd: bump to version
 3.5
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
Cc: Alejandro =?utf-8?B?R29uesOhbGV6?= <alejandro.gonzalez.correo@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-04 21:23 +0100, Joachim Wiberg spake thusly:
> On 12/4/21 9:04 PM, Thomas Petazzoni wrote:
> > On Thu,  2 Dec 2021 02:39:01 +0100
> > Joachim Wiberg <troglobit@gmail.com> wrote:
> >> This addresses the autobuilder failure for master as per 2021-11-27.
> >> The root cause was a name clash in a dependency, the libite library,
> >> clashing with the DirectFB LiTE library header files.  
> > Thanks, I've applied both to next, as indicated in the patch title.
> > However, in the commit log, you seem to indicate that it's fixing a
> > build issue in master. Could you confirm?

We've discussed this on IRC with Joachim, and it was my expectation that
the patches would be aimed at master, because they *do* fix an actual
build failure in master.

The reasoning for accepting the bump in master was that libite is only
ever used by watchdogd in Buldroot. Both packages are maintained
upstream and in Buildroot by Joachim, which is pretty fast at addressing
build issues.

> Very unfortunate name clash between include files in two packages.
> http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6
> 
> However, I think it's highly unlikely they'll be enabled at the same
> time. My recommendation is to go for next and let 2021.11 out the door.

Even if that were true, it will still happen in our CI and thus cause
build failures, which creates noise and may hide other, more intersting
failures. Besides, once a package is in the tree, people are going to
use it.

DirectFB is often used in embedded, and watchdogd is a process
supervisor for embedded, and so it is not too far-fetched to see that
the two could be easily used on the same system. For real. We want to
avoid name-clashing for those.

So I would say that we should also apply them to master.

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
