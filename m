Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BBDC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E08288204F;
	Sat,  4 Nov 2023 13:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E08288204F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRKpDogRUtLS; Sat,  4 Nov 2023 13:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25B5082045;
	Sat,  4 Nov 2023 13:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B5082045
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA8301BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 937C3418C9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 937C3418C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71kV0ohL7qG1 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:40:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66F81418C5
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F81418C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96F8440005;
 Sat,  4 Nov 2023 13:40:39 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:40:38 +0100
To: Javad Rahimipetroudi <javad321javad@gmail.com>
Message-ID: <20231104144038.4860e3b8@windsurf>
In-Reply-To: <20231104072458.7369-7-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
 <20231104072458.7369-7-javad321javad@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699105239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpX1CCCXv+kbNdC2/KUVIzRQdj6PxOvawhyuiUA6sXo=;
 b=Nnn5sfZkINwBT/XVO7Gb1gp9zlLiLla1WcOTKFHDmEW/ZAinmuUVJjagYm9BvLL7vy13sI
 jbpIvF9RRKhZ4SXH3TcXR+jSCA0mPXnzaCl++ppj7BDqQUAKOcTgX7tXBLEcgxDxuPJfkr
 9Rtm6avG9X8ehPhGAtZ1V5WYNXdAVWjFf5/sOeNDazVDqaVEzjSfXS4peLd/IhZAPprLUc
 Qm7eFSrqVE4fADptmrO1CS9HUFob7NAfV1kLm/i7y60yC18Zs/9pWkSoJ5fijDdKDyc3Wv
 F0DCp/lcQvHIbn/s7teo3jnVuuuPflXL1toDeDZ2SoxD4aPuTz1YH0PfBh78bQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nnn5sfZk
Subject: Re: [Buildroot] [PATCH 7/7] board/pine64/genimage.cfg: remove
 unnecessary partition for itb For minimal booting,
 uboot.itf is no longer required, so the correspondig partition deleted.
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Commit title is too long. You need to have a short title, then an empty
new line, then a longer commit log, potentially in multiple paragraphs,
that explains in more details what is happening.

On Sat,  4 Nov 2023 10:54:58 +0330
Javad Rahimipetroudi <javad321javad@gmail.com> wrote:

> Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
> ---
>  board/pine64/pine64/genimage.cfg | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
> index 37ebe5ea6e..23b02973dd 100644
> --- a/board/pine64/pine64/genimage.cfg
> +++ b/board/pine64/pine64/genimage.cfg
> @@ -20,13 +20,6 @@ image sdcard.img {
>  		offset = 8K
>  	}
>  
> -	partition u-boot {
> -		in-partition-table = "no"
> -		image = "u-boot.itb"
> -		offset = 40K
> -		size = 1M # 1MB - 40KB
> -	}

Not sure where this should go. Together with the U-Boot update,
probably, as it's following the U-Boot update that there's no longer
any u-boot.itb? But then, where is U-Boot stored now?

Overall, your patch series is not correctly split into logical patches
that each do one thing, but do it completely. Your series is not
bisectable, which also isn't good.

Could you rework your patch series according to those comments, and
submit a new version?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
