Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6EFC83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3386D60E8B;
	Sat,  2 Sep 2023 17:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3386D60E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cu8D9dbBUoA7; Sat,  2 Sep 2023 17:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88BA660E7A;
	Sat,  2 Sep 2023 17:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88BA660E7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9911BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EFEB41702
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EFEB41702
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iC2xjYhP3aM for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:15:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E4E14168E
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4E14168E
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD8D51BF203;
 Sat,  2 Sep 2023 17:15:50 +0000 (UTC)
Date: Sat, 2 Sep 2023 19:15:49 +0200
To: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Message-ID: <20230902191549.44efa583@windsurf>
In-Reply-To: <CAEg67GmsMwVm0Hh23EjdR_SmRpbz_51MBGgjjn2WGkv3jjncXg@mail.gmail.com>
References: <CAEg67GmsMwVm0Hh23EjdR_SmRpbz_51MBGgjjn2WGkv3jjncXg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693674950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSo5rumSZMxPSHI4hZ3hsAq0QJRqOZfwDKNFKsA13A0=;
 b=kNW1S/lQzbwuE/h++BVHtcQFMbPbhvub19s3TbB05c3p8+Xfekvv3Tt2VmrMYV6YeJUWxg
 3ZZF61rBm4QHJsBpPtharn2GmtVH7r5Vryn4AeBg5Z1IVDp/Z1ieixKvLFWCyoSmePvyB4
 yTQl9qK4RUXDkB4cMtF6Sop26h50GS3XudX0ffqXmkMrpqoIe17Fy3EQLwui2l2/qbqt0T
 X6NFI5MVX8vk7RVyeHQRkCBDUhUlgRfHqN5zMRdaLnVuMP9q/iz4AxAr0zfxAvidWvTKmH
 x3nY2kCWqOfidA+7q0Ex1Ok/yQ7UqfoYRHTKnZHv3KWkO/ZSQtmwPsNCyAG8lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kNW1S/lQ
Subject: Re: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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

Hello Patrick,

On Wed, 5 Jul 2023 17:16:34 +1000
Patrick Oppenlander <patrick.oppenlander@gmail.com> wrote:

> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
> + string "Device Tree Source file paths"
> + help
> + Space-separated list of paths to device tree source files
> + that will be copied to arch/ARCH/dts/ before starting the
> + build.
> +
> + To use this device tree source file, the TI K3 R5 Loader
> + configuration file must refer to it.
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index 8311e1b401..012f4ee52d 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -77,7 +77,12 @@ TI_K3_R5_LOADER_MAKE_OPTS +=
> TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
>  endif
>  endif
> 
> +TI_K3_R5_LOADER_CUSTOM_DTS_PATH = $(call
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH))
> +
>  define TI_K3_R5_LOADER_BUILD_CMDS
> + $(if $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH),
> + cp -f $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH) $(@D)/arch/arm/dts/
> + )
>   $(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D)
> $(TI_K3_R5_LOADER_MAKE_OPTS)
>  endef
> 

This patch is badly line-wrapped. Could you resend with "git send-email"?

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
