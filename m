Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E76FC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8DA34136C;
	Mon, 27 Feb 2023 21:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DA34136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRHAAEUS-xDZ; Mon, 27 Feb 2023 21:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C7E416A5;
	Mon, 27 Feb 2023 21:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C7E416A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECCB1BF28C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 270E1404FD
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 270E1404FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwwit5CAPjUd for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 21:41:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA6B40138
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA6B40138
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 21:41:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.73]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1pRYRY17Op-006MI4; Mon, 27
 Feb 2023 22:41:15 +0100
Date: Mon, 27 Feb 2023 22:41:13 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230227224113.0eb16910@gmx.net>
In-Reply-To: <PH1P110MB16030F6BC0949CA7477F0B829FAF9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <PH1P110MB16030F6BC0949CA7477F0B829FAF9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y+xYaIi9Q6kwUmibdOkIdy4/cALPoPmUBqD+QyObzzIUuoaadQ1
 vWqNr2d288117XNKsKVnZ0R8bdGCgmfigiLZqgLLDj8440ICkk6xIHLQ9n3s79EiDh4XeXV
 d/s2R42+AvZZTpGUWG6rQduv9wzqBqt4eJWxWg1cy7wECEk8zTc4x5OKOWK47tdcGJPzWYT
 n9Mq1HKfHf68UOOkmvDPQ==
UI-OutboundReport: notjunk:1;M01:P0:Y54sdCYN2fo=;1MH8rOXMwX6Ltd0gJ/w7QyI5sQf
 aNVZAH0B1dvdkBYKJbzloWRUNOQpAaTjrx5uPZosYOZRgM5JaHZXCJ2wFursBSbHR3MS64FdI
 h6XBbJffCXKh9z6D7DfkLw2xaO0vk3BjUfLBvn5IY7/bHz1LG2dcG5KIVrDkRe1Q7RjUKIfQP
 NDzrfRJCHIm1rb17+ebJLJFl6DaMCRDEu3pSx+hsO/lJRYb/08kqMTzV/KH8VzFgaA6fWQZY5
 pcAyHfxss837l1NG2zYgt7jsnFnMK2TvlxPyLOfr5AGhEDFeVyCbLYy4mLqrjnIIFmknKkmMU
 ltx1dvU1mJqBCnSPdRlkHnSpG+OxSFdYGFFbGj4D06rt/hA78t6PrrWQGtSTzXPaBcicK8SBv
 IF1Zyz00Vj8IhrQV/pSK5GWI9BIbDStURIB6mROwKDmXIuNOzyybiC2Sa2ljrlW2Mgcj0kvps
 liMp1uanSYWGp2X/QQKtEV91KmlYjLGWnm7CgZyanr8VfEZGt/9dFInd4CBfiFk6L2dhfut+t
 nIMobceRtMbyIO8h5mF35mlose1cy0ZRaTBxRDXz7yn65AQ9HbDvu9n7qYLOPPzeeM53q7Ylx
 zmhdHnjy/wI7cbzIZdWtUG8SBWNrADi96lm5nLZq5sOnRWyLvUZ5rTBt/J4xIW8BUTG9l/VYY
 c4kOlgcJHkv3j6C3+1R65IDsXi2QYWovWkflageOP9gKdvPnON8CJkA1IQ9bYjwu6svLf3phG
 Ccz91L9UV8ApDZS9WZ/RU/1zIOQKido1CkJgTyDU1/7sWc2PZXV9ThD8AP0kyDdrBV7d3Ujin
 MZkATv9Z8XA8Fd1avtxHOZsOobZh6QXzVgWA6fvXj/tDqPiCIhm2Z3Mu3be82NyanArgTf/Yl
 QLU7032kcI2b+7mdDZxSqu7haXaOYQOUWUN4NKeKkv/b9cGt9BbLX07e3vL8tB0C+u1d9zGOs
 z+aS7/sixy5yQAZY94/2SYfNbhc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1677534075; i=ps.report@gmx.net;
 bh=kwI6kJnvjKBR+xLhTUGpFhwuAbVeW1m/rmPsOSn8aBs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JxiLXT85esCrI1ZSvNO2A/hlUx03Exl2VF1eEF4b1xF/E50R3aE/OFZ4fSSAyyDXv
 9BoRnVCIbfuyv+WWnRAOvZKDxduHnDXU+TUZfQMnH7on7Uuasgv5RpT3nGECE1UkDv
 PeexIcoIpzDkIaUEHVGCgK3aC1Uinr9kDdsthoWpHpLKMRgyGjZCvZOh9vz521jlfM
 4LDDfED1irw4VmYuRJi5N3PDr6ym2IE4UymdYYD5RleDCJu8YRoNUiFZxwBoW3VbDL
 4IPYs310oXhxZlC+/tN8XIerUV4vR94d9E3E5eBo7oabckpA/nvPM6fwZxF3zSEXvk
 8Y4h4XmaK9ucw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=JxiLXT85
Subject: Re: [Buildroot] [PATCH v1] package/speechd: fix gettext version
 mismatch
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

On Mon, 27 Feb 2023 21:17:40 +0000, Vincent Fazio <vfazio@xes-inc.com> wrote:

> Peter,
>
> > -----Original Message-----
> > From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Peter
> > Seiderer
> > Sent: Monday, February 27, 2023 3:08 PM
> > To: buildroot@buildroot.org
> > Subject: [External] - [Buildroot] [PATCH v1] package/speechd: fix gettext
> > version mismatch
> >
> > - fix gettext version mismatch in case of BR2_SYSTEM_ENABLE_NLS and
> >   BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-gnu" by setting
> >   SPEECHD_GETTEXTIZE
> >
> > Fixes:
> >
> >   -
> > http://autobuild.buildroot.net/results/283333290c5adb48d0c6e592b3261992
> > 537f92d3
> >
> >   Making all in po
> >   *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> > gettext version 0.19 but the autoconf macros are from gettext version 0.20
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/speechd/speechd.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
> > index dee94a6752..ec62980986 100644
> > --- a/package/speechd/speechd.mk
> > +++ b/package/speechd/speechd.mk
> > @@ -11,6 +11,7 @@ SPEECHD_LICENSE_FILES = COPYING.GPL-2
> > COPYING.GPL-3 COPYING.LGPL  SPEECHD_INSTALL_STAGING = YES  #
> > speechd source code is released without configure script
> > SPEECHD_AUTORECONF = YES
> > +SPEECHD_GETTEXTIZE = YES
>
> I wonder if this will actually be necessary after https://patchwork.ozlabs.org/project/buildroot/list/?series=343029
>
> Can you test to see if it's still a problem after applying the series and using autopoint?

Yes, already on my ToDo list ;-), in the meantime (and for master branch/2023.2) this minimal patch...

> Otherwise I'll try to find some time to test your patch with autopoint to see if there's still an issue.

Thanks for taking a look at it...

Regards,
Peter

>
> >  SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
> > SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
> >  SPEECHD_CONF_OPTS = --without-kali
> > --
> > 2.39.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> > CAUTION: This email originated from outside of the organization. Do not click
> > links or open attachments unless you recognize the sender and know the
> > content is safe.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
