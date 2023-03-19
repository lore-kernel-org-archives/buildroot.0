Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EBBC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 10:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73EB681306;
	Sun, 19 Mar 2023 10:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EB681306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5nuV02X0wiA; Sun, 19 Mar 2023 10:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC4B8812BE;
	Sun, 19 Mar 2023 10:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC4B8812BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7651BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34C04812AB
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34C04812AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LF9Sj2axeGC5 for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 10:18:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53B0481289
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53B0481289
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 10:18:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.48]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQv8n-1ppcL33JXb-00O27P; Sun, 19
 Mar 2023 11:18:38 +0100
Date: Sun, 19 Mar 2023 11:18:37 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230319111837.22afb623@gmx.net>
In-Reply-To: <20230314222029.1c818de0@windsurf>
References: <DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9@DB4PR05MB10390.eurprd05.prod.outlook.com>
 <20230314222029.1c818de0@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:ykgWSpnC7ZQKNcbaILI/QKxzohChceOSkGF3oQRB2e679K5gVbr
 Gu3mOyUvuUfsDBMsZMljdn7ZhVKAmLfN5Bu2M16pWIl6Ieo3KqPMBcjro70X31S19/DP7QA
 MKRcz+NlXdKsyGdgbkZ6WT609GPL1zazUozH1lJhN2yufglS3JtzoDRxMpHHnWY7NZP6gxA
 USnt9pAGvfEGFpRYVKYUQ==
UI-OutboundReport: notjunk:1;M01:P0:BuAdgjn2NVc=;7rpnLmfsGHDw2y02vavo1iHczPL
 z5vRjIBRmpDN9eb1VT4npMwG0652Daa1lvsCXpwBrKaWk4eNI/FfhjehvtqJLU4Zv/jQXOTgc
 Dm3+fdij60DffGToY0qfKCf1BgToe8nY4DXaZLhHUn1gRQFBGIhTiW2IW+nQxeENXnj+qfw+H
 FDks3d3EQNsdYEILN3Kcgiw/mIrrzCkuqsjvgAD4UWKu7NUaHkhg2uVcm+LIz7VLSNJFIAK/s
 Mb3lmFePjKjyhl0JtQJnHMoRMGJp5ngzSylbMSvTmiERKYrxDeiy8MxEDIK7OYO5nDjaaZWKt
 jQa7DkJuyrEFQp9ZT9LG17Ogkbyif0qzwOHnrznafqPynrhPMFDy9ZbPHnkG0nvWNs2jYczXl
 5Lb+gxgluVfentSFwd8Ai4RptsvTdvlXGe/7LiF4P8Cx6ustS/tbR8/YQ+iFqEy7ZG20R0ygr
 ycBj7j+zDXmsKSW/SFSNCO5RNGOTgRSTCCsG/EWyBCOK0t7As4u+bVCpA5fBJV+Wd7rmT71xZ
 2A+PAQpyWUMpdQbpoQqAvcERTmn8Po6Kc4scCSaYYFVXxGIsreBbgHBy7t6651NSIjkmzIknN
 a5TjHQbtNMX3Nuw53KhYI5uVlof5q4Osl4ubAGRmgujUumVv63giDsHVER5cKRS8pyKsaagFj
 24keHr3T8aT4SR02Z1qYhLojuuQrBkkVmH2MWsZgl6GfIONuRMRTXGP3GjyJJWFZxvGnFptpO
 ZjGReSQ5+brPhnOnOrCBAPH8Btr7HAvTx1UdZaYnLBAoZZF4rIrMaTV5dwKYHQvuaioJEDr5M
 c1DnizpgCq6PskRqswJd8LVI3Qx/0cOnJU4H343H+CNdKFxI/eL7Rwb3PZc2SrTY57Ous6HKn
 Mvs4LfjVdyYYr8nm9JkNZtloQ76g5ULlUJwyDX0RQPd+8gRhDykqpnhPaPrxin/D9MFLtrMR1
 0h7Fbmbtq3F4As+oMLisv20LHgs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679221118; i=ps.report@gmx.net;
 bh=mTBqlebitMjbrV6h3LIOA4ZPuiFjssS3eRCxxjKC9Ss=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kVAvDw5ZZAWOAkv2wiJPj06vH/Bfedgl5d+S4kG6lXiLGaF/US6eMa873vVK0lcvP
 MFISxvLr/fMG3aGnFdveuHxSh75Sxre3yt/84mJkFmHP4f4hoI3FmUDtivknAOtZmG
 PXe6NigFFpc+j0Z/jx8Ninhzhh/ppfxsmCdDEIHNV0dodtdgvTbGSyDeNhwJsMD+4N
 DJnfwPopAX1Awmfto9gwiEZLh6MIDgK6sUyH81vZjCBQI7HhgbBmfCi/ZgQ882vwfc
 q3WrhzD0Bn0I2sObsmvZd5Bxbf6dwM31TNiTlGamDIoTzLWobRHbXeWONA8iFPU2u+
 DFzQzPdMGBPyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=kVAvDw5Z
Subject: Re: [Buildroot] Missing support of libsvg with qt6
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
Cc: Ivan Castell <icastell@circontrol.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Tue, 14 Mar 2023 22:20:29 +0100, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello Ivan,
>
> On Tue, 14 Mar 2023 13:03:01 +0000
> Ivan Castell <icastell@circontrol.com> wrote:
>
> > We are using buildroot-2022.11.1 to build a custom QT6 based project. We have this option enabled in menuconfig:
> >
> > BR2_PACKAGE_QT6=y
> >
> > But found this issue building our project:
> >
> > Project ERROR: Unknown module(s) in QT: svgwidgets
> >
> > It seems there is no way to enable SVG library support on QT6 (at least we don't found it). However, SVG library is completely ported and functional using Qt5.
> >
> > BR2_PACKAGE_QT5SVG=y
> >
> > Does buildroot will support SVG library with QT6 in some future release? Is this still a work in progress? We have checked buildroot-2023.02 and even in that recent version, is still not ready.
>
> At this point, nobody has worked on packaging qt6svg. However, taking
> example on qt6serialbus or qt6serialport, it should be relatively easy.
> Perhaps you could give it a try and submit a patch? This would
> certainly be welcome!

See [1] and [2] for proposed patches...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20230319101420.9440-1-ps.report@gmx.net/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20230319101420.9440-2-ps.report@gmx.net/

>
> Best regards,
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
