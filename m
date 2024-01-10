Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53B7C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 840FE400C1;
	Wed, 10 Jan 2024 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 840FE400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtuYspcjvry0; Wed, 10 Jan 2024 20:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D0C1436BC;
	Wed, 10 Jan 2024 20:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0C1436BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0E531BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CCCD42078
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CCCD42078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWtE1n8vG8b0 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:35:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 500084206F
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 500084206F
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABC3360002;
 Wed, 10 Jan 2024 20:35:33 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:35:32 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240110213532.3e12945b@windsurf>
In-Reply-To: <20240106153539.570324-1-ju.o@free.fr>
References: <20240106153539.570324-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704918933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sfpoEjfe4gI3Yh7aztQHlBHZ0kbgoq2Kps2ZJDrkVxI=;
 b=nCMS8KDKfv+SDZ9eu2SySPLiD9jOf5lrhWyv/wzjSpLJR4ICP675CFWeWa+2aqpTRmJkzx
 P1Csc7FiCe63bH5drTaLZ2ikHHk9vFDj/f5pKRiDBudyDWk+IGt7BTt9VIUZ70J9t4JP7M
 LKDMDYW3IDe0eUc9Gb6yAZGMgHFhePe6zKbEdfaC3A6m/GXsF+/zKLf50grLCD829x+UmX
 d9KB/djrhTwd0Z6dHs9b3vZNtnVvUuftP/dZChe4ohOMC8hZPsDZI1b+xZcZYnSiG9/Yxu
 4FfcZbf+BtftPsLc7jqtkZ0B0Tx6HBwFh+EZl6V41pnTtDuOEfLhKD+PSeI4ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nCMS8KDK
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mmpico: uboot needs openssl
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

Hello Julien,

On Sat,  6 Jan 2024 16:35:39 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Commit 78e8f383 "configs/imx8mmpico: bump bsp components to version
> tn-kirkstone_5.15.71-2.2.0" bumped components, but forgot to add
> BR2_TARGET_UBOOT_NEEDS_OPENSSL=y.
> 
> This commit adds it to the defconfig to fix the build.
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180248
> 
>     In file included from tools/imagetool.h:24,
>                      from tools/aisimage.c:7:
>     include/image.h:1166:12: fatal error: openssl/evp.h: No such file or directory
>      1166 | #  include <openssl/evp.h>
>           |            ^~~~~~~~~~~~~~~
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  configs/imx8mmpico_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
> index c402ea675d..711cdeb390 100644
> --- a/configs/imx8mmpico_defconfig
> +++ b/configs/imx8mmpico_defconfig
> @@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Puck-imx8mm"

This doesn't apply here, as this line doesn't match what we have in
Buildroot. Is this "Puck-imx8mm" normal? We have:

BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"

Could you check this?

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
