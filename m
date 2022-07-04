Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 11:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F75826E7;
	Mon,  4 Jul 2022 11:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F75826E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjrDgdVoIiHC; Mon,  4 Jul 2022 11:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F23CB827FA;
	Mon,  4 Jul 2022 11:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F23CB827FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E886D1BF375
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 11:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C31C1827FA
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 11:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C31C1827FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iG7eelIqH_Zh for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 11:06:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B984826FF
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B984826FF
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 11:06:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u14so10657842ljh.2
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 04:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hHevrMoxIKJ+3XW/+GZJ82lmicMMgeCIWWBt+eHAmo=;
 b=Qap5H0ri1xj8IxRykTgPBz6PzSavtp996UN/ePhjA33r/EdXR5sUw7o1XPBB+oDmju
 n4l5ub0sEdElzUMqAzMuyjKibUvJry0SRyXd17DkxwRZE1q1GbXhsuJmpF8Tn7t7j3gz
 qQc2fDdZWZxC2b7wQJ2fzQ+LIZG3BlKgWhv/CggkmnwE3Ndzb2R7977OKOI6czXvqosP
 HYL2aNkAPuhMZ0thlDNwEA5etrriECdoAjhpD+eguuUfTsjdYBpdqHnPtYmk11SyTtwO
 68ZOt3Us8zvojLELnB/3YzU5Z+Tnss9JtnYCkNmvzcK8YFhnEa5bLNE8y6tFAj3tUI4+
 jMxA==
X-Gm-Message-State: AJIora/l106AlFEXNFHg9k1tB2y7dLcY9POjIBUf+xTu9OJYMHZWA7w+
 rA02G/rWVIeawQCv4yHYYmKwIFH9/o3BmTkfrII=
X-Google-Smtp-Source: AGRyM1sJUxfZMzRxXF8Toad+iIjv0265ex3iQPUZpLlAN/v2O0vtDsthZ7VEUpOXYXh5JYejcOTx+9g1D7nyelbxIh8=
X-Received: by 2002:a2e:a483:0:b0:25b:c3c6:8559 with SMTP id
 h3-20020a2ea483000000b0025bc3c68559mr16601531lji.273.1656932760073; Mon, 04
 Jul 2022 04:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220109110736.3963-1-nolange79@gmail.com>
 <20220704064121.GA2889@tl-lnx-nyma7486>
 <5037_1656917160_62C28CA8_5037_313_1_20220704064557.GB2889@tl-lnx-nyma7486>
In-Reply-To: <5037_1656917160_62C28CA8_5037_313_1_20220704064557.GB2889@tl-lnx-nyma7486>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 4 Jul 2022 13:05:48 +0200
Message-ID: <CADYdroPEbds5DXt=Ez9y33nuV4KnBYkg4pOiVBUSTQuhLNS=fg@mail.gmail.com>
To: yann.morin@orange.com
Content-Type: multipart/mixed; boundary="00000000000094cec405e2f8b8c9"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3hHevrMoxIKJ+3XW/+GZJ82lmicMMgeCIWWBt+eHAmo=;
 b=YO855+u6t5NUVWod2Y3icDwozMvk7b5e0D7ljRWYYX8yQK6LUAT1ZyRZ/N8QzIHmpz
 7oDR0eatfn1cDmstrgfyKmT8FP6ILXglEPMApL/5I4ifT6RftWgxW56BIXrttNSImYKs
 BaCdRg97biWvzi51P/tihLE7BK7Em84S0ARTIczoLm+o3CbsexxIKhn/RusycbCgHck9
 fav+eIZs9XSzqYYljLEWtioRDq6bc/1UARP3zc7k4FvvnyD74uzGybMIQGkihgGTCRmQ
 YV+aI4lmMKRIkS/IGhgZOGD05YP47H639959e9Tmyw7njiD4Rmy6QbUx8asnhY02MSWo
 g9tQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YO855+u6
Subject: Re: [Buildroot] [PATCH v3] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--00000000000094cec405e2f8b8c9
Content-Type: text/plain; charset="UTF-8"

Am Mo., 4. Juli 2022 um 08:46 Uhr schrieb <yann.morin@orange.com>:
>
> Norbert,All,
>
> On 2022-07-04 08:41 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > On 2022-01-09 12:07 +0100, Norbert Lange spake thusly:
> > > Especially for read-only filesystems it is helpfull to
> > > pre-create all folders for non-volatile paths.
> > I'm revisiting this old change of yours, and I have some issues
> > understanding the original issue this is supposed to fix...

Often if a directory is readonly, the service will still start (and
have limited functionality),
but if its missing it wont be even attempted or fails early, taking
down more services that depend on it.

> >
> > Indeed, for read-only filesystems, we do generate a factory for /var.
> > This code is guarded by a condition on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW,
> > so indeed, if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set, we do not
> > create the factory. But if it is set, then we do create the factory:
>
> *if it is _unset_, then we do create the factory.

Yeah, and this is an insanely fragile method, which I brought up
multiple times (see [1]),
and prevents other solutions that work above or below your initsystem.

Some versions I personally cooked up:

-   precreate the directories, or add some symlinks to /tmp.
    (I got a debian USB Setup/Rescue stick with Gnome running that way)
-   deal with the issue in the initramfs (mount tmpf/ overlayfs)
-   add a systemd unit + mount creating the overlayfs.

Any of these are just as viable and more robust than that weird
tmpfiles solution,
why is that one forced down to be the only one?

Look for example on the BR2_PACKAGE_SYSTEMD_CATALOGDB config
which depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW to
avoid a huge mess.

>
> >   - move /var away to /usr/share/factory/var
> >   - register its content as a tmpfiles.d:
> >     https://github.com/buildroot/buildroot/blob/master/package/skeleton-init-systemd/skeleton-init-systemd.mk#L37
>
> Note: this tmpfiles.d is currently stored in /etc/tmpfiles.d, but it
> really belong to /usr/lib/tmpfiles.d (to later allow for an empty /etc
> too).

The whole feature belongs behind its own option, or even better: own package.

I attached an archive implementing the systemd unit + mount. Some
equivalent would be possible
for other init systems. You wont need ANY complicated trickery that way,
just unpack that into /usr/lib/systemd/system

Regards, Norbert

[1] - http://lists.busybox.net/pipermail/buildroot/2020-July/287016.html

--00000000000094cec405e2f8b8c9
Content-Type: application/x-xz; name="rootvar.tar.xz"
Content-Disposition: attachment; filename="rootvar.tar.xz"
Content-Transfer-Encoding: base64
Content-ID: <f_l56muhpa0>
X-Attachment-Id: f_l56muhpa0

/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4BP/AmhdADkb7Oh5yd37E8i3geAQk+FUKvM0l0vX/itf
SQ4T2FE7SukfW+B+MQIAPZHxI+DSt6o751jgb9CxNlBFrGtMXI8j9RV9VUFyKf3DiiGjabkUqelN
6jeftRTQ+5KSwseqckmGzENLekODtnzP23keQy1QW6dyRpxVPbnCfxYX8PKeoq5qkCmlnFq6Yzsl
QyaGUSH4RU3teB6YbSGFJAjVYIJgBLf6R24rO91IPKJIXl/Git8DFHgqwI6jH9zvh1I7jO/q/np7
LkGZZZBLMTLh+MF9Xk8ATV0bjLfrckL6n7nAbG50ci497SVf/iaL/C+oi4D8vmL5vZsGjiUfkSOj
OxBywZCi6kxGIf84C37z3A2V39dJfhN4uODPCeo/0UWzBswSA4xCQO7zgpNt+whDJ6zNCONCBfsI
A5kRRN5iVqeUcfLo/9NH515Jo8skjcvixU+crDwQBw2yZx1LlktY85pMMdAdSU4CGcVGxOpikRaI
R59m65tlFni5GIhVvP21NX9YqJbmwcTUB33Jk1T6kUaZl2W9jVF56+6CuK7b+J0iDk9xJC4M/+0k
pFsGOoRLTOtf4ql3qRf3QvWXNuSceu6/XaZaDG/rfHK2c4uQXnAx5h492Itylt7GtoSC+ZRRi08G
zQiywaOfpsXl8Ma57Ena+OaWQRUeXCRQ2SXoWxSVCHfrRs4+/mM1rJdlyfOqaaUNjWg2y+ZVEf2M
x8Zq0U/mdhNG8CgXHL2UL2eTCudDAJhYdDa5iZyOhrEUYWP+AfNpTlDrvyVEyYfjpa2Ct0kDTp2I
ZhU2oB48tPuhkRBBCCuOg7p7YAAAhdOcIUqUEfwAAYQFgCgAAACsk1WxxGf7AgAAAAAEWVo=
--00000000000094cec405e2f8b8c9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--00000000000094cec405e2f8b8c9--
