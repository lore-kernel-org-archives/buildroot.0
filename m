Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D35C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4BC60E73;
	Sat,  2 Sep 2023 17:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F4BC60E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLC6a4jZJrpm; Sat,  2 Sep 2023 17:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3404608A5;
	Sat,  2 Sep 2023 17:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3404608A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12ED51BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0C4981F54
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C4981F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YuYBVkcDZHbY for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:19:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADE6081F4D
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADE6081F4D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DC341C0004;
 Sat,  2 Sep 2023 17:19:44 +0000 (UTC)
Date: Sat, 2 Sep 2023 19:19:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230902191941.75fc1033@windsurf>
In-Reply-To: <20230716145003.339645-2-bernd@kuhls.net>
References: <20230716145003.339645-1-bernd@kuhls.net>
 <20230716145003.339645-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693675184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKHJa/sCykVwG7gpzlC8FUbE9XwYbH1+1yq1/tj0Xu4=;
 b=IjDCeb957UiPQDfhpZYUULz+gvAJ78jzpShQq7sLpzA2KiIfCBwl++pY3AnxY8aD58bgNN
 1894Mg2RuA0npupPjsIjK/n8wseP5PqSw2kGkvvE+GhzNIbHjbgM+t6dgf1j1wd0EXlcVH
 HoVlTT1AJXv3S/8wwRQUq7MXafMFoOdRMJDidtsmTWRvrVGFMRDriIRxvLRv5SsylsgalT
 dkZZIR5O9nZ81hDInyHYkq7eYya6O7qcY6M/Bdm2qfpYC62p5d5o/38fO5bWYWTAOrhTsf
 yf2FfPW558p90CHj2R8actcMGWR3tDf70SsTDz/abkvO5eMZs8xtt58i8hkEjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IjDCeb95
Subject: Re: [Buildroot] [PATCH 2/2] package/mesa3d-demos: add optional
 dependencies for wayland support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Spenser Gilliland <spenser@gillilanding.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Yann for kconfig sorcery.

On Sun, 16 Jul 2023 16:50:03 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> libdecor cannot be selected due to a circular dependency:
> 
> package/wayland/Config.in:1:error: recursive dependency detected!
> package/wayland/Config.in:1: symbol BR2_PACKAGE_WAYLAND is selected by BR2_PACKAGE_LIBDECOR
> package/libdecor/Config.in:1: symbol BR2_PACKAGE_LIBDECOR is selected by BR2_PACKAGE_MESA3D_DEMOS
> package/mesa3d-demos/Config.in:1: symbol BR2_PACKAGE_MESA3D_DEMOS is selected by BR2_PACKAGE_PIGLIT
> package/piglit/Config.in:1: symbol BR2_PACKAGE_PIGLIT depends on BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND
> package/waffle/Config.in:7: symbol BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND depends on BR2_PACKAGE_WAYLAND
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-demos/Config.in       | 1 +
>  package/mesa3d-demos/mesa3d-demos.mk | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

I've split this into two commits: one for libxkbcommon, one for
libdecor, and added references to the autobuilder failures being fixed,
and applied to master.

It's a bit a pity that we can't select BR2_PACKAGE_LIBDECOR due to the
recursive dependency we have there reported by kconfig. To me, this
recursive dependency is bogus, but I'll let Yann comment :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
