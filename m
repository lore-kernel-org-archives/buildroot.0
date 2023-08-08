Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD60C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFA2540908;
	Tue,  8 Aug 2023 21:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA2540908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Crt1sdbup4rV; Tue,  8 Aug 2023 21:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BAAA40917;
	Tue,  8 Aug 2023 21:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BAAA40917
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6331BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7178A60B68
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7178A60B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZ1CwniQvqr6 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:06:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AA9360BA2
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA9360BA2
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4C09FF803;
 Tue,  8 Aug 2023 21:06:10 +0000 (UTC)
Date: Tue, 8 Aug 2023 23:06:09 +0200
To: Roberto Medina <robertoxmed@gmail.com>
Message-ID: <20230808230609.0eaa80e8@windsurf>
In-Reply-To: <20230710212151.574040-2-robertoxmed@gmail.com>
References: <20230710212151.574040-1-robertoxmed@gmail.com>
 <20230710212151.574040-2-robertoxmed@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691528771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fa9JxKKcy3mlCXRVRlSIzYzc9T8YFFNBC7ELQmNn8Es=;
 b=ea/Qamel2N1GSMid+XL6DmJf4kbplWCTOwTWL6Z+IStNK+u4/UMWObl45DdSL1PeRZjmMu
 Dh/RgXG9luU263m5cDHBRlcGYXvpxBEfzc0DjgcKrVQ6GXnnYezQhaMEdpPwNmikXihqNO
 5Y1F3DN2fQhf11fUiNPhgDk5cMzj4bKUZvT016QNI9DjIZ2vqduYHGyUSOnj0OaqkzBy+p
 AEQh4HbNzOyJVcU5FGmU++kO5t+A+pme7vtZjN2UFG8KFbp7EfgX6RDMLMUEn759IW8ZrM
 IXiJwaVa/YxTfYlUKvu0M56PekVr4pfyjnrMzJEcBY9vX3JSsK4sU0GMg5ShzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ea/Qamel
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_rk3399_pc: Bring back
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

Thanks, this looks mostly good, but I have a few comments/questions.

On Mon, 10 Jul 2023 23:21:47 +0200
Roberto Medina <robertoxmed@gmail.com> wrote:

> * Uses a more recent version of TF-A which solves the building issue for
>   this board.
> * Bump on U-Boot version that was used for this configuration.
> * Some minor fixes in the post-build.sh script using `shellcheck`.
> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>  board/firefly/roc-rk3399-pc/extlinux.conf |  4 +++
>  board/firefly/roc-rk3399-pc/genimage.cfg  | 22 +++++++++++++
>  board/firefly/roc-rk3399-pc/post-build.sh |  5 +++
>  board/firefly/roc-rk3399-pc/readme.txt    | 40 +++++++++++++++++++++++
>  configs/roc_pc_rk3399_defconfig           | 38 +++++++++++++++++++++
>  5 files changed, 109 insertions(+)

Could you add an entry in the DEVELOPERS file referencing you as the
developer/maintainer for configs/roc_pc_rk3399_defconfig and
board/firefly/roc-rk3399-pc/ ?

> diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
> new file mode 100644
> index 0000000000..91574f1d61
> --- /dev/null
> +++ b/configs/roc_pc_rk3399_defconfig
> @@ -0,0 +1,38 @@
> +BR2_aarch64=y
> +BR2_cortex_a72_a53=y
> +BR2_BINUTILS_VERSION_2_40_X=y

Why are you forcing binutils 2.40 here? Any reason? This is why I
didn't apply, because I don't understand if there's a solid reason for
you to do that.

> +BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
> +BR2_LINUX_KERNEL=y

You need to set a fixed version of the Linux kernel.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="240M"

Why this custom size rather than leaving the default?

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9.0"

Could you use v2.9 instead? It's pointing to the same commit, but it
will make sure that our patch
boot/arm-trusted-firmware/v2.9/0001-build-tools-avoid-unnecessary-link.patch
gets applied.

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
> +BR2_TARGET_UBOOT=y

You need to set a fixed version of U-Boot.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Not sure here why BR2_PACKAGE_HOST_UBOOT_TOOLS=y is needed?

Could you rework your patch to address those small aspects and send an
updated version?

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
