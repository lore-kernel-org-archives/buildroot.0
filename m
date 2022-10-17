Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74052C43217
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 07:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE14260F2E;
	Mon, 17 Oct 2022 07:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE14260F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4s_ORvkeO4nX; Mon, 17 Oct 2022 07:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1929B60BF3;
	Mon, 17 Oct 2022 07:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1929B60BF3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16D761BF3F4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC1A340322
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1A340322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzc_Jon9I4EK for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 07:16:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08A7540321
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08A7540321
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 07:16:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FF191BF20D;
 Mon, 17 Oct 2022 07:16:45 +0000 (UTC)
Date: Mon, 17 Oct 2022 09:16:44 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221017091644.1104527b@windsurf>
In-Reply-To: <CADvTj4q+ztJca7+MEcOK5-gd94155C0X1s0_5-SvCxp=XXOptg@mail.gmail.com>
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
 <20221016075056.GI2503@scaer>
 <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
 <20221016160505.GK2503@scaer>
 <CADvTj4q+ztJca7+MEcOK5-gd94155C0X1s0_5-SvCxp=XXOptg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665991006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSkMYa0d3lXnypTm6II4Iw7tTm5bsyv2oZEviNtRAgo=;
 b=lkOT/Qg3UEIENobLUgjDMfqnIsa/spRzHP2IuiJyNUIrAqNkWcV6dwoYVb5PBXjwrh80XS
 7i48PasZGi2Th5rCAYAa/9jCMpIG1oEk6FNtR4TthjHpuXjMymg2q6s27N5O6OOgaW5nfr
 jtr+LBaKjf/n1jB9ys+EtzSR4aX4DKXQ0eQpcU/a+vXLlIHOVHiG7cW1tO5ZQd/2qor2q7
 PqKqbBHsruzkUvh8wD53LUb/CNvpxn76Pw10t8OPOmW6Z9z9UMC0TUDjhU6NVbQLJXMXN1
 AO7fPSvYvRlKsTm30uWKxSAWYmcUZiPXTzDSXgXSdIAR+VsLaMgvuOdt1lrudA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lkOT/Qg3
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun, 16 Oct 2022 12:45:06 -0400
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Again, that is very interesting, but please, please, conordinate with
> > the rest of us when you do such changes, because that is very weird, as
> > Fabrice noted, to suddenly get build failures out of the blue when
> > nothing seemed to have otherwise changed.  
> 
> I've been experimenting a bit in general with autobuilder settings to try
> and fix some issues with poor coverage.
> 
> One other reason for testing with shuffle=random is to make higher kconfig
> probability values more useful(as otherwise build failures will be concentrated
> in packages early in the dependency ordering) :
> https://patchwork.ozlabs.org/project/buildroot/patch/20220514214612.3221647-1-james.hilliard1@gmail.com/

Thanks a lot for all this work, which I find really useful. However,
like Yann said I believe we need to coordinate better. I think we would
prefer to see build results submitted on autobuild.buildroot.org to
only be generated by the official/upstream autobuild-run script.
Otherwise, it's super confusing as we get results that corresponding to
variations of build configurations/build logic that we are not even
aware they exist.

Another concern is that the autobuilder results are already extremely
bad these days, and therefore the priority is more on addressing/fixing
the existing issues rather than adding more. It's a lot
easier/practical to fix new problems when they are not mixed together
with zillions of old problems.

Again, thanks a lot for your work on this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
