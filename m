Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2306AEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 12:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7887D40964;
	Sun, 13 Aug 2023 12:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7887D40964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oH4Oa58dwRoF; Sun, 13 Aug 2023 12:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 579FE40978;
	Sun, 13 Aug 2023 12:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579FE40978
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0137A1BF41C
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 12:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC095402E7
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 12:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC095402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eWT6EJIdcVxx for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 12:40:43 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 789C640124
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 12:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 789C640124
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8092A7802D1;
 Sun, 13 Aug 2023 14:40:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Aug 2023 14:40:37 +0200
Date: Sun, 13 Aug 2023 14:40:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230813124037.GX421096@scaer>
References: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
 <20230728230159.6440c601@windsurf>
 <CABGWkvoEvH=4=OmPQHm5T1XMAQ11x-SixLpAxkUL1CUtUrF2_A@mail.gmail.com>
 <20230729230335.3cd59db6@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230729230335.3cd59db6@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691930440;
 bh=aPUyKBATEv7mycgqE6yefx9/YFUZLk4ffImlk540Ku0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hAlJNISM5H2vXZS65f05RvbI1z8ic0n/JMNNXmveIUMEH61+OjoprPOron5qj/hNo
 r7CmzDDScKlh45Yq1czTg3v3N8At8WwmD7kNnL2rbydgDpOLCtBbzNNPvf/m/gMuII
 u7AvH951hgFYb3si7LbWo3097ddE+JCbCjXQWDev9mcAD5R5VWkGKJIAlDgSHwh8x1
 o3iygcm9hJcLqVms0RKv5CljrzrU6kAGibZVPWx/3b9LAa7GmIKUcw/HoneSeY2A7D
 FkbZJ3zZQrcZLsS9AlMdvx/GBBFJxa6e7S0Yb3qDiUcGAJhJZA0thPSfaBCg0AL3BA
 rpucaSQoSZhvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hAlJNISM
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/automake: include .m4 files
 of autoconf-archive
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-07-29 23:03 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Sat, 29 Jul 2023 16:47:14 +0200
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> > > > diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> > > > index fd7933dd74f9..fc235784641a 100644
> > > > --- a/package/automake/automake.mk
> > > > +++ b/package/automake/automake.mk
> > > > @@ -34,5 +34,6 @@ $(eval $(host-autotools-package))
> > > >  AUTOMAKE = $(HOST_DIR)/bin/automake
> > > >  ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
> > > >  ACLOCAL = $(HOST_DIR)/bin/aclocal
> > > > -ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
> > > > +ACLOCAL_HOST_ARCHIVE_DIR = $(HOST_DIR)/share/autoconf-archive
> > > > +ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR):$(ACLOCAL_HOST_ARCHIVE_DIR)
> > > >  export ACLOCAL_PATH  
> > > Could you clarify the motivation? Do you have a specific case for which
> > > this is needed?
> > Following the suggestions of Yann E. MORIN in [1], I tried to fix the
> > issue by submitting a
> > patch to the ethtool project. During the various review stages, I sent
> > a version (much more
> > complicated than the one that was eventually accepted) that required a
> > specific M4
> > macro ([2]). From there, the idea for this patch was born.
> What's confusing to me is: how is autoconf-archive useful/working today
> in Buildroot if aclocal isn't told that
> $(HOST_DIR)/share/autoconf-archive contains a bunch of m4 macros?
> Ah, I see:
> LIBGPIOD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> PYTHON3_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> etc.
> 
> So it would indeed probably make sense to factorize this. But the
> problem with your change is that $(HOST_DIR)/share/autoconf-archive
> gets added to ACLOCAL_PATH even if autoconf-archive isn't
> used/installed. We could decide it is OK, but it should be mentioned.
> Another side effect is that once autoconf-archive has been installed,
> *all* packages will see the m4 macros from autoconf-archive, not only
> the few packages that explicitly need autoconf-archive. I don't know if
> this is a problem, but it can potentially have some side effects.
> 
> Also your patch should drop all the <pkg>_AUTORECONF_OPTS =
> --include=$(HOST_DIR)/share/autoconf-archive, because they become
> redundant.

After thinking a bit on this, here's what I think we should try;

For packages that have _AUTORECONF = YES, we forcibly add
host-autoconf-archive to their _DEPENDENCIES, and always set the macros
search path as proposed here. Supposedly, having macros from
autoconf-archive available should not be a cause for failure to
successfully autorconf, otherwise that would not work on random systems
which have it installed for other reasons, like native builds on
standard distros; also, a missing directorry in the macro search list
should not be a cause for failure.

Consequently, we can drop the ad-hoc dependencies in the individual
packages, and drop the ad-hoc include directove as well.

host-autoconf-archive is a plain autocnf package, without dependencies
(save for the autoconf machinery), and it only ever installs a buncha
files, does not compile anything, so it is pretty fast. Adding it to all
autoreconfigured packages should have a minimal, barely noticeable
impact on the build time.

If the above causes too much breakage, then even this patch was going to
be incorrect, as it would unconditionally add the autocon-archive path
to the search list for all packages that indirectly have
autoconf-archive in their dependencies.

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
