Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DB1C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF6760C2E;
	Tue, 27 Dec 2022 21:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF6760C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sclbDYQdaHnL; Tue, 27 Dec 2022 21:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4544C60C24;
	Tue, 27 Dec 2022 21:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4544C60C24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 815AC1BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65C0C60C24
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C0C60C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S1mNStIEG363 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:43:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD7D60773
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BD7D60773
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:43:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AC29240003;
 Tue, 27 Dec 2022 21:43:55 +0000 (UTC)
Date: Tue, 27 Dec 2022 22:43:54 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221227224354.3b1d1fdf@windsurf>
In-Reply-To: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
References: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672177436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBL14BySS18MXUpxf2DyaKd020Bj5CUJ+1Bue8nTyT0=;
 b=A1sqqv+bouI7I7ch5JrOVu5tpI1F6iSSEw60H0X+8P9JxiygLt/oNEjtubqt2cEzG8s68a
 m7k6Um/iuSuTP0erRxfi/0jaZubG00myzqlnat+QIih5u9kfcbscAOKVpyjghjwCUPaXwc
 3ShkqUoLyee6DP7FUbOqPlsd2tCRNu7REtAPZwnf3c17+wKkTkPvm9m0vpoLVZSuBQjal9
 RbAf15m3Q+A1yuRVar4uE+EsI6b9GfSfAHzYEisAPw1dr4VKxpSaH9MWofpqfRSQEgiKd2
 ZvekRzbRCh/utGQEmKcWcrXroToOMfcz1zKpurHG2WhRkwTiwgOGXxSY5/jCjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A1sqqv+b
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 26 Dec 2022 19:03:53 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Do we know why these firmware files are not part of the linux-firmware
project? They are needed in conjunction with which kernel drivers?

> +DVB_FIRMWARE_VERSION = 1.4.2
> +DVB_FIRMWARE_SITE = $(call github,LibreELEC,dvb-firmware,$(DVB_FIRMWARE_VERSION))
> +DVB_FIRMWARE_LICENSE = PROPRIETARY
> +DVB_FIRMWARE_REDISTRIBUTE = NO

This DVB_FIRMWARE_REDISTRIBUTE = NO is not good, as it would actually
encourage people to violate the license of those firmware files. Indeed
what DVB_FIRMWARE_REDISTRIBUTE = NO says is "to not mention this
package in the manifest" and "do not copy the license files". However,
several license files in dvb-firmware explicitly *require* that the
license file should be distributed.

Quoting from LICENCE.go7007:

=====
The firmware files included in the firmware/ directory may be freely
redistributed only in conjunction with this document; but modification,
tampering and reverse engineering are prohibited.
=====

Quoting from LICENCE.xc5000

=====
// Permission to use, copy, modify, and/or distribute this software, only
// for use with Xceive ICs, for any purpose with or without fee is hereby
// granted, provided that the above copyright notice and this permission
// notice appear in all source code copies.
=====

Quoting from LICENCE.siano

=====
* Redistributions must reproduce the above copyright notice and the
following disclaimer in the documentation and/or other materials
provided with the distribution.
=====

If we want to create a package for this properly, we need to have a
mapping between the firmware files and the specific license file that
applies to them, so that we know which conditions apply to which
firmware file. As it is done today in this Github repo, it looks like
some firmware files are random binaries from the Internet, with no
clear licensing... which makes their redistribution not legal.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
