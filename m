Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA63C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 19:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7192761B3A
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 19:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7192761B3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1620580CE9;
	Mon, 15 Nov 2021 19:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wQwxwk23D7F; Mon, 15 Nov 2021 19:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F3F80CDB;
	Mon, 15 Nov 2021 19:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46B1E1BF3F0
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 19:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F8686078A
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 19:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdQlggusdsUK for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 19:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B56F4605E4
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 19:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637006037;
 bh=xcn5ntOTMaWdXMCBZv+7+qyt1HAgoqaSwhBKjfOzd6o=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JMgfRTP98Sx3NQRX8oTfLbN3sVkXznscRe3hEKCd8FwKfZxoZ4R+c1o8OUjjJMTsb
 e3pbovL1pPAorrAZH7UZ3mwcYgcOCw0CZcWHjx1AhwcT5pKOkOqG2/10etf4CJQP3P
 tEVmz6dFJ3B3zLZ3vmw9OgBdrvecbsZ51x/hjAyM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.243]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbgE-1n7fkP1fJM-00KwMe; Mon, 15
 Nov 2021 20:53:57 +0100
Date: Mon, 15 Nov 2021 20:53:56 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Joachim Nilsson <troglobit@gmail.com>
Message-ID: <20211115205356.264286e5@gmx.net>
In-Reply-To: <CANP3Sck2vX1GV=T9+AUXLaQxE5bzMjoYp8pwSxh-oc4gx_qioQ@mail.gmail.com>
References: <20211115134205.4176891-1-troglobit@gmail.com>
 <20211115161851.0897fb8b@gmx.net>
 <CANP3Sck2vX1GV=T9+AUXLaQxE5bzMjoYp8pwSxh-oc4gx_qioQ@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:9A2gIYx2SgNupNV1x3G/pPC+TI9rL7ynVHvrKzpHDgJm0Fu9LiE
 5+JjlrwmxVyQ60/g6bIuEwdYr7lRsZOqr4nX3dKgcIsapbQ7oFU3lRxaJkeAzhfuC8pRlCS
 F652M1Puu5u26AWKsTPuQh7pzhvA9hhdUemHoOIFwnpSWB0MvC8Si02kqCkIkkl8/W4+Qtj
 nlaDWLPpJPERAwR1hMU+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TtyGRBVb1v0=:AvEw43Rko/aBK71GoMeYtV
 2HTjc/uUJI7JSc3C1n2GGgNv6LiecUGHX9stdDgHqdlbMjsGHBbWrNmwcLn6Mt5m4bAUkHyoy
 NsoElsib1u6N/HAMBpZFvFBfpi6ulyBvCsxMA234/KLeN9uhF2rOhgqM3xf4JgBfortkBlhC6
 H7rJ94JB78tyxJPkacP/UgyJDD66nnNOVwpS/cFGEwY2Xl4ge9MGtHTnDG3FR0WMsEtY4WpKS
 ZPOrdxATjjcNHZX8/K+pxZZ8GeBNDjHXX4nWWCj3/BfzA8BD0RI0vHB3ybjD85ktVtKvqu3NM
 wBtGOoV3nyOcmHiJja/5AAGnRHmNGRnttNcRylqoeIDiPBUjdaiOSDQcbYweAV2tLMWkRhuLp
 tgEFZ8VCmzfSbBtD1PCrEFmVchqdPRlk6GW8ScDWwt68zqDZXNQuwANaRGOqP3lHBLCac7ngN
 wcqvE5sgtwoagFUOAFZ9wNhqnju2Q4i9AJAEjJDurO/IQPsnSbjkfNsalaUPIwanoYXEqHiTr
 wDasNjdrIkUq4AJlhxQzjoEOpyo3uXk2H5/khGaj5A4noLM4f/BzlUxbWZ41mPSJ/Zvxdi5T6
 Yl3eUlXnvTyhYWQ/r97ptyrP3E0TpffBNfFUS1vntb46Lq3TjEXBflCa3hEwj/U1xiiKuJuZZ
 jd1kDMDfcS02xH+n1hiOmkkVus7KR091do7L6ZCJKlXBgaUG/CB6/7BvnpsKTjY+DKgvHQq7k
 e5kMk4gAaIYLKLIiRPCZk/dE5Wz+OOOlFnq49MHxT1A+zAkOIEI+UbPzrNsPqgFrdQzXAiccH
 KfiW4ZPmeWLNa+FYQE/iNDnjCpDpotHMJWiKRLj/m2XHinRkqYvqojRwoYO+uvgluFY0tDMzP
 fdwFej6srWwL+/Clz5g5RRYueM081M2dAu2d8uyFvIGj6E2SYRmAQFmeJH0S2R2xVoYPMQ5Om
 TK9n6rgnyVXVivZAz5ev1T3PlJbHoc0VXF/r4mJGBX1LtwQQHcw/TyssHH8RGQxKKduyeIo0W
 Jq19p1NcvH/m1cPNfarcPdITmzOm8fj2Y/2OlH0QseDwW6op30VofFWFN4qQdjy3Bjx39+B7U
 o1n64GHlq3E5IA=
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to
 v5.15.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joachim,

On Mon, 15 Nov 2021 19:10:57 +0100, Joachim Nilsson <troglobit@gmail.com> wrote:

> Ouch, sorry for the dupe!
>
> How does next vs master work?

Take a look at (for a short description):

	https://buildroot.org/downloads/manual/manual.html#RELENG

Regards,
Peter

>
> Regards
>  /Joachim
>
> On Mon, 15 Nov 2021 at 16:18, Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Hello Joachim,
> >
> >
> > On Mon, 15 Nov 2021 14:42:05 +0100, Joachim Wiberg <troglobit@gmail.com>
> > wrote:
> >
> > > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> > > ---
> > >  package/iproute2/iproute2.hash | 2 +-
> > >  package/iproute2/iproute2.mk   | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/package/iproute2/iproute2.hash
> > b/package/iproute2/iproute2.hash
> > > index 2837edb09d..d8d619cbda 100644
> > > --- a/package/iproute2/iproute2.hash
> > > +++ b/package/iproute2/iproute2.hash
> > > @@ -1,3 +1,3 @@
> > >  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> > > -sha256
> > 210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4
> > iproute2-5.14.0.tar.xz
> > > +sha256
> > 38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff
> > iproute2-5.15.0.tar.xz
> > >  sha256
> > e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> > > diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> > > index fdf442a429..4162e38eb7 100644
> > > --- a/package/iproute2/iproute2.mk
> > > +++ b/package/iproute2/iproute2.mk
> > > @@ -4,7 +4,7 @@
> > >  #
> > >
> > ################################################################################
> > >
> > > -IPROUTE2_VERSION = 5.14.0
> > > +IPROUTE2_VERSION = 5.15.0
> > >  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
> > >  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
> > >  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
> >
> >
> > Sorry, its a duplicate...., iproute2 version bump already suggested and
> > applied to the next branch, see:
> >
> >
> > https://git.buildroot.net/buildroot/commit/?h=next&id=bd06a3b9b507b14f3cf69f45ed165d132790ad75
> >
> > Regards,
> > Peter
> >

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
