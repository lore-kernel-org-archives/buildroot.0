Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB93C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 22:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597A3408B0;
	Sat, 14 Jan 2023 22:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 597A3408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezmo-wHVRC9l; Sat, 14 Jan 2023 22:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 696BD4063C;
	Sat, 14 Jan 2023 22:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 696BD4063C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8D71BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C744063C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78C744063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nKIx5Hs9QeK for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 22:00:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7421D4048A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7421D4048A
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 22:00:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89621FF806;
 Sat, 14 Jan 2023 22:00:29 +0000 (UTC)
Date: Sat, 14 Jan 2023 23:00:28 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230114230028.46833cae@windsurf>
In-Reply-To: <VI1P190MB0493F15E5CA3D6BC8CCD52029FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493F15E5CA3D6BC8CCD52029FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673733629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfOcKm/iLZMKZe1+pYlSblsaPnylV5yaxaLAZuEH59c=;
 b=Rx3A7iLGzVWn81nDk0ts9E1UV1Im7cNibqLcUBPy0rCHsemJxwVOYcBGgjS4d8D87/KXxz
 Ca4Q1m6tSczl4si2nhqCegCsQUcMtjP+Y4kpfaOWs8LYusV4cibEIin7i8pl3uRrNBVC1n
 xzj9G2ef7zUBSAvyeT0R6onM8IjPBwg75tqJR8LW0SGixc3a1uhu2Tg8ATW6/21lsh/LnN
 isp3xfgJ146ZklFeVTKAkXeo20OZYxLINNxZFFNMDtQdai7j/9g4OiOWUXS6bWuvVvLaCQ
 Hrw8RMH/yIVc+Uz1KiN1wrUBNlwZ34bSYHGzH5YRpxA+dEP9vsrjLQS6qQf24Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rx3A7iLG
Subject: Re: [Buildroot] [PATCH 1/3] package/freescale-imx/imx-gpu-viv: drop
 X11 output
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
Cc: Lang Daniel <d.lang@abatec.at>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 Jan 2023 09:32:43 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
> the X11 folder is no longer included in the archive.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>

I've applied with minor tweaks. See below.

> +config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
> +	bool "imx-gpu-viv X11 output has been removed"

	select BR2_LEGACY

was missing here to make sure the build doesn't start if this option is
enabled.

> +	help
> +	  The X11 output was dropped by NXP.
> +
>  config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
>  	string "the QEMU specific targets option has been removed"
>  	help
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index 9ba3d0428e..bc30798ca5 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -27,8 +27,8 @@ config BR2_PACKAGE_IMX_GPU_VIV
>  	  Userspace libraries for Vivante GPU on i.MX platforms
>  
>  	  It contains libraries and headers for GLES, OpenCL, and
> -	  OpenVG. It also contains a DRI plugin for X11. It also
> -	  contains a plugin for DirectFB-1.4.0, but that doesn't work
> +	  OpenVG. It also contains a plugin for DirectFB-1.4.0,
> +	  but that doesn't work
>  	  together with buildroot's DirectFB version.

This paragraph should have been rewrapped after your change.

Other than that, looks good so I've applied. Of course, it might be
surprising for people who might be using X11 with OpenGL support on
i.MX platforms... but we're simply following the choice made by
upstream.

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
