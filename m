Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21067C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 923FD408FA;
	Sat, 29 Jul 2023 21:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 923FD408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYthki2HTVFt; Sat, 29 Jul 2023 21:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65CDF408EF;
	Sat, 29 Jul 2023 21:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CDF408EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBE801BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B107060E43
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B107060E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8AvulujJtiI for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:03:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15A4B60B21
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A4B60B21
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEAB460003;
 Sat, 29 Jul 2023 21:03:35 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:03:35 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230729230335.3cd59db6@windsurf>
In-Reply-To: <CABGWkvoEvH=4=OmPQHm5T1XMAQ11x-SixLpAxkUL1CUtUrF2_A@mail.gmail.com>
References: <20230528113042.585399-1-dario.binacchi@amarulasolutions.com>
 <20230728230159.6440c601@windsurf>
 <CABGWkvoEvH=4=OmPQHm5T1XMAQ11x-SixLpAxkUL1CUtUrF2_A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690664617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1iUAWak93F+fDp1Ay9bjsNxpynXBe1THSkCSkuaKw4=;
 b=SOyhbcCupSPkk/L0g1Tp79xRpsqvv9NejlMWBOq/jHMpMwa5cMAKUNrtpCmbLWQe1Ci4RF
 T0YOTtyfPItWChhcHwUgMyQe+csDGh7H8Fnh8Rc5s+xDhc1nVjdqV44OW7WmGftFuFKDET
 qez5G1SbGK1uY3oawdXJtV+rZomKqT+uoqGJtzcKCnmLvJNxd510TNLtrbgsVl4VKzPt49
 HjYF+48J8xAAiiIq1bdcs47P6otPPmyP8EtWcv+3i4ZfWkbYaVKiAB4BbK5ASo8pEqyUDP
 Bm/hBaknQI/uu+aBO9GZJpxje523gvOze5AKRlF7WEWrdBTgz34RIloh2Sbsfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SOyhbcCu
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jul 2023 16:47:14 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> > > diff --git a/package/automake/automake.mk b/package/automake/automake.mk
> > > index fd7933dd74f9..fc235784641a 100644
> > > --- a/package/automake/automake.mk
> > > +++ b/package/automake/automake.mk
> > > @@ -34,5 +34,6 @@ $(eval $(host-autotools-package))
> > >  AUTOMAKE = $(HOST_DIR)/bin/automake
> > >  ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
> > >  ACLOCAL = $(HOST_DIR)/bin/aclocal
> > > -ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
> > > +ACLOCAL_HOST_ARCHIVE_DIR = $(HOST_DIR)/share/autoconf-archive
> > > +ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR):$(ACLOCAL_HOST_ARCHIVE_DIR)
> > >  export ACLOCAL_PATH  
> >
> > Could you clarify the motivation? Do you have a specific case for which
> > this is needed?
> >
> Following the suggestions of Yann E. MORIN in [1], I tried to fix the
> issue by submitting a
> patch to the ethtool project. During the various review stages, I sent
> a version (much more
> complicated than the one that was eventually accepted) that required a
> specific M4
> macro ([2]). From there, the idea for this patch was born.

What's confusing to me is: how is autoconf-archive useful/working today
in Buildroot if aclocal isn't told that
$(HOST_DIR)/share/autoconf-archive contains a bunch of m4 macros?

Ah, I see:

LIBGPIOD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
PYTHON3_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
etc.

So it would indeed probably make sense to factorize this. But the
problem with your change is that $(HOST_DIR)/share/autoconf-archive
gets added to ACLOCAL_PATH even if autoconf-archive isn't
used/installed. We could decide it is OK, but it should be mentioned.
Another side effect is that once autoconf-archive has been installed,
*all* packages will see the m4 macros from autoconf-archive, not only
the few packages that explicitly need autoconf-archive. I don't know if
this is a problem, but it can potentially have some side effects.

Also your patch should drop all the <pkg>_AUTORECONF_OPTS =
--include=$(HOST_DIR)/share/autoconf-archive, because they become
redundant.

Full list is:

package/libgpiod/libgpiod.mk:LIBGPIOD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
package/neard/neard.mk:NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
package/python3/python3.mk:PYTHON3_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
package/sdbusplus/sdbusplus.mk:SDBUSPLUS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
package/sox/sox.mk:SOX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
package/thermald/thermald.mk:THERMALD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive

Yann, thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
