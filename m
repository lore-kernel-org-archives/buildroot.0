Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D214BC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87A564F1BD;
	Thu,  2 Nov 2023 18:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A564F1BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4hf0hnmYW0t; Thu,  2 Nov 2023 18:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A864F1BF;
	Thu,  2 Nov 2023 18:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A864F1BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91E0C1BF861
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B4546118C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4546118C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aqv8auZkPdq for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:07:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB70761126
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB70761126
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05AC540003;
 Thu,  2 Nov 2023 18:07:48 +0000 (UTC)
Date: Thu, 2 Nov 2023 19:07:48 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231102190748.3232ab71@windsurf>
In-Reply-To: <20231013210841.153788-1-giulio.benetti@benettiengineering.com>
References: <20231013210841.153788-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698948469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q35imbB2NubXceO2uvHKNKm2DwyRS9bWZfMRFw9dVKU=;
 b=SgAhw7ZgL1Q1gx3dCfLDOx4naiGqOKp/rqEnkDEgKtdIQyK42/bBW8p1pXHiAyxIyiyMsg
 nrUs3gEDSE0Xd88lglN2rlGqN2dMLMvZlE55IQzGAJye/U8j03p5oZ2TwMxOhTvl/ltB51
 S9Of6EwmQu6OrpenEaWrWeAQt8jfDRwBL1Whuws0voZJByR1+lw0S9UdKDz1SZDt3z0A33
 7ErfIfFYWBjLkG+e5CACulecLEHVKVpNnZHHw9iVbgOvk8f7mztrxW6CjhsSz3iMdJxzAR
 LIwx+/2SBteJJOe+eRtgqXWLNrJSldEwECYu7tw/7y4phsGuyvvrA4ypim1PXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SgAhw7Zg
Subject: Re: [Buildroot] [PATCH 1/2] board/bananapi/bananapi-m2-berry:
 switch to use extlinux.conf
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

Thanks for your work on this!

On Fri, 13 Oct 2023 23:08:40 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> diff --git a/board/bananapi/bananapi-m2-berry/genimage.cfg b/board/bananapi/bananapi-m2-berry/genimage.cfg
> index 535f3dffee..92c8677545 100644
> --- a/board/bananapi/bananapi-m2-berry/genimage.cfg
> +++ b/board/bananapi/bananapi-m2-berry/genimage.cfg
> @@ -1,15 +1,3 @@
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"sun8i-v40-bananapi-m2-berry.dtb",
> -			"boot.scr"
> -		}
> -	}
> -
> -	size = 64M
> -}
> -
>  image sdcard.img {
>  	hdimage {
>  	}
> @@ -21,12 +9,6 @@ image sdcard.img {
>  		size = 1016K # 1MB - 8KB
>  	}
>  
> -	partition boot {
> -		partition-type = 0xC
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
>  	partition rootfs {
>  		partition-type = 0x83
>  		image = "rootfs.ext4"

Are you sure this works? Indeed the FAT partition used to have the
bootable = "true" flag. Now, no partition has this flag. But from what
I remember, the heuristic that U-Boot uses to determine which partition
has the extlinux.conf file is precisely this bootable flag.

Could you double check this?

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
