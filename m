Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7961EE7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2F983DBB;
	Sat, 30 Sep 2023 09:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2F983DBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrdXSeV62INi; Sat, 30 Sep 2023 09:37:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5001783DB9;
	Sat, 30 Sep 2023 09:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5001783DB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE3E01BF2EA
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6E7660E5D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E7660E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXa_4WVmePIL for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:36:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C58D60E4E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C58D60E4E
Received: by mail.gandi.net (Postfix) with ESMTPSA id A220960003;
 Sat, 30 Sep 2023 09:36:52 +0000 (UTC)
Date: Sat, 30 Sep 2023 11:36:51 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230930113651.572c4efa@windsurf>
In-Reply-To: <20230806221821.284678-1-giulio.benetti@benettiengineering.com>
References: <20230806221821.284678-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696066613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGHll2jCqdipCVFI6DM43gk/Pj2gapbmvpUxS1RyyuI=;
 b=erIMd1wMStYOeYsSrw22Fon4gx2Jc8eEB6jbg+eNsg6Xp/l9r0JuIkhlwUgim2nBSim6VP
 5yJeVHzyumi+3jBOUgyyW8LIftArwJYrtFg1JCPc8745b+AdZYNJj7ceyQ6DolpVkdPh/n
 +LpISMtiGqDLb60Rxho4z1JHh3okfrCtQDct2c93IBPqh+2JsPBBwe+h59xn8GCIHkZC+t
 X9H1vbp3GwGYv6V87awdGPYL+bbEYvSxEsZ4Hh0usAxR3g3+YB9XtxcaObkcmSzHch1Emr
 2bP50wNhx5g7oiM+CAIXT3AFemzSx6i4jyuZHupg0pDHES/Q6YAcKnUgS0RgBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=erIMd1wM
Subject: Re: [Buildroot] [PATCH] configs/bananapi_m2_berry: new defconfig
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

On Mon,  7 Aug 2023 00:18:21 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:


> diff --git a/board/bananapi/bananapi-m2-berry/boot.cmd b/board/bananapi/bananapi-m2-berry/boot.cmd
> new file mode 100644
> index 0000000000..a808fa0407
> --- /dev/null
> +++ b/board/bananapi/bananapi-m2-berry/boot.cmd
> @@ -0,0 +1,7 @@
> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait drm.debug=0xff

I dropped earlyprintk and drm.debug=0xff from there, as it's really a
bit too much debugging oriented.

In any case, it'd be great to use extlinux.conf instead of this.

> diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
> new file mode 100644
> index 0000000000..95652e7939
> --- /dev/null
> +++ b/configs/bananapi_m2_berry_defconfig
> @@ -0,0 +1,37 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Berry"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v40-bananapi-m2-berry"
> +BR2_PACKAGE_KMSCUBE=y
> +BR2_PACKAGE_MESA3D=y
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA=y
> +BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> +BR2_PACKAGE_MESA3D_OPENGL_ES=y
> +BR2_PACKAGE_HTOP=y

I dropped kmscube, mesa3d and htop, because they don't qualify for a
minimal configuration.

Applied with those changes.

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
