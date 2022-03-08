Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D84C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ECA960E06;
	Tue,  8 Mar 2022 20:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7OLQ0gC66Y7; Tue,  8 Mar 2022 20:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA78560B64;
	Tue,  8 Mar 2022 20:59:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 509911BF3D6
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CACE40374
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxwOc8y3nIO7 for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 20:59:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8762240108
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646773188;
 bh=yHYv5GzTPlPgk6QmJenhpmzbMs8c1+pQYjt3BMJ/z6A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=VyMR65B1wdGyYldjGxTULEOl5+Ncvj7/axlEQJ848XuuMQO59SmH37+rbxr7dSvBA
 hpffZ6/O9l1+fmQAj8e0ecdDeSf2Rf2zyMSLPLipBN5ZJ8rfFggQqPbfajR2WS9daV
 yxhBTyp0rkQmTkekQ5MCTS737YPsJvwfAK6jEXvc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.213]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4axg-1nQ2lu35Ow-001lDm; Tue, 08
 Mar 2022 21:59:48 +0100
Date: Tue, 8 Mar 2022 21:59:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20220308215947.665d0fac@gmx.net>
In-Reply-To: <CA+h8R2rvGjfPkc=AdUXJobisbhHCL6FLJy7D1SGq94mk0HFJ_g@mail.gmail.com>
References: <20220307224226.1375696-1-christian@paral.in>
 <20220307235417.279e7751@gmx.net>
 <CA+h8R2rvGjfPkc=AdUXJobisbhHCL6FLJy7D1SGq94mk0HFJ_g@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:/L9wiO5m00xjHtTW8fZZ4EvMZPGO2EQE2AGuZAiQcpBQ2tdM2Ua
 NQtFq6/HJN1vZTCsiP0rvE4kuM9SUAN+VldoK3OZQTw/7Um35cVVLk7WChPk37XSmCU/RKw
 mRrjgaK3McL83bSYdKGik5378aBXaX/ZJ8iNUK9h4m4OAtay+PtD9Sk3K4d+NZG6s2yOXD9
 A/LKwBXyGN80UdFb9/ytA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qxkWrfssXR0=:RbiO5K7QJges3I6WKouRhs
 jSxFg0xraKrOOY2NbE34OIH/G5u5eG2Fpy/Q3YWbb+pcNZVGma8//HhGODDeL6hgyCpAiQ0yz
 Tc8j8KhZqTFI+jSnkJEfdWqRWsuaEznggUAyBmR3dcnuP0BMPw1GWH0EWhkb6zuMw0U6Z+Zi8
 IUhZc4mITXJgwhmDxYc0u+SeTGyABdQps02xRPG/qc1PAd1GiN9GodrhLSmxZ9MRRpdUyahDx
 Egl0TNxayjIWts6jmGEF2vqLKHnDQHPvSjLZ4YZ9QMZ6t/jr2tyU3sAK3w+V+IqwJOZ47jAWu
 aDiDvWiB/9VB4g6HUcRTyzApo1StyLizngEGMuWEdAlANMhs3s++tZ+awEAymFnD6UkqPU3eg
 6pIoW7hVBC3tMGFJPJM/a4u1w1IxyoSoveb3xjagBUOEfccPLNFc7gbwaVscN9od4KbItwFhP
 W/fi4XkIJihtmGCnCo4OrkNkJbs9i1tsRgdaQHoxNHG0qPvVmlLyVS6phrZjaNrEoVxO6nDAz
 ukbPq1HBe190+9M09TExV6Ebid/vknVpOH/x6MHMjhkDlI+79GUiXIx0Q4W2AsCTyKQavOlIE
 s//2/ybi8KQMkiHlbsO5nT/WYDGp9ApWOARJh6A03Pteu9gzTqrN6t5Iuni3ovEdgVilK/0QL
 ta+DtlHjCxRYi0L6erLazMbMBC7weXnXlBuaWKkS/rZA7qO7lICKtmjuOJt7oVWu1qgBuuQ9h
 6xyMBpcj+scTppcypZR2xrR0SOcOXg/nCutZj5du1Qy97Qq8TE073Wni/tzLG8ebPyO185E7q
 UrlLxJamIWHWLZVLZWdijtounpJb7xOXTkXicp9+V/H3847nwF/nOoNdVsqXDUypTwMSX/gwx
 PkiiqI0FDgSzHBUolctxciDJLhG5PkSt3qb7BV7kndl4ffJAmTVXG2SSAJ58DslVSPphT0KL6
 XeNk7bPGMxGUntKupcgwl4v7AABA9GgvjKYDP1u8e3lFl0LphidVq2s+iS5ICcA1+H6CA/oCv
 80HiDoMgck+Fj/7nZpszhBQvnilHow+e6lDrXdO4tpluZLNR5WcZogc9cdqTGGtl5JEF+dTV6
 J2rXbx1xE/9ZVA=
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rpi-userland: add support
 for aarch64 build
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Mon, 7 Mar 2022 15:03:25 -0800, Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Hi Peter,
>
> You're probably right about that:
>
> On Mon, Mar 7, 2022 at 2:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > On Mon,  7 Mar 2022 14:42:26 -0800, Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
> >
> > > Tested on Pi4 Model B (aarch64).
> > >
> > > Note: rpi-userland and upstream rpi os now support arm64.
> >
> > All issues/questions solved since discussion [1], [2] about
> > missing libraries/features?
> >
> > As far as I know rpi os graphic support is based on mesa3d v3d/vc4
> > instead of rpi-userland libraries?
>
> I use this package on arm64 for vcgencmd (videocore) and other commands,
>
> however I have not verified that graphics work correctly, and you're
> most likely correct,
>
> the arm64 stack probably is using mesa3d vc4. I boot the pi4 64 bit with:
>
> arm_64bit=1
> dtoverlay=vc4-fkms-v3d
>
> So this is using vc4, as you've mentioned here.
>
> I suppose to fix this patch, it needs something like:
>
> ifeq ($(BR2_aarch64),y)
> RPI_USERLAND_CONF_OPTS += -DARM64=ON
> else
> RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
> endif
>
> Is this correct?

Did not (yet/lately) check if really all the above libs are disabled
with the ARM64 feature, but at least a starting point for the aarch64
use case....

But needs a corresponding aarch64 handling in package/rpi-userland/Config.in
too (select BR2_PACKAGE_HAS_LIBEGL, select BR2_PACKAGE_HAS_LIBGLES
select BR2_PACKAGE_HAS_LIBOPENVG, select BR2_PACKAGE_HAS_LIBOPENMAX, ...)
and maybe the help text needs to be adjusted...

>
> Thanks & best,
> Christian Stewart
>
> > Regards,
> > Peter
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2020-June/587538.html
> > [2] http://lists.busybox.net/pipermail/buildroot/2021-October/626080.html
>
> PS: I've noticed that my e-mail / name is wrong again:
>
> Christian Stewart via buildroot <buildroot@buildroot.org>
>
> is this on your end or mine?

Maybe both, I got your original email with

	From: Christian Stewart via buildroot <buildroot@buildroot.org>
	CC: Christian Stewart <christian@paral.in>, ...
	Reply-To: Christian Stewart <christian@paral.in>

My email client (Claws Mail) seems to ignore the Reply-To field leading to

	To: Christian Stewart via buildroot <buildroot@buildroot.org>
	CC: Christian Stewart <christian@paral.in>
	CC: ...

But the copy from the mailing list I receive is missing the

	CC: Christian Stewart <christian@paral.in>

but keeps the other CC recipients...

Regards,
Peter

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
