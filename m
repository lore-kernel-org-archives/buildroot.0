Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D3FC00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA826102B;
	Sun, 30 Jul 2023 20:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA826102B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRTElZKp1E2i; Sun, 30 Jul 2023 20:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C019861028;
	Sun, 30 Jul 2023 20:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C019861028
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5946D1BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FB2081A34
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB2081A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S43EHw8867AG for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:47:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB1FA81A33
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 20:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB1FA81A33
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FA7320002;
 Sun, 30 Jul 2023 20:47:20 +0000 (UTC)
Date: Sun, 30 Jul 2023 22:47:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730224719.780158e9@windsurf>
In-Reply-To: <20230730185526.2695488-1-bernd@kuhls.net>
References: <20230730185526.2695488-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690750046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vl87DKZXwtoFd7aIiYz+jt1F0+ga/Y5mx+kWDsf5KP0=;
 b=cE+SIt+4krM82AKmNOXr3HgjpWooD4UUb5/J21I90zZYt3IYEXSm4TPsRR0HZShZtarGhP
 aa7aoI/naYuiO1EzDqCDd+OtWhq9vIZEK8PRRa4/sDSQjrQtMszIMlAWBY092/MYAFZCy7
 EZ/LpZUbN83PX2jHcD0s6jd+dA8p9Yt+uU8jfXFXW/yF5DAzXS0lYNyQADpbd0p5/xD99r
 TTZqq7YR7wiU9JromaSdFovn65Wm671eN9DhiA+M/ya7Jqz1fKHBzruSzxiFDcq+rM8W8a
 IISWsSuj71yLRLncRg+RyTtVRPdeqdgEVK0kdZ4olhcQWOWHO2fsb750gEwbtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cE+SIt+4
Subject: Re: [Buildroot] [PATCH 1/1] package/libiberty: bump version to 2.40
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
Cc: Akshay Bhat <nodeax@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 20:55:26 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Akshay Bhat <nodeax@gmail.com>
> 
> If the libiberty package is not the same version as the one packaged
> with binutils AND if libiberty is installed before binutils, then the
> below error is observed. Hence for now let us keep the versions in sync.
> 
> /usr/bin/ld: ../libiberty/libiberty.a(hashtab.o):(.data.rel.local+0x0)
> : multiple definition of `htab_eq_pointer'
> 
> Fixes:
> http://autobuild.buildroot.net/results/f07/f077ec588b395102ad501a18c85d5030c0765031/
> 
> Build-tested using these four defconfigs:
> ----------
> BR2_arceb=y
> ----------
> BR2_BINUTILS_VERSION_2_38_X=y
> ----------
> (empty defconfig meaning binutils-2.39)
> ----------
> BR2_BINUTILS_VERSION_2_40_X=y
> ----------
> each using these commands:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
