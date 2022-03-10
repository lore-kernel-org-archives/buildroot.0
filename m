Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED95C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 18:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B62961212;
	Thu, 10 Mar 2022 18:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owelumii2vWi; Thu, 10 Mar 2022 18:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882A960B6B;
	Thu, 10 Mar 2022 18:03:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0C0F1BF408
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 18:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCA43409A0
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 18:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=email.cz
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfjY9lVOaGQS for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 18:03:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CBD740997
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 18:03:40 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc11a.ng.seznam.cz (email-smtpc11a.ng.seznam.cz [10.23.11.75])
 id 3d392022bdde4abf3f4d1e4c; Thu, 10 Mar 2022 19:03:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1646935418; bh=/9SFpEnCvUbSQ9A3+ztGNFcgB6XNyM3GY68fX2gt7NE=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To:X-szn-frgn:X-szn-frgc;
 b=mb5PMWB8RADABY5TkCcE/JThU3DdRxGw1DoheL11n5OABGMMYUVduwpwEN8DZX27K
 eCdsZTdcG1QM659VTP/8ndjrThz9TU91njsJvefeL81SmlUOenVWhV//8CPpY6QDgQ
 O4PygMFyH79Djcm/XsaL3hFl1TFBOn0cOtyMeVz8=
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay27.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
 Thu, 10 Mar 2022 19:03:37 +0100 (CET)  
Date: Thu, 10 Mar 2022 19:03:32 +0100
From: Jan Havran <havran.jan@email.cz>
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <Yio9dHRYViMb7+iG@arch-zen.localdomain>
References: <CADYjeSsCzsQbWw25kghn49m6vZ9XBMi5NQfBHhTh5X6E3z=JFg@mail.gmail.com>
 <CADYjeStJRry=ed46Km6nsaFk+wtbaxs0bLDfiPmtJ7xwZs2UwA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYjeStJRry=ed46Km6nsaFk+wtbaxs0bLDfiPmtJ7xwZs2UwA@mail.gmail.com>
X-szn-frgn: <5ab5bb75-1ac6-4eb5-bcca-043738416cb5>
X-szn-frgc: <0>
Subject: Re: [Buildroot] How to connect to Wifi on start-up using Buildroot?
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sourabh,

after enabling RPi firmware you must load the Wifi driver - since you are u=
sing
systemd, it should by handled by udev on start I think.

So you probably just need to configure /etc/network/interfaces to start wpa=
_supplicant
on wlan0 with /etc/wpa_supplicant.conf file, where you can put your credent=
ials.
Or at least that is what I have done, but I am not using systemd.

I did something similar some time ago, you can check it here:
https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e322deacd09ec9=
346d47e26

(note that to make "my" credentials public in that commit was an intention).

P.S.: if you want to have any modifications to be part of your image with f=
ilesystem,
you can do it by using rootfs overlays for example:
https://buildroot.org/downloads/manual/manual.html#rootfs-custom

Regards,

Jan Havran

V=A0Thu, Mar 10, 2022 at 05:43:27PM +0100,=A0Sourabh Hegde napsal(a):
> Hello All,
> =

> I am trying to connect my Raspberry Pi CM4 to Wifi automatically after
> start-up. I am using Buildroot based Linux distribution. I have worked wi=
th
> Yocto before and it provides systemd-networkd and wpa_supplicant feature =
to
> connect to wifi on boot. I am lloking something similar in Buildroot but
> couldn't find any notes online.
> =

> So far, I think I have enabled the necessary config/driver using "make
> menuconfig" :
> [image: wpa_supplicant.png]
> [image: firmware.png]
> =

> But now, how can I set-up wpa_supplicant.conf? Any link to notes or
> suggestion would be helpful.
> =

> Can anyone please let me know how to proceed further with it?
> =

> Your help will be much appreciated.
> =

> Thanks in advance.
> =

> P.S: I am using Buildroot 2022.02 release and also using systemd feature
> and let me know if any info is missing here.
> =

> Regards,
> =

> Sourabh




> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
