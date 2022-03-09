Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6479BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 19:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C86BB60F91;
	Wed,  9 Mar 2022 19:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pv0Rlo7WYwES; Wed,  9 Mar 2022 19:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C03D460B4C;
	Wed,  9 Mar 2022 19:39:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28C881BF4E7
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 19:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 254C460B4C
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 19:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkPA9yKH1Nfn for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 19:39:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EAA060B41
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646854786;
 bh=BACuiUEJhn24wpkYD8jnPX6KNiHGvYpG3qnLpwAOS0Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=a7A81fG9upDyy25tF51F8K3Vs3V5vdYiLW15P/EmJ0CVapi14tUq/UG06k5cDKjeN
 XdgDWhauuJtK1ePnhnrsBSavrOsyahRShTpd6vOrXf/BhJON+cnI6nR64AIwD9hZc6
 dsTwuE/fVGlfb9diu9dL1dhfVopgpN2mPiL4hbwY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.204]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU9Z-1o63kI38tv-00eh7j; Wed, 09
 Mar 2022 20:39:45 +0100
Date: Wed, 9 Mar 2022 20:39:44 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Sassen, Rutger" <rsassen@comecer.com>
Message-ID: <20220309203944.17591179@gmx.net>
In-Reply-To: <YQXPR01MB612157DDAB88721854BBB9B1AE0A9@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
References: <YQXPR01MB612157DDAB88721854BBB9B1AE0A9@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:YS7mqu1Qlf9jcpMMRq/S3szvqI/wh48+lK4rvzqRrWNHd0sShEm
 2TdeIhjaI7997dylZiIx8EuW6Kt5T4ID/aJabQw7e3VsknRnq4ynQ4WSiraMGv9xjOdvsRK
 0Fp0iAeHtXxVqCS4n/wijsai7AcrvzBbDl50Mu7IUyRb9yfFZoMCAfpkYFyFnaOL5pXbXlY
 6yHOSIY1OwXTipCvDzWpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2l/zGf+IjX8=:kgmcQ5m+LB29jPv9qyVlur
 pql20Tg183cGxy7MvOM66lNXbJk8HeId7U1BdqKokhacmXc5kndYoAKQGiKcuCx37lVQoNt7p
 YLlE0Ik46qzZ1Z343M0siQEaXsNcLOhEMYIoyTQbf18yizycbejpatLyaBleHQnGtMspCnq0j
 wLq4PxOlnyPM+mRVWRrO6KAdAiqm6PePnBCJB5XDDvOD+2AqnlPO8jYNe6u/IiEcghd1sYCB8
 EMIFUuTcsoePAtVF/2pe48Bcq2qRvjOYMH2rH4OzOkfKauwryQTMg9snE/2CHE61DJcBDT/3e
 QpUiMtZab2M56bxVZfmOVDTZhbo0a/aTvRP+e36ysKUjTaL+7FhyJUDMrLuT1aOggnR5YtA/V
 VmO/IWunCif49wrRHYlr56KP08KafGd47nT3OhF2oruzPHBW4ZiLXhp7iY2MbjXhfWCwvFyFr
 aqob+ONgslX13y9IebXYWzeyRjdpkg+82e4qmd+2KoCOAfaEwYp+Z2Ara+m2sTVZQvzell6qC
 LbqI6cZ73ii16O4mR0ukv28BlpjCcco7UZB0PUVMaZE35Lcb8kUPQOa+9wajFSJhX6u2ibWHV
 r4ebZRB9euWvfY+VtRgQT/7hg8W1A48Rh6YnCK+qHq9tPamYFIuG7oRU+bbUYLLDMBh4L0/31
 afwOAkroiJ5q7cOWoEfX4aWAHogLqj8H4ocIgu9IVu6pa7SjqNtVbE2Ar0KyzFRcJgzZ7AgqO
 Kgu6XaLJTBw944bkDQmIQdifG4xxrB9u/+15HNqG5CqmznYa+LyWfRW6mfnIySy1gi11X57EU
 KuIRnaSxW/9Qmsj35YdzpBpsgmTKz86gjBuwRr8W0fzcJkvFsDLjmu7xFWUNvbb3+i14Tbs0d
 EwVqucu3Jx+jK/l9gWAygTToD5WAMiKiN0qO8JaLDJz3aJlJbFVOACWHZD/5YGkjyHiNDBgyJ
 hn9Ye+sjEISXs7mSmcx5KfyscdKxAqxZcPm5DSAuYS607tbFONAobDMi0AOAi2wNVJVEfx5RX
 pzF8TXfb7QrE3i65wmSCW4a/O53Z5l6e/0YRLq8Zfx8xwZB/JrXPAiNOrz5SgqeVkIuiMMMXW
 HO4o/7QsCwsYzU=
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix missing files
 in overlays
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rutger,

On Wed, 9 Mar 2022 10:25:24 +0000, "Sassen, Rutger" <rsassen@comecer.com> wrote:

> Hi Peter,
>
> > > Not all files in boot/overlays are copied to the image, which may result
> > > in overlays not being loaded at all, or a wrong overlay being loaded.
> > >
> > > When using os_prefix and/or overlay_prefix in the raspberry pi
> > > config.txt, it checks for the existence of README in the overlays
> > > directory. If it is missing, overlays will not be loaded.
>
> > Any prove for this behavior (could not find anything about it in
> > the docs)?
>
> Yes, it is documented in the raspberry pi docs for config.txt [3], 2nd paragraph:
>

Thanks for the link, but as I read it (and I am pretty sure the given overlays
are loaded from the default location without the README file) the README file is
only needed in case os_prefix is is (overlays stored in a non default location)?

> I've also tested it myself and can confirm that e.g. when using os_prefix=custom/ , and /custom/overlays/README does not exist, that overlays will be loaded from the root /overlays instead, or when /overlays does not exist, no overlays will be loaded at all.
>

Seems to validate the above..., a README file in the default boot partition overlays directory is
not needed (the default buildroot/rpi-firmware/genimage-configs location)..., and the special
cases (os_prefix use cases) are not supported by buildroot out-of-the-box, so I would omit
the README case...

>
> > > The overlay_map.dtb file contains rules for overlays that require
> > > special handling depending on the specific type of raspberry pi
> > > hardware. When this file is missing, the wrong overlay may be loaded.
> >
> > Only if you use this feature, see [1], [2] (building multiple rpi targeting sdcard)
> > instead of determining the right overlay (exactly targeting one rpi flavour sdcard,
> > as the buildroot rpi example config files do)...
>
> That is correct. You have to be careful however when e.g. switching to a new rpi target. When no overlay map is present, you'll have to manually change config.txt to use the correct overlays for your platform instead of relying on the overlay map.

As the buildroot default configs are per raspberry pi model this is no use-case/problem...., but optional
support for multiple targeting sdcards is welcome ;-)

>
> > Would prefer to only/explicitly add the overlay_map.dtb file:
> >
> > $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo) $(@D)/boot/overlays/overlay_map.dtb, \
> >
> > or
> >
> > $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo $(@D)/boot/overlays/*.dtb), \
> >
> > or as it is a (maybe unwanted target feature) add a new buildroot rpi-firmware
> > configure option for adding the overlay_map.dtb file...
>
> I had also considered adding only the README and overlay_map.dtb. But I figured if the raspberry pi firmware adds extra files, they would probably be important. Not copying them might introduce unexpected behavior. When not copying all files, each time when bumping rpi-firmware to a new version one should check if files were added, and if they are worth copying.
>
> I could add a configure option to also copy overlay_map.dtb and README like you suggested (probably two separate options then; default on?). E.g.
>
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP

Yes (default off)..., as it is a easy/simple option to enable one implementation
of basic multi-target sd-cards (the other option would be the use of 'Model Filters'
([4]) in config.txt).

> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_README

Omit (see above)...

>
> How about instead adding a configure option for specifying a list of files to be copied instead of all files? That way you could also specify exactly which dtbo files should be copied, instead of copying all of them. Currently there are a lot of overlays copied that we don't use for our system configuration. And if in the future new files are added to the rpi-firmware overlays, we don't have to introduce yet another configure option for it. E.g.
>
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_FILES

Matter of taste (as with many options available in buildroot)...., I believe the _FILES option is
overkill/too-complex for 1.1M overlays files (and will not fix/enable all possibles use-cases,
see os_prefix above..., very special cases needs special hand-crafted solutions/scripts/genimage-configs,
etc.)...

Regards,
Peter

[4] https://www.raspberrypi.com/documentation/computers/config_txt.html#model-filters


>
> Thanks for the feedback, regards,
>
> Rutger
>
> [3] https://www.raspberrypi.com/documentation/computers/config_txt.html#os_prefix
>
> This email communication is CONFIDENTIAL. If you are not the intended recipient, you may not use, copy or disclose to anyone the message or any information contained in the message and I ask that you please notify me by return email and delete this communication immediately. Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
