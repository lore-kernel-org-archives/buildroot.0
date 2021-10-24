Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00267C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:09:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33CA60F45
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B33CA60F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 843876081C;
	Sun, 24 Oct 2021 14:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKh_WC1H6xD3; Sun, 24 Oct 2021 14:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA54B606A7;
	Sun, 24 Oct 2021 14:09:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2F61BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79F26401A6
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hex8obi8fEkp for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:09:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7485A40192
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:09:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A5AD1240004;
 Sun, 24 Oct 2021 14:09:41 +0000 (UTC)
Date: Sun, 24 Oct 2021 16:09:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211024160940.4d4b6706@windsurf>
In-Reply-To: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
References: <20211021220023.68288-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/8] Olimex boards u-boot/linux update
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Leon Anavi <leon.anavi@konsulko.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Fri, 22 Oct 2021 00:00:15 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Giulio Benetti (8):
>   configs/olimex_a10_olinuxino: bump to Linux kernel 5.14.13 and u-boot
>     2021.10
>   configs/olimex_a10_olinuxino: use FPU NEON strategy
>   configs/olimex_a13_olinuxino: bump to Linux kernel 5.14.13 and u-boot
>     2021.10
>   configs/olimex_a13_olinuxino: use FPU NEON strategy
>   configs/olimex_a20_olinuxino_lime2: bump to Linux kernel 5.14.13 and
>     u-boot 2021.10
>   configs/olimex_a20_olinuxino_lime: bump to Linux kernel 5.14.13 and
>     u-boot 2021.10
>   configs/olimex_a20_olinuxino_micro: bump to Linux kernel 5.14.13 and
>     u-boot 2021.10
>   configs/olimex_a33_olinuxino: bump to Linux kernel 5.14.13 and u-boot
>     2021.10

I have applied all the patches bumping U-Boot/Linux, I hope that you
were able to test them on real hardware. Make sure to monitor the next
Gitlab CI build results to see if there's any new build failure.

However, for the two patches enabling NEON as the FPU, I marked them as
rejected. Indeed, using NEON as the FPU is not always a good idea, as
it explained in the Config.in.help text:

          This option allows to use the NEON SIMD unit, as available
          in some ARMv7 processors, as a floating-point unit. It
          should however be noted that using NEON for floating point
          operations doesn't provide a complete compatibility with the
          IEEE 754.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
