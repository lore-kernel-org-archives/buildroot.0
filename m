Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B62C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF4540293;
	Mon,  5 Feb 2024 10:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF4540293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdv5iBSJ9uYM; Mon,  5 Feb 2024 10:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F8A401F6;
	Mon,  5 Feb 2024 10:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F8A401F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0F501BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F164820D9
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F164820D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rx7aE-to-3n7 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:38:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 658DC81F92
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658DC81F92
Received: by mail.gandi.net (Postfix) with ESMTPSA id 088891BF204;
 Mon,  5 Feb 2024 10:38:22 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:38:22 +0100
To: Ludwig Kormann <ludwig.kormann@ict42.de>
Message-ID: <20240205113822.3e017b35@windsurf>
In-Reply-To: <20240130131750.3802767-1-ludwig.kormann@ict42.de>
References: <20240130131750.3802767-1-ludwig.kormann@ict42.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707129503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXrX5acuvKhXQmAbmz23WO5Ddn5Wq24zd94XM6StgSk=;
 b=ef+d10UaubPcmZCb82btofMjWSi3mFwZiq+CBU9m10dZ4Ba6O0U/dFcfAxysZ1iUvInTye
 o60oi3u4ygzTZlrWGaU2OGytM5aKLOHG75DvRRd79iCRMOZ7DYiCvt0DmMb9NVFyBfoQ1d
 Kmn0uxRIE2DxXURxIzMHNgNhL8T1XQNNNIS1CZXHze7s8C0r5jPA+HbnDkOS4Mrnhvxg7Z
 k0P9NlCJ+W+bYGYGp38a/Kekvqe0JNxj/C1YOYAl9MqE0YSwXUob0bDAWxSKrgyu0ztFRF
 PAiI1qtGzqz51MvvcKIVW4nPH2+00BqEAMb7FbPZzgwr8SRREokmNdI0uONStg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ef+d10Ua
Subject: Re: [Buildroot] [PATCH 1/1] configs/icnova-a20-adb4006: Bump Linux
 and U-Boot version
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 30 Jan 2024 14:17:50 +0100
Ludwig Kormann <ludwig.kormann@ict42.de> wrote:

> Bump version of Linux to 6.6.14 and U-Boot to 2024.01
> and also use upstream configs and dts.
> 
> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
> ---
>  .../sun7i-a20-icnova-a20-adb4006.dts          | 137 ------------------
>  ...n7i-a20-icnova-a20-adb4006_uboot_defconfig |  20 ---
>  .../sun7i-a20-icnova-a20.dtsi                 |  62 --------
>  configs/icnova-a20-adb4006_defconfig          |  14 +-
>  4 files changed, 6 insertions(+), 227 deletions(-)
>  delete mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
>  delete mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
>  delete mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi

Applied to master, thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
