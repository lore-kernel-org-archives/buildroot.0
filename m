Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9227C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 10:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5227D605B1;
	Wed, 28 Dec 2022 10:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5227D605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tapxS4KB98dx; Wed, 28 Dec 2022 10:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66333605A4;
	Wed, 28 Dec 2022 10:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66333605A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9D641BF3FB
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 10:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C69140256
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 10:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C69140256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SHHqr6uBm03 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 10:00:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E72DC40004
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E72DC40004
 for <buildroot@uclibc.org>; Wed, 28 Dec 2022 10:00:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2CEB10000C;
 Wed, 28 Dec 2022 10:00:18 +0000 (UTC)
Date: Wed, 28 Dec 2022 11:00:17 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221228110017.1d376f11@windsurf>
In-Reply-To: <pan$60b46$ce6281f3$ccde7c98$d5e8f550@ID-313208.user.individual.net>
References: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
 <20221227224354.3b1d1fdf__40547.9438648158$1672177457$gmane$org@windsurf>
 <pan$60b46$ce6281f3$ccde7c98$d5e8f550@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672221620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+Wjtvt2UrsYBfBQKAigLTl/xYzQURAvxhbeLTfFg9k=;
 b=kTlPUFb/9I6K7L4KD54ALao/yDs3nx8L65E7nQcDhKXFhdTzRmPahSNMT9TIaiADrEqims
 t1HWyKUvbor3ahFNe6uQU0N2pixyfvxQ/8I0ZcnB+qDlENuMiVWM3mqAk2hEgy9YcQ5yE4
 9jwrc4KHevqhtkfLShCaKbjOmXSZIqU/K6t/Pt6zdjCVqqD6/emjPLKOq4+oqMU4sg05gs
 euhRf1gWOak+Ch+nYCP9ZikfFY/50/0kG6EM3IF5VzH7ThH/AzXSTanXuA81wv7s8WxKTK
 n+xopdaV5sMNZmOKv4MG/+8MhKJ5hpNApR6FnTrwGOOQoaZFNPoRlXZ4C/fEcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kTlPUFb/
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-firmware: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@uclibc.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue, 27 Dec 2022 23:30:45 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> > Do we know why these firmware files are not part of the linux-firmware
> > project? They are needed in conjunction with which kernel drivers?  
> 
> The history of this repo is unknown to me, it is used by the LibreELEC 
> project in their images. Personally I need only these firmware files:
> 
> BR2_PACKAGE_DVB_FIRMWARE_FILES="dvb-demod-m88rs6000.fw dvb-demod-si2168-
> d60-01.fw v4l-cx23885-avcore-01.fw"
> 
> for the cx23885/m88ds3103/si2168 kernel modules needed by this card:
> 
> 05:00.0 Multimedia video controller: Conexant Systems, Inc. CX23887/8 
> PCIe Broadcast Audio and Video Decoder with 3D Comb (rev 04)
> 
> (aka Hauppauge WinTV-HVR-5525HD)
> 
> These firmware files are not present in the linux-firmware package.
> 
> To pick up Yann's proposal: How about adding a device-specific Config.in 
> option for these firmware files like
> 
> config BR2_PACKAGE_DVB_FIRMWARE_WINTV_5525HD
>     bool "firmware for Hauppauge WinTV-HVR-5525HD"

This would certainly be OK, *but* you would need to first clarify under
what license these particular firmware files are released.

Even though I'm not sure it's totally useful, I've noticed that the
kernel ships with a scripts/get_dvb_firmware script that allows to
download some DVB firmware from various locations. One of the locations
is https://linuxtv.org/downloads/firmware/. But it hasn't been updated
since 2014, and seems to have less firmware that the LibrELEC repo.

For me, the LibrELEC repo is fine, as long as there is licensing
information for the different firmware files.

Or we need to invent a special license mechanism in Buildroot that
clarifies that the build results cannot be redistributed (which would
of course be confusing with _REDISTRIBUTE = YES/NO, which means a
different thing).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
