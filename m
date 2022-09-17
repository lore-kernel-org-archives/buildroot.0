Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B7DC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C616A60BFB;
	Sat, 17 Sep 2022 20:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C616A60BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOUUGF7qzCB7; Sat, 17 Sep 2022 20:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA3460AF6;
	Sat, 17 Sep 2022 20:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFA3460AF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6C91BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AA4B60AF6
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AA4B60AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Li2_RD0i9T12 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:15:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 021C960A80
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 021C960A80
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:15:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3321A1C0005;
 Sat, 17 Sep 2022 20:15:04 +0000 (UTC)
Date: Sat, 17 Sep 2022 22:15:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220917221502.3673b1c3@windsurf>
In-Reply-To: <20220824192604.2549356-12-chris.dimich@boundarydevices.com>
References: <20220824192604.2549356-1-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-12-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663445705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWGoE3cb5ecq1k1+xYnyAMvHmfWWlNiJ+5lCwl1fT6c=;
 b=j8F1XU6YfcKXdpGzQC+Ep+a1cbdDHN4BCQr3LabXgDb4ERVfDxmXrIhxJallZJREujMOVV
 ELUmX9EePonQolWtdpAwSLMwCL82I9tP0+YWgt0YduSTOnvd5scxsKnaQBfEvChuRkF6HB
 sj/aUg7mlQ9e+533SIwZHYstXLnqnrPKtTCpXLuLl2SIakONp7p3tzsyl8WET0PlQOwiFw
 ZxR24SR3miXyolZnglxbkax5oUwLm2pXSe3AjGvTIaJ5JBYkQdvNxZU+YflZLVryCd9Evz
 Kdb7gvdVs46TihNWMNR0336pHxYhNiMkBybVGDnJtT+gDoV1n24WBw0pMhqNRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j8F1XU6Y
Subject: Re: [Buildroot] [PATCH 5/7] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.3.p4.2
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
Cc: Gary Bisson <bisson.gary@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Aug 2022 12:26:02 -0700
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> -sha256  39fe307916e19a0892a514621121086e276a43858af90230372a1344852116a2  imx-gpu-g2d-6.4.3.p2.0-arm.bin
> -sha256  2642a49e088daae4cf568a150d01e7c095995e8a6ff1883c02c3fa6d26d254b3  imx-gpu-g2d-6.4.3.p2.0-aarch64.bin
> -sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> -sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
> +sha256  0ba9806c4efa0154fc9f7be406e42bc2c50b975abd32cbe322cf7bcf6ae0d350  imx-gpu-g2d-6.4.3.p4.2-arm.bin
> +sha256  ff50ddfee2d989798a2aba84ef9114e01f8d867293891dc0aacfab1640cbf8a3  imx-gpu-g2d-6.4.3.p4.2-aarch64.bin
> +sha256  4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517  COPYING
> +sha256  4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517  EULA

This hash seems wrong. You have the same hash for the COPYING file and
the EULA file, and the EULA file hash is incorrect:

>>> imx-gpu-g2d 6.4.3.p4.2-aarch64 Patching
>>> imx-gpu-g2d 6.4.3.p4.2-aarch64 Collecting legal info
ERROR: EULA has wrong sha256 hash:
ERROR: expected: 4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517
ERROR: got     : 423c76762d50b82fedd3e15c48e436d7272a7e130f9ebb910f76489345707cf6
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you check this on your side, and send an updated version?

When you send an updated version, please always resend the full series,
and increment the version number (using the -v option of git
format-patch).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
