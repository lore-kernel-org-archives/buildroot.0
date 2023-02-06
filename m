Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C136C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 23:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6A360D69;
	Mon,  6 Feb 2023 23:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A6A360D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpl-4wfoMeq0; Mon,  6 Feb 2023 23:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C6D60BF5;
	Mon,  6 Feb 2023 23:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7C6D60BF5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 581911BF3C5
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 23:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D2A440928
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 23:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2A440928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2UJ4XmFyqxv for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 23:57:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DD924098B
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DD924098B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 23:57:12 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id mi9so13232350pjb.4
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 15:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x5j4kkF+N9pj3lslaFonF6iioClFkyiiqikWsGr7248=;
 b=bSz96wNGbvnefXEFm4CO9myFJhyCT162ZM1Q4VTAA6l0xiYS9njY5ujRfGf92Ivh+C
 hha8Dlrez+9dJlf4vHLND6Zj275JyXQMRhub5G71SFHd6jPyoTzQlpN24m/UsQ/UlAIG
 Ucplk/cNploxJFi9sHKeg3RaFucj3PpyOWIK1s6T8+ohy4Q3SjME/BjR6nwEKfLuRh5k
 2MGvETBS3tlULmGvf/FF/Uqa8d1pthepF+j4SdOVX253Oyt17ix1tcjf+J2gtslGMejD
 pdDLulYsOWBGbOMadO97A/WevpxAQiL+9ixQauOR/PzQ7/u9IvJzmkXJ6Hv81EEoEirj
 bmfg==
X-Gm-Message-State: AO0yUKW19vuZQo/9JpyDP1mEJcXEu1aa996oRD1txI2LVsd7s9x9OAJF
 oayOjZPYgMeJrUS8gAa3j9E04pxaMpBI7Cjj95s3YHw/NMM=
X-Google-Smtp-Source: AK7set89yHCVxtkGri/h/Qzbigxs/KwzhXeh7zhJFJKWHL+BITO9xyFvSbMqACgW1VTKeaWMn1K7vYmaFcJD3bsg104=
X-Received: by 2002:a17:90a:10c8:b0:230:cd5a:756a with SMTP id
 b8-20020a17090a10c800b00230cd5a756amr314651pje.115.1675727832028; Mon, 06 Feb
 2023 15:57:12 -0800 (PST)
MIME-Version: 1.0
From: Ramon Crichlow <rcrichlow9000@gmail.com>
Date: Mon, 6 Feb 2023 17:57:00 -0600
Message-ID: <CACHw65JD8PZgGCfcwPn=45NxHBpvEpEhpsFLfatSDXFGbyS+5A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x5j4kkF+N9pj3lslaFonF6iioClFkyiiqikWsGr7248=;
 b=H6P+S6brCufArjmK/o9xvSp/X8+YgyePFkMz4lQuPNTF7u5uxD9j1s9dqzHlDV+OcB
 ZxhMyQToTVR1a5fndN9+xA+R4TT7XB5KPj9fhtTp9imreE7ZkWw0SvoB7QxHPfYK3ZKm
 Lg4FuBit94h2+4rfE4sqoRNRTNp6wjxdvq8SECb4GjYqHcffSlCQpF9ydi/9FTKqxxqL
 EN6+zcJ65wCVTVMC6jrs/WwTL8PpCmQF3O7tHzL2r4OJw0l8UNuaTX490E5LSWVKqrPv
 +CM924TDUEOdi2/gHrtJMhfyyUySDjUBGnbGHcT1QJ6omsvwjGPBsnuRjL8Lkq9ZTtrh
 LAuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H6P+S6br
Subject: [Buildroot] lsblk not getting built
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
Content-Type: multipart/mixed; boundary="===============5503511888980118263=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5503511888980118263==
Content-Type: multipart/alternative; boundary="0000000000002b1ad305f410ca2c"

--0000000000002b1ad305f410ca2c
Content-Type: text/plain; charset="UTF-8"

I modified package/util-linux/util-linux.mk and Config.in to match the
changes here :
https://patchwork.ozlabs.org/project/buildroot/patch/20160225171433.7e200dfc@free-electrons.com/
Then I ran make menuconfig and enabled BR2_PACKAGE_UTIL_LINUX_LSBLK.

No lsblk gets built or iinstalled.

 --enable-lsblk does appear in the build log so the flag is being set
correctly.

I am using the stm32mp157-dk1 configuration.

#uname -a
Linux buildroot 5.13.0 #1 SMP PREEMPT Sun Feb 5 19:20:00 CST 2023 armv7l
GNU/Linux

Regards,
Ramon

--0000000000002b1ad305f410ca2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I modified package/util-linux/<a href=3D"http://util-linux=
.mk">util-linux.mk</a> and Config.in to match the changes here : <a href=3D=
"https://patchwork.ozlabs.org/project/buildroot/patch/20160225171433.7e200d=
fc@free-electrons.com/">https://patchwork.ozlabs.org/project/buildroot/patc=
h/20160225171433.7e200dfc@free-electrons.com/</a><div>Then I ran make menuc=
onfig and enabled=C2=A0BR2_PACKAGE_UTIL_LINUX_LSBLK.</div><div><br></div><d=
iv>No lsblk gets built or iinstalled.</div><div><br></div><div>=C2=A0--enab=
le-lsblk does appear in the build log so the flag is being set correctly.<b=
r></div><div><br></div><div>I am using the stm32mp157-dk1 configuration.<br=
></div><div><br></div><div>#uname -a</div><div>Linux buildroot 5.13.0 #1 SM=
P PREEMPT Sun Feb 5 19:20:00 CST 2023 armv7l GNU/Linux<br></div><div><div><=
br></div><div>Regards,</div></div><div>Ramon</div></div>

--0000000000002b1ad305f410ca2c--

--===============5503511888980118263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5503511888980118263==--
