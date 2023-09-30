Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F76E748E7
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 20:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5271E61021;
	Sat, 30 Sep 2023 20:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5271E61021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKIQcEoPdkCQ; Sat, 30 Sep 2023 20:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF02B6100C;
	Sat, 30 Sep 2023 20:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF02B6100C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2AEE1BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88BAF82690
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88BAF82690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eH_kr22CJo3r for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 20:36:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 398B382416
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 398B382416
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D1EEE0003;
 Sat, 30 Sep 2023 20:36:23 +0000 (UTC)
Date: Sat, 30 Sep 2023 22:36:22 +0200
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20230930223622.06e32f3c@windsurf>
In-Reply-To: <20220819151734.926106-6-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
 <20220819151734.926106-6-Ben.Wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696106184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFWx143jBPg6JObQqtlLtPxVpqknBPL13vQ2OG8OxHo=;
 b=Oq0ogIaWMDbK8GdHHwERx2x/KioXmLMP5Z6DlZF0LHxI9tVR5mvXV85lRMKX6knFLkkUSx
 D5GeBh1bR7NPAmIrN1TMxqKI2VM8CDzPotayUX7hXC+kDg/szPsk441L8C21utFDAef+WP
 O0kkRYeunSJO4kWM5lTWZDy53HUl4+i4WYdBonU2Qut3Kx6wLCaPw/B/7k3zWyv4yRqa05
 y1muQ5DvsLFV2od/wXa84lfLILd/HQmRboI1KGD8Ss9o6N2K94jvEjkfi4+jVVqfgoyu/2
 ZGJXHOewMvEpdh/OSUUIG5uvSQm75VK0ViqVBx/m3P2L4bzEIRllIA6oF0sHSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oq0ogIaW
Subject: Re: [Buildroot] [PATCH v3 5/8] boot/uboot: pass -mno-fdpic if FDPIC
 is enabled
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Aug 2022 11:17:30 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> +# Disable FDPIC if enabled by default in toolchain
> +ifeq ($(BR2_BINFMT_FDPIC),y)
> +UBOOT_MAKE_OPTS += KCFLAGS=-mno-fdpic
> +endif

This this one and the same change in the linux/ package, I'm not a
super super fan, even if I admit I'm not sure I have a better solution
to offer. I tend to not like very much this kind of super arch-specific
CFLAGS customization sprinkled in different places.

My initial thought when looking at this was "could it be done directly
by the toolchain-wrapper"? Indeed, we already have some logic to detect
if the code being built is from the kernel (__KERNEL__ is defined) or
U-Boot (__UBOOT__ is defined).

Another concern is what about other bootloaders or piece of
freestanding code that also shouldn't be built -mfdpic?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
