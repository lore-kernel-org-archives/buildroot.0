Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC820C83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 13:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0792E60AC4;
	Sun,  3 Sep 2023 13:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0792E60AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IR4CpgSv5Qsg; Sun,  3 Sep 2023 13:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E5D60B05;
	Sun,  3 Sep 2023 13:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E5D60B05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42C5E1BF3D9
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 13:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C879740616
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 13:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C879740616
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgKHCZ2Wwa9B for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 13:52:20 +0000 (UTC)
X-Greylist: delayed 743 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 03 Sep 2023 13:52:19 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB8CC401B2
Received: from mxd-1-a6c.seznam.cz (mxd-1-a6c.seznam.cz
 [IPv6:2a02:598:128:8a00::1000:a6c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB8CC401B2
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 13:52:19 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-745b469648-c8rsj
 (smtpc-mxd-745b469648-c8rsj [2a02:598:128:8a00::1000:a6c])
 id 352551dfb5c23b4237516fb1; Sun, 03 Sep 2023 15:52:17 +0200 (CEST)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by smtpd-relay-76d7fbb4f9-c9scs (smtpd/2.0.12) with ESMTPA
 id 4bcfa410-66bc-480c-876c-5ef026dfc2e7;
 Sun, 03 Sep 2023 15:39:48 +0200
Date: Sun, 3 Sep 2023 15:39:44 +0200
From: Jan Havran <havran.jan@email.cz>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZPSMoPK4p2qgSw0Z@arch-zen.localdomain>
References: <YwIRMgNSkvP/T9a+@arch-zen.localdomain>
 <20230826230550.6618fa9e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230826230550.6618fa9e@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn20221014; t=1693749137;
 bh=n9586W3DDLPxMcWzw1WqbwvtwZjno1v087mNYyxe6s0=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To;
 b=VDNSRt7naPHoOJg/82gzEbpeciqLLROoTuKk4Iath/RNO5YhfO2eW35LWgKmW7A/9
 2td3Za5ZkBNLDFamQFEyezf8xIU2BTjIiq4YT2YEDDbN96y+NRxvR0EDpx50gnnWKJ
 jfRi8+MhJxFOIffPvi/vZox/RdrKxdeJP9D2n1gPuggmjzoCjGbsdD0WbxPhhFGNYi
 /gjwAs6NudnMo7Na+uuz0EG8b06D0aqphKOJvnxtmeE469FTooZcrxkdD9JP4UXEv9
 2v0kwaQTgc6Ez510WtbkBQ14RAzFtPMCxnteIj9+8Riv0Ntugc/3QWL5bdoiv4UAUo
 8Pc4tfJb/ZsVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn20221014 header.b=VDNSRt7n
Subject: Re: [Buildroot] [PATCH v2] board/pine64/pinecube: new board
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V=A0Sat, Aug 26, 2023 at 11:05:50PM +0200,=A0Thomas Petazzoni napsal(a):
> On Sun, 21 Aug 2022 13:04:18 +0200
> Jan Havran <havran.jan@email.cz> wrote:
> =

> > Add support for PineCube with:
> > - U-Boot 2022.04
> > - Linux 5.15.61
> > =

> > PineCube is a low-powered, open source IP camera
> > with the following specs:
> >  - Allwinner S3 Cortex-A7
> >  - 128 MiB DDR3
> >  - 16 MiB SPI flash
> >  - 5 MPx OV5640 camera
> >  - MicroSD slot
> >  - 10/100M Ethernet with passive PoE
> >  - 802.11 b/g/n WiFi
> >  - Bluetooth 4.1
> >  - USB 2.0
> >  - 26 pins GPIO header
> >  - Microphone
> >  - IR LEDs for night vision
> > =

> > Board homepage: https://www.pine64.org/cube/
> > Board wiki:     https://wiki.pine64.org/wiki/PineCube
> > =

> > Signed-off-by: Jan Havran <havran.jan@email.cz>
> =

> Sorry for the super long delay, I have now applied your patch to our
> next branch. It will be part of 2023.11. Don't hesitate to send a
> follow-up patch updating to a newer kernel and/or U-Boot version.
> =

> Thanks a lot!
> =

> Thomas
> -- =

> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thank you, will do!

Jan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
