Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D59C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD98A4054E;
	Sat, 12 Aug 2023 19:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD98A4054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA-_9Fe0NMSQ; Sat, 12 Aug 2023 19:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FCD4052D;
	Sat, 12 Aug 2023 19:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7FCD4052D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8A9D1BF21A
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF656818C9
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF656818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOu1Uaam-vUu for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:59:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B62DC818A2
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B62DC818A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6BE6C0006;
 Sat, 12 Aug 2023 19:58:58 +0000 (UTC)
Date: Sat, 12 Aug 2023 21:58:57 +0200
To: Roberto Medina <robertoxmed@gmail.com>
Message-ID: <20230812215857.6476eee8@windsurf>
In-Reply-To: <20230811162546.8088-2-robertoxmed@gmail.com>
References: <20230811162546.8088-1-robertoxmed@gmail.com>
 <20230811162546.8088-2-robertoxmed@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691870339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFK6Zz6qIWD505YL11JS5QFpcz9HC6vsKLQk0mrEZsQ=;
 b=HmqA383yBQqC0siE9g5kSjoWaRWiXTuPoHSWcOUACWcMePCTFf1y1WlR8c+OmsAZE9ze+G
 Xip6LYhHEYKW3bl6EG5wvfjugqU2y2Eg8Ai63dDoFh5n2K+QrUJcpe34imznBsiJwUcTKr
 psmdczYZsqOzw95MtVjFPZ1Rse46NMa9LKScjfaFfHKiGqbi8BipyRTnr1a8p/y9NGK8Sz
 dEHAYo3lILJ0J8xXWV11OauEuGFRWcm7Pt9w3Zp7aKnoiJqEQne7zknf0Pt98n+D9thoeV
 S7Pi8dG+FxTyYlKJojv2lJA/3h77ivDYHc7eVgAYktF03DGEYARUemDI8nDP/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HmqA383y
Subject: Re: [Buildroot] [PATCH 1/1 v3] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
Cc: kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roberto,

I've applied your patch to our next branch, with some very minor
updates.

First, I simplified the commit title to:

	configs/roc_rk3388_pc: new defconfig

See below for more comments.

On Fri, 11 Aug 2023 18:25:38 +0200
Roberto Medina <robertoxmed@gmail.com> wrote:

> * Uses a version 2.9 of TF-A which solves the building issue for this
>   board.
> * Increase the size of the ext2 partition to be able to create the final
>   image.
> * Bump and set the U-Boot version that was used for this configuration.
> * Bump and set the version of Linux to 6.1.45.
> * Some minor fixes in the post-build.sh script using `shellcheck`.

These details are the details of the changes between the v2 and v3 of
your patch, so they do not belong to the commit log, but they should
go...

> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> Reviewed-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---

.... here.

>  DEVELOPERS                                |  4 +++
>  board/firefly/roc-rk3399-pc/extlinux.conf |  4 +++
>  board/firefly/roc-rk3399-pc/genimage.cfg  | 22 ++++++++++++
>  board/firefly/roc-rk3399-pc/post-build.sh |  5 +++
>  board/firefly/roc-rk3399-pc/readme.txt    | 40 +++++++++++++++++++++
>  configs/roc_pc_rk3399_defconfig           | 42 +++++++++++++++++++++++
>  6 files changed, 117 insertions(+)
>  create mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
>  create mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
>  create mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
>  create mode 100644 board/firefly/roc-rk3399-pc/readme.txt
>  create mode 100644 configs/roc_pc_rk3399_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6ffa3ee693..5ebabd01cb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2546,6 +2546,10 @@ F:	package/mhz/
>  N:	Robert Rose <robertroyrose@gmail.com>
>  F:	package/grpc/
>  
> +N:	Roberto Medina <robertoxmed@gmail.com>
> +F:	configs/roc_pc_rk3399_defconfig
> +F:	board/firefly/roc-rk3399

Alphabetic ordering was not correct here. And I added the final slash
for the directory, as suggested by Kilian.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
