Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AB2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF2434032B;
	Sun,  6 Feb 2022 10:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-eqZmBr4Ekp; Sun,  6 Feb 2022 10:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50D440340;
	Sun,  6 Feb 2022 10:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC2731BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A23F4032B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emU7-jOFHyYu for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:51:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B7254021E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:51:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE24E1C0004;
 Sun,  6 Feb 2022 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644144718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iB7Da38pauf4CaChuAyU6+JjUT0i7tarhwmRqefM7VE=;
 b=HG3JyXeKrr6pkCjUaj0WlmWdI7kT5rhyshGEcCpb997bQcg3+nzr4LVCO5/gSiUDUsFs9g
 /P1DJ462i48Un1DDBIS8mNLQte485jLbZPTmCR836fyHUYFWfKXYODIoqJNvmHm6Wt9y0d
 HJ35F+tWKukWrWrrg5ljpxHWI2uEFaDZcbUOzgGs/WKIDIpz6984nJJFljcL2I9WbmsKny
 /qDd/9kdVwJI/51TR8ai+5fx2x5upLy0Okzz81cbjWcq2jeX4vWKGWfd+F4N/fC8T5/W+6
 8Fwo/H2zwQ5k3YitTiF4oL01T3YERcMlA9WLa6RevbQwsttc3hlSK/SGC7FNeQ==
Date: Sun, 6 Feb 2022 11:51:56 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220206115156.6042cc1b@windsurf>
In-Reply-To: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
References: <20220201230414.4144930-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 0/6] Fix gitlab CI build failure due to
 missing HOST_ dependencies
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Feb 2022 00:04:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

>   configs/bananapi_m2_ultra_defconfig: u-boot needs host python3 and
>     host openssl
>   configs/beaglev_defconfig: linux needs host openssl
>   configs/microchip_sama5d2_icp_mmc_defconfig: linux needs host openssl
>   configs/microchip_sama5d2_icp_mmc_dev_defconfig: linux needs host
>     openssl

These four are applied.

>   configs/microchip_sama7g5ek_mmc_defconfig: add missing
>     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 and host openssl for
>     linux
>   configs/microchip_sama7g5ek_mmc_dev_defconfig: add missing
>     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15 and host openssl for
>     linux

These two have issues, marked as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
