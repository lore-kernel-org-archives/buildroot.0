Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 21:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6331A400D3;
	Wed,  2 Feb 2022 21:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBu5LN8FFcWP; Wed,  2 Feb 2022 21:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F2E0405B6;
	Wed,  2 Feb 2022 21:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5241BF300
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C44260864
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lQXUxEIP3KI for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 21:40:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC2426072A
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 21:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643838048;
 bh=zDFo2SHnt+U9AnAm8/5EezVxdhF8W76ms0HtrdxaemM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=R/tkZJLsBzz5vY6Abqx4DiuYRHLHnrcM8rK23f1G2M7Zhi93KfbhlPXKsbfM9ihRR
 /XA2e3y9FA3xJJ5INuHJXPF6a9KzEx9QdI3hQRfADmbxSYsSfpTrN3OngTYaW18PmW
 o2OjfrZdqFfK+aUv80NS92pvpPZkgWA3rjphidK0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.145]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdefJ-1mgJjS3nFp-00ZkJd; Wed, 02
 Feb 2022 22:40:48 +0100
Date: Wed, 2 Feb 2022 22:40:46 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220202224046.1ccef19a@gmx.net>
In-Reply-To: <48ab9669-d467-a394-12a2-fd229f6229f0@benettiengineering.com>
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
 <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
 <d6ff992c-a84c-d335-3ddb-2122f7c744dd@mind.be>
 <20220202214210.0a2483e6@gmx.net>
 <48ab9669-d467-a394-12a2-fd229f6229f0@benettiengineering.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:jk9F7GdUmGjtIkcVQGn6eEOp+4hdQfzZFm+HMRBh4uEymc6Jo/C
 fwMFqTMlh0ASMhTgezIpLmKoRpsXSkSDM3quUAS0hz5A6yuubmAVGBPCtIc70kcurKjC5ZP
 QSGMF1uhYBjRwF1Cz4ulKAVokZ9rHZl0+GGxMMSi8/5chyYWCqFn7oHQc0vQGpeE6RXhzEX
 JGbf/QfVJ6sfbAWi0Hraw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qZvsxAiv8pE=:osiQ03aP20G7rkcjD3+bAP
 OC1M+S5WaK70yfD/4UWrTdYjy97ZJSmVkcx94BpN2P4GBr4V8Fgn6RxrDnTAoWuTHuUN0idcz
 woaMlYQdBGq/kTBtCw8DBs03YBaR8P2PX8BpJAvUEDm6DXAsaPke/OTu2nKbOqaYBHyulgfwT
 tVt139GcL3j2FGOqGS5p83RHAablie6dEEzhbjMZUriyUDCMDiIpy/3y+mqz3FBJI0MIWZgb5
 h6+ylIAp9RKY1nsT/w2fRbnCB3VunpsRthx/qHs7YTR2AfG2dQICXdJb7shdG1pdHm9Pf4FI3
 j7lySJAM0r6mBJxG+5vgB6MJI61FuRNefRP+MFnDaEJND5aVQ4TgjNizNMoW8sgOB/2ULQxFY
 Ajaca4WlXHnRNHyd9hYdRBHKNIeBfssPgVDW8nK2+YTGXzfdfg1mgUYYhGHK1rKwFnGmowwBy
 tqJ0z3MOtw+4SRBFnptgc5sWqw8TrkiW8JPkUqiLP4t60xr2Ip1ZamS8Q0PAkXkhsResneeJZ
 P5cLZDHjIhfr6UOasK49jYXtSBKrpGYQxyQglgoANA1IhwspkzSp8+a1R84CurezbDBw7jA2I
 ixcG8GN8IdQ7MLVfzXWVRsQu45+mg3NQt6YxfLM8SoO+CkvCr11o0NdJSMAA79FU4qRzuAov8
 +V6kHucrZJ/iTnL0QnYS4UAlpIP9LbhVoeTPMNKwtr3P4oDCql3XfPE+ogpieJdm61h5PoE7U
 GY3Bk37NjLybgp9yITIwf5Oyvz7MWIjaYLGPnu7VRSP/9WT1O+HY7ZEbVVjgCnfjpP8PYjqPZ
 t6GtflYNstzxriL9EOscA4qWjV0mYM3Axth0DE7hA0nVsAwf2l+L/QJyZcXIgeAmkvuCKzJb/
 R4cYyNcih/rI+Hm8LALZoI65Kc4O2JnnUiBpmqsYIDv2o46v7QWP0E602Rua0sqmppqMtj8uV
 DqqHZ1pth8Gn3hCba0xujTXi336DkXhXhpNYzsvZ1cqUpVw5bK7n4Mrs/XuxSqTacy5Dq4Ywa
 s7jQvxO23JIAKxXV5sPmkvkjSlWHwOUtPLHFXYwCiTLTBrPQtR1KuGX/WFWpnr0Tl+X3moHYB
 IDVcM1dl2qOmBo=
Subject: Re: [Buildroot] [URGENT 1/1] package/util-linux: fix host build
 failure
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Wed, 2 Feb 2022 22:09:22 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Hi Peter,
>
> On 02/02/22 21:42, Peter Seiderer wrote:
> > Hello Arnout, Giulio,
> >
> > On Wed, 2 Feb 2022 08:41:34 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >> On 02/02/2022 00:22, Giulio Benetti wrote:
> >>> The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
> >>> building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
> >>> host-util-linux is used a lot, so this patch fixes a lot of future
> >>> builds.
> >>
> >>    Darn, I tested that, both with and without BR2_PACKAGE_HOST_UTIL_LINUX set. I
> >> don't understand what went wrong in my test...
> >
> > The raw support depends on the available toolchain headers, see e.g.
> > package/util-linux/Config.in:
> >
> > 	config BR2_PACKAGE_UTIL_LINUX_RAW
> > 	        bool "raw"
> > 	        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
> > 	        help
> > 	          Build a linux raw character device
> >
> > Or according to [1] '--disable-raw' for the host build should do
> > the trick too...
>
> I was in hurry to produce the patch last night, so I went for the
> fastest way. Can you give a try with --disable-raw and eventually submit

Thanks for taking care!

> the patch? That would save some time while building. Also because
> host-util-linux is used a lot

Sorry, could not reproduce the host-build failure on my system, seems the
toolchain is too up-to-date (openSUSE Tumbleweed - gcc-11.2.1) ;-)

But can provide an RFC patch for testing...

Regards,
Peter

>
> Thank you!
> Best regards

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
