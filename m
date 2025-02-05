Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC997C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 800CB83ADC;
	Wed,  5 Feb 2025 11:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ib2zppgffTU; Wed,  5 Feb 2025 11:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB8883ADF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB8883ADF;
	Wed,  5 Feb 2025 11:28:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25EFA12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15E966106C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lr7bQn-0s8Ri for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C557B6104B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C557B6104B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C557B6104B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:28:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E30244340D;
 Wed,  5 Feb 2025 11:28:33 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:28:33 +0100
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205122833.42eb7818@windsurf>
In-Reply-To: <20241219053053.2389046-10-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-10-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuteffkeetveduteejgeffiedvvdfgudehtdegvedtffegffdugedthefgjeekgeenucffohhmrghinheptghouggvlhhinhgrrhhordhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738754914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+C1Zonm63d4yLnge+GDeDq/vwZHzWf4larSx68w56wE=;
 b=TmXdJZLOT3SO2uGTWEkT3Ct940kIvAee67EI/gd70Oax6VpjW87H+WsmWA0e0hBvAFFrvN
 SiHsD8pVnfcZKwDoni6GB7MtOSk4oqlESWiHHQnirZpvwN3oMkRMdWU5yQsE3oZlFZthcv
 6Dq/zCYk34/CMx7DfDrVRgq4cRXTpc9+ag93wE+IuHIkACw33Axo8u25kQi1noSXeNv8CY
 TGkbkX7Jrjg3w915l8Rs/fQm+Q46WeEQeH/ajixnWydjjqBc8xtJs5/O4cG2Z/EpjSXpyt
 STW4a0mBrAIaXGhPhCT6lABrvs9q0422BW0Aem+Seir6DpzbPn0d4OuhZFlkvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TmXdJZLO
Subject: Re: [Buildroot] [RFC v2 09/14] board/qcom/sa8775: add support for
 qcom sa8775-cdsp0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brian,

On Wed, 18 Dec 2024 21:30:48 -0800
Brian Cain <brian.cain@oss.qualcomm.com> wrote:

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>

Needs a non-empty commit log with some details about what this platform
is.

> diff --git a/board/qcom/sa8775/post_build.sh b/board/qcom/sa8775/post_build.sh
> new file mode 100755
> index 0000000000..af13225d58
> --- /dev/null
> +++ b/board/qcom/sa8775/post_build.sh
> @@ -0,0 +1,9 @@
> +#!/bin/bash
> +
> +TARGETDIR=$1

Not needed, just use ${TARGET_DIR} which is passed in the environment.

> +
> +cat <<EOF >> "${TARGETDIR}/etc/fstab"
> +devpts   /dev/pts              devpts  gid=5,mode=620  0 0
> +/dev/vda /mnt/persist ext2 defaults 0 0
> +debugfs  /sys/kernel/debug      debugfs  defaults  0 2
> +EOF

Why is this needed in the first place?

Also, the way you do it (always appending) means that if you run "make;
make; make" in Buildroot, you will have those 3 lines added 3 times,
which isn't good.

> diff --git a/configs/qcom_sa8775_cdsp0_defconfig b/configs/qcom_sa8775_cdsp0_defconfig
> new file mode 100644
> index 0000000000..f9363c930f
> --- /dev/null
> +++ b/configs/qcom_sa8775_cdsp0_defconfig
> @@ -0,0 +1,35 @@
> +BR2_hexagon=y
> +BR2_HEXAGON_v73=y
> +BR2_STATIC_LIBS=y

You can't use shared libraries?

> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y

Use the toolchain-external-hexagon package.

> +BR2_TOOLCHAIN_EXTERNAL_CLANG=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://artifacts.codelinaro.org/artifactory/codelinaro-toolchain-for-hexagon/19.1.5/clang+llvm-19.1.5-cross-hexagon-unknown-linux-musl.tar.zst"
> +BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH="x86_64-linux-gnu/bin"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="hexagon-unknown-linux-musl"
> +BR2_TOOLCHAIN_EXTERNAL_CLANG_19_0=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_7=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

Use the default for /dev management.

> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/qcom/sa8775/post_build.sh"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_ZLIB=y
> +BR2_PACKAGE_LOCKDEV=n
> +BR2_PACKAGE_LIBEVENT=n
> +BR2_PACKAGE_ATFTP=n
> +BR2_PACKAGE_DROPBEAR=y
> +BR2_PACKAGE_LSH=y
> +
> +BR2_PACKAGE_LUA=y
> +BR2_PACKAGE_BASH=y
> +BR2_PACKAGE_ZSH=y
> +
> +BR2_PACKAGE_HEXAGONMVM=y
> +BR2_PACKAGE_XINETD=n
> +BR2_PACKAGE_COREUTILS=y

Keep the default package selection.

> +BR2_TARGET_ROOTFS_TAR_GZIP=y

How is the rootfs then used?

All defconfigs must have a matching readme.txt file somewhere in board/
that explains how to practically use, and most notably how to make use
of the build results.

Also, make sure to update the DEVELOPERS file as part of this patch for
the newly added files.

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
