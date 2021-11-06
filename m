Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1561C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:31:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F76611C0
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80F76611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D14B82702;
	Sat,  6 Nov 2021 11:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeL3RaFOUx6P; Sat,  6 Nov 2021 11:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4939826F5;
	Sat,  6 Nov 2021 11:31:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBF061BF83E
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5E8F401A3
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHuuJo5SPVyR for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 11:31:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9756F40010
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636198304;
 bh=WqgRsbgt38iQLnmiVKiKFMgOsiI3hgpvAUIKBbhPSsY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=G0GWEJ0ANbV57TFDXeShZrijOuisI28LJiLaIrixhNEZ7UlcRMTozeeBM4VJ/0dXI
 1b2oPSjVkCvexTh5ELdX5JJn/TQ+rhlbnydaBDQvSxAh43LxL3mpdNm4oqqX2EwLhE
 sNNKnnvgB/aL+M0SF/N3kFoovD34I4kVaOfVlEnM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.26]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGhyc-1mvwyb3qZ0-00Dsco; Sat, 06
 Nov 2021 12:31:44 +0100
Date: Sat, 6 Nov 2021 12:31:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211106123143.111d920d@gmx.net>
In-Reply-To: <20211106115044.0d35c30f@windsurf>
References: <20211104203310.5829-1-ps.report@gmx.net>
 <20211106115044.0d35c30f@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:nU7reoy0P3uHD13NMCY9VoUTfu4ey6wm2v4ZSaMXGftQ6Qoejcx
 YeZCsNonqXz4QDwjujwU1exxDD4w0dxqJf17p2dwFjI2NjT4C6QOuiw6aucip2laJxWaurf
 S4XK6QF1KoSYfUfTyahtgx+0Ecn+D8RxjOv1XBruOu+ncxXZiRnvkyP6jbx0zl80+A2k3Of
 DGpJpPoP8zkLt3iKkEilA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e/1W4utCNiw=:hiF+WKwtYTPzFFK932ZEMF
 NEuVbP9pUsWoDQbLnYlDBANEEFPQen05Vtn/fSjO1P6+Mt6EmYOCkaqqpLvlkQdHftUgkZmg7
 5D2TcFQjyZ/Mth5+qry7MZ14iLJ7/0XXc0RN2pP1kDHtO2Oi4VN66UaATNZgD295auL56WNMF
 wWDRx8yBB5LZyFsJM7GIPvvtgpjGxddiM/c4ej2aLIw/cHYCbR2nHEukYN3H2ofIcQWkR5uEv
 3G7Hlmz0kdJ+IYqAiYPxgm/QfF330y99sdNHGeWl46CtGxy2EHC1jPKRE3kujr1mbnT7Xi0yq
 MesOfTh/8r5cCzY9FlqL5EA4mIwVevQ6hFxu6Fl449R5mqaGlrj4rUcamY7R8FwV3+9x8VmOA
 sz+1BVvlmj6kVuBsOKE2JWQtDNMJog3ghVn95W71H17dnUdS+iK+VF3PHn4f5pvmvJTpT1T/L
 nCW2vH8nCDcTkRbZ9lRDxlaiL9NvpjzKSeuu0xgieWQ+WAy5f+3UPXHrE8AVXjLPL/HYF6ql3
 oGJ2SO7jBSCKvZXhG1r5KC9AsNqL1yiFgylOmrzU7h/t9Ot3Q9AOTHhazBDp//NWxwXGHgzRi
 tK8P58rU0DZh2AKD8s0AJm/YzTp2xKF99Vu+WDlqYpQZNjHSmqYb6xfRMhlthD5NUefRXvisd
 KiZ1f6TyfIGxqznFD1HQsq+ZZPIlASAj2xpjowhXnXr25d4x1kY9trg+vjiScOsmPN9yWv6oD
 VXQF2qND3amRnj9tBftWr8O1b4wQF5IG0OdMvYV32fmcg7wDyWo460shzMF4U+6UmPnDwKwCa
 NaKFs6oHrADijuFToOZYEE3PWAyg5IMbiiPMw6NTK4+Us8KLkRihpMSPDGYFYlxhguR2PW7mq
 BCnKDJrakNp6MQ2y4A/XAq138IK6+0djJ7aSUMImaSUeU+E3CebT5gHS3XYRC/XBdRxrWjB1c
 PKXCne2OXWlTBpdI4yVlRiGt4ui9Y5pib4frgOXoWa7uHdq2e4V7qHeQwiw1pHvdW6aWF8yqU
 +TiAwwnPybZ8pkebm+V8SvorAChfu4oEg9suR1niQALsOgCVFMm+xghKB1cLmpvGSf6mJcRL2
 QmA16tH3+qtyQM=
Subject: Re: [Buildroot] [PATCH v1] package/gdb: fix host gdb-11.1 compile
 with simulator enabled and glibc >= 2.34
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

Hello Thomas,

On Sat, 6 Nov 2021 11:50:44 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu,  4 Nov 2021 21:33:10 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - add upstream patch to avoid host gdb-11.1 compile failure with simulator
> >   enabled and glibc >= 2.34
> >
> > Fixes:
> >
> >   targ-map.c:412:17: error: initializer element is not constant
> >     412 |   { "SIGSTKSZ", SIGSTKSZ, TARGET_SIGSTKSZ },
> >         |                 ^~~~~~~~
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...sim-filter-out-SIGSTKSZ-PR-sim-28302.patch | 110 ++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >  create mode 100644 package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
>
> Applied to master, thanks. Did you verify that this was only applicable
> to gdb 11.x and none of the older versions?

Yes, gdb-9.2 and gdb-10.2 seems not affected (but did not check the details why)...

Regards,
Peter

>
> Thanks!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
