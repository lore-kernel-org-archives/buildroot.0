Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF77BC83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 497F0418EC;
	Sat, 26 Aug 2023 18:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 497F0418EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7GbLgOyUs_c; Sat, 26 Aug 2023 18:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A809418C0;
	Sat, 26 Aug 2023 18:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A809418C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 618EC1BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B38082EB5
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B38082EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sc7bP20lTwBV for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:06:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2138182E19
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2138182E19
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13D8C40003;
 Sat, 26 Aug 2023 18:06:11 +0000 (UTC)
Date: Sat, 26 Aug 2023 20:06:10 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230826200610.4ff26fb3@windsurf>
In-Reply-To: <20230826165628.31792-1-romain.naour@gmail.com>
References: <20230826165628.31792-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693073172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGhPSozCJgYcymCToS16dKxNGoTku5WEx3AiCOVOIkg=;
 b=IA/Mbw+tj6WdGccyq1pNseb7xO1p4ROrRYKf5ZW7jNNrhEhvBeFBFsg6VAfZQwBD6xK/m8
 pxhgrkUkg+r0kTeJ9UeCXOVaG+oPN9M3eo8DYI3dduAjBwmMQiIYSfBg5xYgBkxC2aNOAt
 srQ/iW5p24/fTNbmkkWQu3nISLt9ZFho4LMmlAxKOHH4l3DEEg9tyn0Fk0NFMaNhF8sAOv
 +3o06v6adJ2FiJUvmeCYnbq+9m4LwoMaeCzAZDQ6zxN5F/2Zd9DCGW4PgmHOOmcCKNqBvM
 KnHMWv6GR1uVMRacDHje20ze3I7q0LBa7B3U76TkRwpRAeZIOH15yI/vwSBN7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IA/Mbw+t
Subject: Re: [Buildroot] [PATCH] configs/freescale_imx6qsabresd_defconfig:
 fix defconfig
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

On Sat, 26 Aug 2023 18:56:27 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> While switching ATF to github, the BR2_TARGET_UBOOT_CUSTOM_GIT=y
> symbol was not removed. Since then this defconfig fail to build
> in gitlab-ci due to invalid defconfig check.
> 
>   WARN: defconfig ./configs/freescale_imx6qsabresd_defconfig can't be used:
>         Missing: BR2_TARGET_UBOOT_CUSTOM_GIT=y
> 
> [1] dd42b159a5f752921ee602530d289c810ad7ee51
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436612
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> This defconfig will fail anyway due to too old ATF package (pre V2.9 version)
> and binutils 2.39+. But it should be backported up to 2023.02.
> ---
>  configs/freescale_imx6qsabresd_defconfig | 1 -
>  1 file changed, 1 deletion(-)

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
