Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142CCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:54:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7524160F23
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7524160F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A0444031D;
	Sun, 17 Oct 2021 20:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzdp9TnXQpEm; Sun, 17 Oct 2021 20:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1407A402ED;
	Sun, 17 Oct 2021 20:54:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 555CD1BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EA4D402ED
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfbAAF3d2mQL for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:54:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A96C740256
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634504063;
 bh=s8AVNlDxkPN4wL1phzKdt6h1UgSgSN8DZjQD4mOWfCs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=DhZeKWfXB/vtxWA2Y4rGQnc8LXVTULN2msJe2Yx05j33ACJyfmaEczAp388lVwxkl
 JWwq3yheg0w4Xcuu2mnV+tmvUXAju40yk4rK851cS6M2+a4xMv4Yd6fLcJbk+iAEvD
 0VpDCFelIKtsPfKAHuxOa69Pjcm7YBWcALFnVf74=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.59]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiDX-1mMbxI0Hs7-00QDKH; Sun, 17
 Oct 2021 22:54:23 +0200
Date: Sun, 17 Oct 2021 22:54:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211017225422.2e0348ce@gmx.net>
In-Reply-To: <20211017202717.GR2400@scaer>
References: <20210921202137.7092-1-ps.report@gmx.net>
 <20210921202137.7092-2-ps.report@gmx.net>
 <20211017202717.GR2400@scaer>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:StEidMpyt3ziWWggXOLr2BtNp1K88Z1s3IlomkNM6jslERF1hfU
 55q1zp3n/davYtJ0Uy2h+GLCkA28Wh2von7O8f0zwOtySTjq1u2fZSBMxOKFi79s1s0eVXo
 lPgElnb8JGPIbUaCl60MjIq9wwHuB3irVu3MGybxb6Fg7T7oh28RzYS+CMhRMXFQ5NK5KGy
 GbBZnmaTCKLkZzN2jQdjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LOTJO/OHEy8=:9gzuC83j46C+3oXQKbrrtY
 WbsPYJbVmeRrVDvstA4j4Z/pzqBzNfzwKQRJCiCX8X8sa6RHaq27XU2ggr1MA9OpA+xNpY5Wv
 diUuhftxZIFRcrMS+KGw5NqyBG0sXORMC2M18gXre53duxRbOAdQfFQBSAm1hyH8X1iLA0q7O
 iMfmpXbDD31apS+XgHmBCVORQI4PswE2x83LvgVwllNttvPIfbqnGlgRLrzrbm3Htlkdkuege
 c8pw6XFRsp1jsSgl4pwmTgK5WYKWH2TOEW4X8Bt+kieAbkL2NHJh4l2qzAcqEbbQlVWc7Gt/W
 Y7urAHgDfN0k99Eb52UEF5Rd//kPNCM4NhSTh4uqLItVH9STnHKsoeImT8OSpKDlHmuD9qRwO
 N8adFunh1hBlpGMoTDyn/sM9UD6L7UYQlN9gnOs40V6aOtbavdfjqxtNyax1vZruAsMdlTHxq
 F6WdA6WkaoggrGxEeyghCMJb0uMKjUsa8lKgJ+VuDwiIuKLovW23SaBBE/XWRgYzkzvItbZDP
 Qx2MqtwbtmdJbwfd9iH9hCr2bUU9Fc7aBHkQyF8IeHhtl7nrrM29Sqpa5Dnhdx9IPfgjsd1u0
 6lNuCFmo/WKVwXJfmXuIDbD9ykhb82Ln8AsmDloZoiStsNxhN2OImliwBnsgE8tG9+V71/Zlc
 SX5/qsgIgdRiAXSFb82YBQ4bCZeGmJ+DDLZZEpDAcHa2ckRk0dJusmfAXrS6tiLn38X2z5K4P
 3WtbuQfxwRjUswWZV0NAagSPdVkJoMt9LJ3pClpoCSH3/tulPSMy9Kh5ER8Dl6MmB9uMb8gF0
 KY71+RKvvotXmL58iSVmhF73eWi1ChUdg+J7lJEDs9VlBBKcu1ZjuuHQn8bIqy4uW4v3s+wlL
 kQP29C50ucg7WA894avquJ5StBEvdlt51uDO6HXTpPftMCjFl7irDP4qyDr+HvHeGh18VJ5KF
 sruIz6OhBmDjsFy9C44YKd3yTZprUlT+e9eODZc5b15lBkbuIKPwYhhPo76mQO2cIHyyHCfnf
 I0dvOta/W58IBJR1qDiUAnp2rNgeMDwQNbZHq0ntCYv1RLdPJ1DbSaUbYqdzFpL3qDrLkJF/J
 GIdykuWXGxuq5A=
Subject: Re: [Buildroot] [PATCH v5 2/6] board/raspberrypicm4io: enable RTC
 and USB overlays
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
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Sun, 17 Oct 2021 22:27:17 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2021-09-21 22:21 +0200, Peter Seiderer spake thusly:
> > - add RTC and USB dtoverlay entries to config_cm4io.txt
>
> Why specifically the RTC and USB? And why only on the CM, and not the
> other boards?

The config is not for the CM4 standalone, but specific to the
CM4 IO Board, equipped (as the only RPi original one) with an
RTC chip....

>
> IIRC, dwc2 is an OTG chip, too, and it is also wired on the rpi0. Well,
> by experience, I know that the rpi0 *can* do USB slave/OTG.

And as far as I know the USB is enabled with all RPi's with
exception of the CM4: 'The  USB  interface  is  disabled  to  save  power  by
default  on  the  CM4' (see [1] page 5)

According to [2]:

	Name:   dwc-otg
	Info:   Selects the dwc_otg USB controller driver which has fiq support. This
	        is the default on all except the Pi Zero which defaults to dwc2.
	Load:   dtoverlay=dwc-otg
	Params: <None>


	Name:   dwc2
	Info:   Selects the dwc2 USB controller driver
	Load:   dtoverlay=dwc2,<param>=<val>
	Params: dr_mode                 Dual role mode: "host", "peripheral" or "otg"

	        g-rx-fifo-size          Size of rx fifo size in gadget mode

	        g-np-tx-fifo-size       Size of non-periodic tx fifo size in gadget
	                                mode

Would interpret 'defaults to dwc2' on Pi Zero as enabled by default...

Regards,
Peter

[1] https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf
[2] https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README
>
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v4 -> v5:
> >   - new patch
> > ---
> >  board/raspberrypi/config_cm4io.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/board/raspberrypi/config_cm4io.txt b/board/raspberrypi/config_cm4io.txt
> > index 01f60395b3..cf7e6df1a1 100644
> > --- a/board/raspberrypi/config_cm4io.txt
> > +++ b/board/raspberrypi/config_cm4io.txt
> > @@ -24,3 +24,10 @@ gpu_mem_1024=100
> >
> >  # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
> >  dtoverlay=miniuart-bt
> > +
> > +# enable RTC
> > +dtparam=i2c_vc=on
> > +dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
> > +
> > +# enable dwc2 USB controller (USB 2.0)
> > +dtoverlay=dwc2,dr_mode=host
> > --
> > 2.33.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@lists.buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
