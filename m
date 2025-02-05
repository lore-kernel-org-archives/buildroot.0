Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44703C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E796483AAE;
	Wed,  5 Feb 2025 11:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgXT_mVtQN0w; Wed,  5 Feb 2025 11:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C98DB83299
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98DB83299;
	Wed,  5 Feb 2025 11:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E23512A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE2A04180D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxOa4qXu4yoJ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A1BD41863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1BD41863
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A1BD41863
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:26:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D377343426;
 Wed,  5 Feb 2025 11:26:09 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:26:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205122609.054fe9bd@windsurf>
In-Reply-To: <20241219053053.2389046-11-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-11-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefkeevffduvdeivdefieffueehiefhheefueekvefgjeethedufeegheejfedtheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhtgihtrdhinhdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738754770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+m1411+REMNP/fAOdoCamysUTrul7x7PSSM5SCBYKHw=;
 b=aunZjePG+qd8VVXDutg0+sUdo2Ia3xFIZ7qZrhx4tnGJg4WoRQoRI1TBBkOvtiEcCSy8Ml
 UFA+q0jo0Un24Lex9uTWuwJmFYIwNBIG+2VLVDDzTkbVXTXwow3ShTxe5gK50V/2bWuHPm
 9xc8LNfGiEE8zBcUWEM/OobI5xHW67GojQ4yyBUfWS34Rq7BDZPTLq5S8GyOBBrGOHUp/p
 XIeNz+93xuK7ZHbFT/XIoDXqXE5x7z65bwtLOr2AWEDQ5R6ERsskVZQPlp1RF/FQKP/2If
 QKlGgBg22xeZ+ojiblH7/4RMbDhC67fINdrJ1ukEStgy/BgrsyNX+rRuiiOhyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aunZjePG
Subject: Re: [Buildroot] [RFC v2 10/14] configs: add hexagon QEMU config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brian,

On Wed, 18 Dec 2024 21:30:49 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>

Nice to see that there is Qemu support! Is this supported in upstream
Qemu?

> diff --git a/configs/qcom_dsp_qemu_defconfig b/configs/qcom_dsp_qemu_defconfig
> new file mode 100644
> index 0000000000..cc9b7157ad
> --- /dev/null
> +++ b/configs/qcom_dsp_qemu_defconfig
> @@ -0,0 +1,44 @@
> +BR2_hexagon=y
> +BR2_HEXAGON_v73=y
> +BR2_STATIC_LIBS=y

This is changed in a follow-up patch, which isn't good, please use the
correct setting from the start.

> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y

Why don't you use the toolchain-external-hexagon package here?

> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

We really want to use the default for this.

> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_ZLIB=y
> +BR2_PACKAGE_LOCKDEV=n
> +BR2_PACKAGE_LIBEVENT=n
> +BR2_PACKAGE_ATFTP=n
> +BR2_PACKAGE_DROPBEAR=y
> +BR2_PACKAGE_LSH=y
> +
> +BR2_PACKAGE_BASH=y
> +BR2_PACKAGE_ZSH=y
> +
> +BR2_PACKAGE_LIQUID_DSP=y
> +BR2_PACKAGE_GNURADIO_FFT=y
> +
> +BR2_PACKAGE_XINETD=n
> +BR2_PACKAGE_COREUTILS=y
> +BR2_PACKAGE_HEXAGONMVM=y

Please remove all of this custom package selection, except
BR2_PACKAGE_HEXAGONMVM=y maybe if it's really needed for the platform
to boot.

> +BR2_TARGET_ROOTFS_TAR_GZIP=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="bcain/boot_qemu_v6.11"

Is this a branch or a target? We don't want to use a branch.

> +BR2_LINUX_KERNEL_DEFCONFIG="qemu"
> +

Also, please add a board/qemu/ directory for this configuration, with a
readme.txt. In particular, the readme.txt should include the exact Qemu
command line to use to boot the system.


> diff --git a/linux/linux.hash b/linux/linux.hash
> index ccf6235166..3c5eaea676 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -9,6 +9,7 @@ sha256  0d0ffae5bf0e6f9c6a1ce42da2bc2a8696ca55721c103497eb1245be8cc04b20  linux-
>  # Locally computed
>  sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
>  sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
> +sha256  a97a6fdc814b57b15107139978369d4efd1474142911e8f76b050874cc9ee3e4  linux-bcain_boot_qemu_v6.11-git4.tar.gz

Nope, you cannot "pollute" linux/linux.hash with your custom hash. Look
at other defconfigs, they use BR2_GLOBAL_PATCH_DIRECTORY to provide
additional hash files.

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
