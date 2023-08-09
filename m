Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FBCC001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AE94092F;
	Wed,  9 Aug 2023 21:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AE94092F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZarmLlyUTrbs; Wed,  9 Aug 2023 21:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD48418FB;
	Wed,  9 Aug 2023 21:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD48418FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 789891BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5213883A9A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5213883A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cx05UwizgWLV for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:25:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F41BF83A93
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41BF83A93
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58FCB60002;
 Wed,  9 Aug 2023 21:25:36 +0000 (UTC)
Date: Wed, 9 Aug 2023 23:25:35 +0200
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20230809232535.5da9862f@windsurf>
In-Reply-To: <20230102181603.3337480-1-Mr.Bossman075@gmail.com>
References: <20230102181603.3337480-1-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691616337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgZnZcO793SNgPDWlLazKiFWoJrpjP2hwb0T26KNj8g=;
 b=eLNZ6QFEy0RWJb7ldC9j/V7CKVrxlDFt3UYpYps9cZ+HfM3gAeLlmZVoEUGEYOUXb2C3hA
 Y32P3Mv5Wmgcijgk41+hYZv7iWz4WyScHagR9s1/v2vD+Yb1Qy1xKXNgFkBWcS6T2ydwWT
 b1ZmmhZLD8TwAEIN4qKmahu5f6fGaLVyeYQ5rZ395Qp+GWb8SuTMzP/cPObOKERKMlfaUB
 N73urbEqIumrPXsjmpdRYxdXcNi7ZDME0sly4d43W31AFWnk1vBjj/IZnUyc2EqrCjH8Dj
 X0+8uauSVnMPbADTJ+MLg8heHjmffVaS9BYvQyJnXJKc5RnSAjK07F2bX3yEdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eLNZ6QFE
Subject: Re: [Buildroot] [PATCH v6] configs/imxrt1050-evk: New defconfig
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
Cc: festevam@gmail.com, Giulio Benetti <giulio.benetti@benettiengineering.com>,
 maeva.manuel@oss.nxp.com, stephane.viau@oss.nxp.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Mon,  2 Jan 2023 13:16:03 -0500
Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add defconfig for imxrt1050-evk is a development board from NXP.
> 
> Giulio and I worked on Linux and U-boot for this board. And now I'm
> adding support for the new board in Buildroot.
> 
> The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
> first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
> up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
> cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
> 1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
> uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
> Seeing that these chips are comparable to the STM32F7xxs which have
> buildroot ported to them it seems reasonable to add support for them.
> 
> https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Sorry for the super super long delay, but I have now applied this patch
to our next branch.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 59121c6a54..ee33c65fd4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1132,9 +1132,11 @@ F:	package/webp/
>  F:	package/xapian/
>  
>  N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
> +F:	board/freescale/imxrt1050evk/*

The * here is not needed. A directory is properly interpreted.


> +N:	Jesse Taube <Mr.Bossman075@gmail.com>
> +F:	board/freescale/imxrt1050evk/*

Same.

> +# Required tools to create the SD card image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MKPASSWD=y

I don't think mkpasswd is needed in your configuration, so I dropped
that.

Committed with those changes.

Possible improvements now:

- Update to newer kernel/U-Boot
- Use zImage instead of uImage for the kernel if possible
- Maybe use extlinux.conf in U-Boot if it's also possible

Nothing urgent, just suggestions.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
