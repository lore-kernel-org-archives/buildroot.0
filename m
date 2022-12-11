Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C507C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3208131E;
	Sun, 11 Dec 2022 20:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D3208131E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GWMddZ-wy5Q; Sun, 11 Dec 2022 20:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C1881305;
	Sun, 11 Dec 2022 20:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C1881305
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B17691BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7529040448
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7529040448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3MLM1lGWbBa for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:06:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0782640356
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0782640356
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:06:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4996B240006;
 Sun, 11 Dec 2022 20:06:01 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:06:00 +0100
To: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Message-ID: <20221211210600.38a372a8@windsurf>
In-Reply-To: <20221206171719.747581-2-gadiyar@ti.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-2-gadiyar@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670789162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5LhkuDuGeyyIHf3YHR+M/0fZOmHzQu7/go0tsfX1/Q=;
 b=ECoG/zZnBSA9tdenKulkmWGsT/X8fx5+JewyYCgO2ol8BLvUlMAiLTMrRYQXBb5XygDJga
 wDBSSNpoLw2yjlIFT9bEBlGoxPNbZI5srJ00T9puIuDrSdxZhBoG561GQi44K1Gu+3yyCp
 3zI1gQ+WRL0wkC7mg0t5km40r0T2SwH3/0zK/VzJhW313tnXin0+l6UKoYlhrL8oT2WPnb
 exNafVP5CZeJqQq4RYyqnJJoOLbIGu26emj9b2i1LtBzk8B+neUKgVNwv6nbiCyqxeXbEL
 cweJwc1dO4hJEVB0k/1a2W/YDYx+ltdzdfPevvGfcJ59snAlhW7Ceb9o7MC3QA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ECoG/zZn
Subject: Re: [Buildroot] [PATCH v7 1/3] boot/ti-k3-r5-loader: add new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 6 Dec 2022 11:17:17 -0600
Anand Gadiyar via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> new file mode 100644
> index 0000000000..bb6140f8a6
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_TARGET_TI_K3_R5_LOADER
> +	bool "ti-k3-r5-loader"

Added:

	depends on BR2_aarch64

> +	help
> +	  Separate U-Boot build for R5 cores on TI's k3 boards.
> +	  Usually used to build tiboot3.bin with k3-image-gen.
> +
> +if BR2_TARGET_TI_K3_R5_LOADER
> +choice
> +	prompt "K3 R5 Loader configuration"

Simplified to just "Configuration".


> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> new file mode 100644
> index 0000000000..fb6ce7c2a6
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  6d69d5e4635cb3fa7852bf15f88ca342ef7740196e71961d3572deb58ba44bea  u-boot-2022.10-rc1.tar.bz2

You didn't test the build, as this hash file doesn't match the .mk
file: the .mk file refers to 2022.10, the hash file to 2022.10-rc1.

Another thing: the hash of the license file was missing.

I fixed up those small issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
