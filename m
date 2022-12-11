Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4C7C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DCFD40339;
	Sun, 11 Dec 2022 20:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCFD40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Db0ZTF6tjtq2; Sun, 11 Dec 2022 20:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7544840743;
	Sun, 11 Dec 2022 20:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7544840743
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEE451BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC59A813C5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC59A813C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyBZ7HGq9qOJ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:13:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D89813C3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37D89813C3
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:12:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C34A2E0006;
 Sun, 11 Dec 2022 20:12:56 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:12:55 +0100
To: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Message-ID: <20221211211255.1d7caacc@windsurf>
In-Reply-To: <20221206171719.747581-4-gadiyar@ti.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-4-gadiyar@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670789577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eL8E8ZzSrGh72Eml5FrM57FJwMNG+ogZdt3fXMCDj8=;
 b=kbl2yRATMn8uN7GxiJSCRwfzhUbW/iKREjCO5Q2Gio2gTrO+Nh1Pg/R5hK4yjgcAD9TpF+
 SuvzIZ+wDSTwAvaXYgBtHQ0+Dd4nfznnPp9AbZc2FBxBeexJfZyPQtZDOpKgiR0cOfh28H
 iZUErZ+/yre8uV3jO7dGTuwfQNYUlrtxNThD0/vs8vxI2cV/0raSxbnpZOWEHAKj7Bq/XU
 BcM1qFr82wJYWGMzvwsPbE7BWgyutuLbfniyQ+9sLW2OzuVPEugue7h7Yn94jEs6FCInB6
 RGhGLJKNRNlxcMf+ygbx6CB8zq1HJdd+gNENsTxZQsxoyHcT+obBEtZswsLghw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kbl2yRAT
Subject: Re: [Buildroot] [PATCH v7 3/3] board/ti/am64x_sk: add new board
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

Hello,

Commit title should be:

	configs/am64x_sk: new defconfig

On Tue, 6 Dec 2022 11:17:19 -0600
Anand Gadiyar via buildroot <buildroot@buildroot.org> wrote:

> From: Xuanhao Shi <x-shi@ti.com>
> 
> Adds support for ti's am64x_sk board.
> Adds the configs for generating output sdcard image.
> Adds the defconfigs for am64x_sk.
> 
> The AM64x_sk board is designed for the AM642 SoC with
> two ARM Cortex-A53 and four ARM Cortex-R5. It also
> supports RJ 45 Ethernet, Wi-Fi, and Bluetooth.

Please use some better wording:

This commit adds a new defconfig that allows to build a minimal
Buildroot system for the A64x_sk board, which is based on the TI AM642
SoC, featuring ....


> diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/readme.txt
> new file mode 100644
> index 0000000000..8096fcb2d4
> --- /dev/null
> +++ b/board/ti/am64x_sk/readme.txt
> @@ -0,0 +1,49 @@
> +Texas Instuments AM64x SK Test and Development Board
> +
> +Description
> +===========
> +
> +These configurations will build a complete image and
> +device tree blobs for the the TI AM64x_sk board.

These configurations => This configuration

No need to have "and device tree blobs", this is implied by "complete
image".


> diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> new file mode 100644
> index 0000000000..b8ad2fb68a
> --- /dev/null
> +++ b/configs/am64x_sk_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y

Please specify explicitly the Cortex-A53 core.

Please also add:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x_sk/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0.9"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7.0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_OPTEE_OS=y
> +BR2_TARGET_OPTEE_OS_PLATFORM="k3"

Could you make the OP-TEE version explicit, so that we build a
known-working version?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
