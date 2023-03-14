Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE8CC74A44
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A814179F;
	Tue, 14 Mar 2023 08:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A814179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGyoslpmYs8p; Tue, 14 Mar 2023 08:31:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B7A41819;
	Tue, 14 Mar 2023 08:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B7A41819
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A88B81BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7819D81886
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7819D81886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzpEqUneDepT for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:31:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86C9C81871
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86C9C81871
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:31:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55C0A10000B;
 Tue, 14 Mar 2023 08:31:25 +0000 (UTC)
Date: Tue, 14 Mar 2023 09:31:24 +0100
To: Javad Rahimi <javad321javad@gmail.com>
Message-ID: <20230314093124.7aa2de8b@windsurf>
In-Reply-To: <20230301083556.2408221-1-javad321javad@gmail.com>
References: <20230301083556.2408221-1-javad321javad@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678782685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkgoAxFOzLgIu9roIbmay5ESI0/S6wfCzFFOVSLxTfY=;
 b=S3pLREQvFM24Hq4Prh1CauPQK7H5DwDTRxfJU9TGR4Tn3HhERJ40GmgFBf4CM2oiE4+buG
 ZKX/1nXKYgkcNTcZco/vk+dIKoR2gKZvlkXYqE0f/WNY5SB+z9Dz1IuBRf+koNxDuiW8ny
 /SK13mtTVvAut1Fv9DkuF0M9XkQbqhJNa/hiow8d84U+WHjq9/4NF/JTF/CZFRQOl962mf
 uDto0hb2SV7fXcDJkOGmR3UmO8KYv1D1eWhBa5yZwGNKHpehVY3QQ9ucopZkAJdgYmGUSc
 yBak01lyK9WXkBTmx+MQFPe+zmzsFmyvZEoTpumlPBtlFbwPSD8r7xcIQEAj4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S3pLREQv
Subject: Re: [Buildroot] [PATCH 1/1] configs/orangepi_pc2: add board support
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

Hello Javad,

On Wed,  1 Mar 2023 12:05:56 +0330
Javad Rahimi <javad321javad@gmail.com> wrote:

> add board support for orangepi pc2
> 
> Signed-off-by: Javad Rahimi <javad321javad@gmail.com>

Thanks for your contribution. For your reference, we used to have a
defconfig for this platform until 2022, at which point it was removed
due to it not being maintained. See the commit that removed it:

  https://gitlab.com/buildroot.org/buildroot/-/commit/eeede611f81d8f83b72e4a6671cd7d1e46b266b0

I suggest that you look at this commit to see what could possibly be
missing in your submission.

More comments below.

> ---
>  configs/orangepi_pc2_defconfig | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

We need an entry in the DEVELOPERS file corresponding to this defconfig
and any other file added by this commit.

We need a readme.txt file somewhere in board/ to document how to use
the defconfig and board. You can read other readme.txt files in board/
to get a feeling of the expected format/content.

> diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
> new file mode 100644
> index 0000000000..63ee554caf
> --- /dev/null
> +++ b/configs/orangepi_pc2_defconfig
> @@ -0,0 +1,41 @@
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

This is not needed in a minimal defconfig.

> +BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Any specific reason why mdev is needed?

> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y

Why is linux-firmware installed, but without any sub-option enabled?

> +BR2_PACKAGE_LIBNL=y

Why is this needed?

Otherwise, looks good to me. Could you look at the above issues, and
submit a new iteration?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
