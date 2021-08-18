Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABBFC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:11:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C88460720
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C88460720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F207080E32;
	Wed, 18 Aug 2021 21:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssf8KGjqlb_t; Wed, 18 Aug 2021 21:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348F680E79;
	Wed, 18 Aug 2021 21:11:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8F81BF2C7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19DF181947
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmLIfTh4NRhk for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:11:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CCED80E79
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 21:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629321072;
 bh=Ojl5KualQe84sAEYuCHmUpffda7f1N7+9T/VShwoDyI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KXvDYzZhEa0j21OZDXh9JbSJx6mqr4voSX6hj9BTHJ4qxE3eBXU3wt/YHSt4MqI+S
 OwJAP6i8lWfJukDhPqWavKVwrZYvhhkybOMJUy76GY5afk2m7f5N2hAqW/KWALfFxM
 uyqRS0qkFGttK9RDbakVwfggrNnofRlVk02K1x78=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.105]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1mzcLD3HB6-00yhn7; Wed, 18
 Aug 2021 23:11:11 +0200
Date: Wed, 18 Aug 2021 23:11:10 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Scott Bartolett <SBartolett@thorlabs.com>
Message-ID: <20210818231110.390d9064@gmx.net>
In-Reply-To: <SJ0PR08MB6542F033192E0D422DEE4FDDB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210817201014.235cf403@gmx.net>
 <SJ0PR08MB6542F7DD403856DB9A0CDA0CB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210818181126.38fe82d9@gmx.net>
 <SJ0PR08MB6542F033192E0D422DEE4FDDB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:H4CLVmUa0+cB/09kAq37F7vvf0gueoBfESFVg4dGebTjoGq8Jos
 pEnH6fkgsPRIUjwhqV0Rc66vQy0pj5poxw8wJC1ySRDDKg/gY9ufPSBK8uYvzmMZus29Frj
 LQqFHTxJZiuG30k6wQoJXr1o2GHVgVcKx0kOHn5XqveCcbXjG1EdZ4dkXetrHbJNl6DjlIy
 PQ8Y7DWJ6yhXgUDrD2v+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LhT10vjeYk8=:lZqPr/kSMW8P4w3Qxn/ZzU
 0VVZdVUepID3Mc5iUNrQUrgFJfDa/3PbyRbEkqZPteKHLuFsNHD+1uccqgI80Wtkax6PLtNd6
 kzSW/fpZkvLFK7TWX7nKgjBtRulADie5phIZVYlmPqLXfCzkPk7lpmAX7cZATHiUFizOMSBqL
 DkjUTDwJ3C6jUa5wP6/m0QzM5Y+QB2FSQu4vdRHeS8sG3Uh6bdABulrB9ZhZAG2NFhk5+QyJI
 A0fd5w9RFSgwy+02vUmnpegqCcTqeUmPp8no2vvIJqPLutIty7UBfcz/KnRxQP9wIs0Ne4QXD
 seOwrAE7/Cq1eh6wavnHOwsy07A23MGjON1nzKHPSN/xCN/7UVSUiv13Jprv7+2gsWcl9SOuw
 PpertD+VQ13ZIDdbALcQchtAKefmpKygf0K2APCQ0pX8XWgb8X7qcEE45Y8+MmawYkf4ZEHe8
 DWVdGZbszqwvXko7kkKjCjQEUSYJ74NELrkMcGOJBrhIcLvIbmK/I8DjOQ+Xdyl241UJMFang
 Nys1nRVijWslcSBrpilytxW3r81QRjBFtFXaUAzam2yqldg04siIeagQfpCyVd6XUos23NVpW
 pDf7aCLndFF8ZBWX92t3eB00l1BhPh25lPRowzcz9RsiPeAuq19PM/kSfuE1mhGnxa1ydaYCB
 /WOrpbv030ZLUUf5pvX/7rWwq1hbVSfUuriRj5p9UBtu5fh/1jaUkTjPVP4u2qcCVCqW9EY5X
 6dHgwQnOecV1H9vvSlaTkigmw9Mg7lFpPWVrr9G54wrn9o4EXhtRQ7tGFSKfhpkrzVFK+sNHH
 gWHUbcnwlHXQjWPoplkq8WIKLrtt84DXK7YWVeuxNt8/Uu7qJzPDeYU582qa65zlHSw8157Qs
 9QnZsga0D2cTz8+gYA3w1QMcwFEVyGLd1b7G/3/RAOiUkF7ocZgP2GClCkBa0R4tdZQm4NdQM
 3KdxXUJHATaN+fyhGoeKgFm+vbR6SmbYuqRh+xnP3xO8QKzfLVlnVy4Yr54nX2dRgELih/3HG
 VpO5Fjr8cQ1cHDAPRiNK4bRAZGH9Hn68E6SdlIU6UElBkHVjSC8QbTbnQ0bzkBQr7pD3M4uSG
 AntO+cb00z4gysmSQ/izTv6acE+i38dqp3jE0J5gTL5vy5mrK8IJZVxaw==
Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Scott,

On Wed, 18 Aug 2021 20:28:12 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Yes I have the BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS enabled and rpi-firmware/overlays entry in genimage.  If I search the buildroot output folder I find this:
>
> ./output/images/rpi-firmware/overlays/vc4-kms-v3d.dtbo
> ./output/images/rpi-firmware/overlays/vc4-kms-v3d-pi4.dtbo
> ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/boot/overlays/vc4-kms-v3d.dtbo
> ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/boot/overlays/vc4-kms-v3d-pi4.dtbo
>
> But I do not find those files anywhere on the target machine.  I am using a root file system overlay.  Might that be my problem?

The overlays are stored in the first/boot partition (vfat one where the dtb files,
config.txt and cmdline.txt, bootcode.bin and start.elf and fixup.dat and zimage
are found) and not on the second/root (ext4 one with the complte root file system)
partition of the SD card...

Regards,
Peter

>
> I appreciate your help with this.
>
> Scott
>
>
> -----Original Message-----
> From: Peter Seiderer [mailto:ps.report@gmx.net]
> Sent: Wednesday, August 18, 2021 12:11 PM
> To: Scott Bartolett <SBartolett@thorlabs.com>
> Cc: buildroot@busybox.net
> Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
>
> Hello Scott,
>
> On Wed, 18 Aug 2021 13:08:28 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:
>
> > Hi Peter,
> >
> > On a raspbian install I find the file vc4-kms-v3d.dtbo.  However on the buildroot install, I do not find any files that match vc4-kms-v3d*.   I've searched for and enabled additional items in the buildroot config that might be related, but nothing has helped yet.
>
> The buildroot config option is name BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS,
> do not forget to do a full re-build of the rpi-firmware package after enabling...
>
> For inclusion of the overlay files to the target/SD-card boot/first partition check/add the 'rpi-firmware/overlays' entry in the genimage file (see e.g.
> board/raspberrypi3/genimage-raspberrypi3.cfg for an example)...
>
> Regards,
> Peter
>
> >
> > Thanks,
> > Scott
> >
> >
> > -----Original Message-----
> > From: Peter Seiderer [mailto:ps.report@gmx.net]
> > Sent: Tuesday, August 17, 2021 2:10 PM
> > To: Scott Bartolett <SBartolett@thorlabs.com>
> > Cc: buildroot@busybox.net
> > Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
> >
> > Hello Scott,
> >
> > On Tue, 17 Aug 2021 17:47:49 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:
> >
> > > Hi all,
> > >
> > > I'm trying to run a Qt5 application on a Raspberry Pi running buildroot.  The application runs fine when I use the platform plugin linuxfb.  But when I try to use eglfs I'm getting the error that the DRM Device is not found.  I see this error message mentioned often when doing a search, but so far have not found any solution that works for me.  I've selected:
> > > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> > > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> > > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> > > BR2_PACKAGE_MESA3D_OPENGL_ES
> > > BR2_PACKAGE_QT5BASE_OPENGL_ES2
> > > BR2_PACKAGE_QT5BASE_EGLFS
> > >
> > > Does anyone have any suggestions?
> >
> > Edit the config.txt file on the first/boot partition on the SD card and add (for RPi4):
> >
> > 	dtoverlay=vc4-kms-v3d-pi4
> >
> > or (for Rpi3,...):
> >
> > 	dtoverlay=vc4-kms-v3d
> >
> > See [1] for details...
> >
> > Regards,
> > Peter
> >
> > [1]
> > https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
> > ub.com%2Fraspberrypi%2Ffirmware%2Fblob%2Fmaster%2Fboot%2Foverlays%2FRE
> > ADME&amp;data=04%7C01%7CSBartolett%40thorlabs.com%7C2be70acef94f4fd7a6
> > 6e08d96262d8bf%7C411510044224448aa787d4279c1f087d%7C0%7C0%7C6376489989
> > 66807962%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TRayRYYU6JoOopJfA9zspOI
> > n%2FGObRgfP2zYF2bS%2BCEA%3D&amp;reserved=0
> >
> > >
> > > Thanks,
> > > Scott
> > >
> >
>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
