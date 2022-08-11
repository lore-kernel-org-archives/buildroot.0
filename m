Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A2C25B06
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A574840893;
	Thu, 11 Aug 2022 20:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A574840893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlGOs2GqTQ5b; Thu, 11 Aug 2022 20:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E84F402A9;
	Thu, 11 Aug 2022 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E84F402A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B20711BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C42682725
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C42682725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_1HBo3XZzUp for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:56:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E29B82496
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E29B82496
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:56:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 920C3240003;
 Thu, 11 Aug 2022 20:56:24 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:56:23 +0200
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Message-ID: <20220811225623.3114a39c@windsurf>
In-Reply-To: <20220810113921.3171659-1-bram.vlerick@openpixelsystems.org>
References: <20220810113921.3171659-1-bram.vlerick@openpixelsystems.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660251384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FmJ3lvrPEatOeMMLPkOkUMEbbyW9OICHkUVxe0825U=;
 b=QD0vmLDz8DN3/b23sIieJNxUYqfLn6wvUFzfd2eSqNfQ9NACHPPUnLgqT7gi0eFGIh+Tte
 kyWSa408fYZRkGDNM7TpEpKIRScCWiSy0BOqvI8D1pqswmQQ9vRG+pN7YlQ02bNWgrkEcO
 kxSlOr/2AkVtJMLKMRwTjkATdowme3Rld0jjpl7C4wWjxDlk2qvVE3x5kWTNTzL/fpZrPX
 KAHXzEXwaDSGibGy/kCjkoYOjPW8hc3svyxFLwVA3xNGpLoF/kzAdv8S8fmab/84yLD+ty
 gWZ9cpoNseTzQbNxb6AUI4pj7aId+NGjGBKp7fnEqA8+C/R595L/lwBmQcCY0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QD0vmLDz
Subject: Re: [Buildroot] [PATCH 1/1] package/imx-mkimage: bump version to
 lf-5.10.72_2.2.0
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

Hello Bram,

On Wed, 10 Aug 2022 13:39:21 +0200
Bram Vlerick <bram.vlerick@openpixelsystems.org> wrote:

> diff --git a/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch b/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
> index e8ba820f2f..d76580ebfd 100644
> --- a/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
> +++ b/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
> @@ -1,17 +1,18 @@
> -From 4870df3d70e94f9f0d6c06f610cea2d88cd6edb5 Mon Sep 17 00:00:00 2001
> +From a4993eda7483cd01662f3f3e2965e7a568cb7178 Mon Sep 17 00:00:00 2001
>  From: Erik Larsson <erik.larsson@combitech.se>
>  Date: Thu, 8 Mar 2018 19:04:37 +0100
> -Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
> +Subject: [PATCH 1/4] Add support for overriding BL32 and BL33 not only BL31

We generate our patches with git format-patch -N to avoid the 1/4, 2/4,
3/4, 4/4, which quickly becomes out of date.

>  
>  Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
>  Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
>  Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> +Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>

No need to add your own Signed-off-by when just "refreshing" existing
patches.

I've addressed those two minor issues, and applied your patch!

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
