Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF65C4332F
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 20:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D988E4023F;
	Mon,  5 Dec 2022 20:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D988E4023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2VlLB1E0dcp; Mon,  5 Dec 2022 20:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEB2F401F4;
	Mon,  5 Dec 2022 20:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEB2F401F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 105021BF2B3
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEDE8139B
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEDE8139B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZG6KlI0Vw_0a for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 20:14:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C80B481397
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C80B481397
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 20:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 5B4851814B9; Mon,  5 Dec 2022 21:14:46 +0100 (CET)
In-Reply-To: <20221205181907.2cbb01e7@windsurf>
Date: Mon, 05 Dec 2022 21:14:46 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <150f01-638e5100-5-37d57a00@103574002>
User-Agent: SOGoMail 5.7.1
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1670271286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=sYpGE5wQktF0I0xWfW3BgqmYRCEXDSDtOJ6xRistnq4=;
 b=Q9LIYGrIMlXxomE0e93PEd3Kd+F4cVVKDjxxmSE3N+DeaftI3X57godsdZBwwos6PR0wVq
 ZOwjs4QBWPboVA+cCdEiH0tE4M0MjG4J6YsrOz7J3/J33LVYmWz1RIWvanzcbMJnizJ90Q
 C9+K3iEMoeIheXW1JlCxuIyXiJwBdyc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=Q9LIYGrI
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_=5BRFC=5D_package/boost=3A_Boo?=
 =?utf-8?q?st=2EAtomic_needs_atomic_intrinsics?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Monday, December 05, 2022 18:19 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon,  5 Dec 2022 13:54:22 +0100
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > From: Michael <buildroot@heine.tech>
> > 
> > similar to previous problems with nios2 and not-available atomic ints
> > the build for Boost.Atomics also fails for ARC Targets which don't
> > have the ATOMICS_EXT flag set.
> > 
> > according to [0] "Boost.Atomic has a hard requirement of the native
> > atomic operations on bytes". The same tests mentioned there fail for
> > ARC.
> > 
> > so introduce a dependency on BR2_ARC_ATOMIC_EXT for BR2_arc.
> > 
> > Fixes:
> >   http://autobuild.buildroot.net/results/4ca54a85672d7b9328b1909b457e548c6032a493
> > 
> > [0] https://github.com/boostorg/atomic/issues/42#issuecomment-734130348
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> I wish it would be this simple, but this new "depends on" needs to be
> propagated to all places where BR2_PACKAGE_BOOST_ATOMIC is selected.
> 
> Aka:
> 
> package/boost/Config.in:        select BR2_PACKAGE_BOOST_ATOMIC
> package/boost/Config.in:        select BR2_PACKAGE_BOOST_ATOMIC
> package/domoticz/Config.in:     select BR2_PACKAGE_BOOST_ATOMIC
> package/gnuradio/Config.in:     select BR2_PACKAGE_BOOST_ATOMIC
> package/libcpprestsdk/Config.in:        select BR2_PACKAGE_BOOST_ATOMIC
> package/log4cxx/Config.in:      select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> package/uhd/Config.in:  select BR2_PACKAGE_BOOST_ATOMIC
> 
> And of course, if there's anything that selects those options, the new
> depends on should be propagated to them again.

I'm aware of these dependencies. That's why I submitted this RFC Patch because I wanted to be sure to
use the right dependency before going through all those packages. (I guess you missed my "below the commit
message" part).

Does it make sense to add 
  depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
to all those packages or is there something "smarter"?

Would it make sense to group it with the dependency on 
BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS  and add something like 
BR2_PACKAGE_BOOST_ATOMIC_ARCH_SUPPORT?

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
