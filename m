Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D58C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 19:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D2E941736;
	Tue,  8 Aug 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D2E941736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAx93TGsFTsD; Tue,  8 Aug 2023 19:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3438241731;
	Tue,  8 Aug 2023 19:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3438241731
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3CE61BF341
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E2DE41731
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2DE41731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fT3rTAUnjVCf for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:37:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5882E4155F
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 19:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5882E4155F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 309CC1C0005;
 Tue,  8 Aug 2023 19:37:15 +0000 (UTC)
Date: Tue, 8 Aug 2023 21:37:14 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230808213714.1c741707@windsurf>
In-Reply-To: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
References: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691523435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qra9Q8FOjZ1Qd/bh05W4rruz1rUakTPYWcXIt6+1bG0=;
 b=Gccbot9NLC4CAIepEXSrz5+DGTL6FBW+SGrzeXk7tJvFiR56bgZbdqe7zE459noIgJZ8tB
 MOovNB0BZUsbWaOZQn29cxxv5rH/e6TdTjSbCRdPXgnbPiVcHSqsWA3EKpKx3gvpXV+dJJ
 0tDu8n1Oiv0kyRSuCRgnHhH2llQT8b8f1+W2hLB1vw1uto2LdiHU0rsMBBRaanjQ8K32Oa
 gIxABRl/IX9TY8zkzfFjmr/uXEhcnlskiL6bHq65iEJvHqM69i7zuBaQJnyB6OF2iuXD8X
 t0uK6BO0aaRRUfeOnoKOBQS9LR0Pr0bgXOoXL5GZLBvHOCInBRv1m2tSCbRcBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gccbot9N
Subject: Re: [Buildroot] [PATCH/next vRFCv2 0/3] Initial flutter packages
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Aug 2023 18:35:24 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Adam Duskett (3):
>   package/python-httplib2: add host variant
>   package/depot-tools: new package
>   package/flutter-engine: new package

FYI, I did a test build of:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FLUTTER_ENGINE=y
BR2_PACKAGE_SUNXI_MALI_UTGARD=y
# BR2_TARGET_ROOTFS_TAR is not set

and it did build successfully, in 18 minutes total.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
