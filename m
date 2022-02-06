Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB9BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 12:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22FD281429;
	Sun,  6 Feb 2022 12:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fvq4fzdGveeL; Sun,  6 Feb 2022 12:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C7681422;
	Sun,  6 Feb 2022 12:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB281BF5F5
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68E1D60ADC
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 12:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFuV6s00byVt for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 12:17:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1892E60A89
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 12:17:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2B0FE0003;
 Sun,  6 Feb 2022 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644149818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPszAwYdvJKHuZC0GKpqxYnPYaAw6br49KL1sC9I/L4=;
 b=QhWjvwrm7j17Oi3HiL22uuB7vLavOZVQ3dFP0v4frHO3YV2NI7MaSqRgKaFMSaL4PoMvpG
 f3oNSiocyT/DgcGPFGS78rDrNmr4m62LNNEK7NrvaMwlInKvIKLMVewaJKONoibTQ1M3Zu
 Kp5idxZgZdJc0kyZ+bGE9+sQbqz/4DQSsEs6jWOQU0xKEvI5r38YSRLWeCHnQW8esiFX5c
 4meSfDdguAmUy/biku0rDBQFjGsLuJpCsBA88djrbmn7KwiFM8BXwTpvVizIGAKe3l4+mr
 dN/4X/xQE+4BSq2jaiYWE9B5pT4Cbw07YUsBntkZe7gf8iJxm0iEfDnWT7UzCg==
Date: Sun, 6 Feb 2022 13:16:56 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220206131656.16e2c8a6@windsurf>
In-Reply-To: <20220206112620.1637342-2-giulio.benetti@benettiengineering.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
 <20220206112620.1637342-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/2]
 configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
 Ludovic Desroches <ludovic.desroches@microchip.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Feb 2022 12:26:19 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821098
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Did you actually test on HW that 5.15.21 was working? Shouldn't this be
done by the original submitter of the defconfig.

Eugen, Ludovic?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
