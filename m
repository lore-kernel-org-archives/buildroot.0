Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD8CC4708D
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 16:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8E1F607F9;
	Sat,  3 Dec 2022 16:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8E1F607F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9YoaXimOScy; Sat,  3 Dec 2022 16:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B7760A77;
	Sat,  3 Dec 2022 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B7760A77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673AE1BF59A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 16:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C3998195D
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 16:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3998195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Y__SJlWJqUQ for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 16:05:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0032981951
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0032981951
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 16:05:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ba:9ce3:3496:4e04])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CE680B005A3;
 Sat,  3 Dec 2022 17:05:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 03 Dec 2022 17:05:06 +0100
Date: Sat, 3 Dec 2022 17:05:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221203160506.GD3302@scaer>
References: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
 <20221203155247.428cb5a1@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221203155247.428cb5a1@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670083510;
 bh=eaEntdWnC9gleTIOddmoVk/49GvHySjO61Imjti7AtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1Gew3BVkBDUXiBxZmzU5hQjFrv/B8eIcHOfpK6uGXAUrf5LAeteQknjO8nYpF3su
 R5X9yb3AiqOzRlpbCe8oQGWrzCqAcNQbVsqyTx4LArCiI91s2MY2/+4KZQFnpKhhsE
 wKUCZZt+lFgl9x+JB9txeOwaAUnmA281rBkmwPoCy9FCivJEGy1SegdnmfOmTRFAcw
 caJ4jLLRpt9/4gVafAMDd0VYCpwFXEPiaklNcSkO78i2WR0FrSeS/eYoKBVcvIqNU2
 hlKCqLv0MoMRHnSCNkHvhaRNVoLOTcPBBv3LzjhHI6xQ/FRg/VW4klwYN/xg58ezG+
 DvsIn/RjswyVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h1Gew3BV
Subject: Re: [Buildroot] <PACKAGE>_SOURCE with <PACKAGE>_SITE_METHOD = git
 can result to tar.gz with mismatched file extension
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Buildroot Mailman <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Bagas, All,

On 2022-12-03 15:52 +0100, Thomas Petazzoni spake thusly:
> On Fri, 2 Dec 2022 21:02:06 +0700
> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > Hello,
> > 
> > I noticed odd behavior when <PACKAGE>_SOURCE is set whereas <PACKAGE>
> > is downloaded via git (<PACKAGE>_SITE_METHOD = git).
> > 
> > For example, I'm trying to bump Git package to commit
> > c000d916380bb59db69c78546928eadd076b9c7d (v2.39.0-rc0). On the makefile
> > (package/git/git.mk), I bumped by:
> > 
> > ---- >8 ----  
> > diff --git a/package/git/git.mk b/package/git/git.mk
> > index dc587170e8..1990bf8e67 100644
> > --- a/package/git/git.mk
> > +++ b/package/git/git.mk
> > @@ -4,9 +4,10 @@
> >  #
> >  ################################################################################
> >  
> > -GIT_VERSION = 2.31.4
> > +GIT_VERSION = c000d916380bb59db69c78546928eadd076b9c7d
> >  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
> > -GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
> > +GIT_SITE = file:///home/bagas/repo/git-scm
> > +GIT_SITE_METHOD = git
> >  GIT_LICENSE = GPL-2.0, LGPL-2.1+
> >  GIT_LICENSE_FILES = COPYING LGPL-2.1
> >  GIT_CPE_ID_VENDOR = git-scm
> > 
> > (note: I fetch from my local Git project repository, hence file:// URI).
> > 
> > When I fetch the sources (make source), the generated tarball is actually
> > .tar.gz with $(GIT_VERSION) as the filename. This causes extracting the
> > tarball to fail. In this case, the tarball is decompressed first with
> > xzcat, and it complains due to unrecognized compressed format (gzip
> > instead of xz).
> 
> I think you're right. We assume that _SOURCE is not defined when a
> _SITE_METHOD using a VCS (git, cvs, svn, hg) is used.
> 
> I guess we have two options here:
> 
>  (1) Detect this situation, and error out, to prevent this situation
>  from happening
> 
>  (2) Actually support overriding _SOURCE, but in this case, we should
>  comply with the specified compression algorithm
> 
> Yann, thoughts? (1) seems easier to me, I don't know if the benefits of
> (2) are really relevant.

I think the only meaningful solution is to go for (1): detect and abort.
I too do not think letting packages each request a different compression
would be interesting...

If we believe that gzip is too slow/big, then we can think about
switching to another scheme globaly, but that's orthogonal...

So, yes: detect and abort.

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
