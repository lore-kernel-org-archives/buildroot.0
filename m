Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42113C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 07:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DA7607F4;
	Tue, 20 Dec 2022 07:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7DA7607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hybdqRd1cy2u; Tue, 20 Dec 2022 07:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1150E60A6A;
	Tue, 20 Dec 2022 07:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1150E60A6A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47F171BF300
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A528818C2
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A528818C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p35aKk0gBxbR for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 07:47:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A1C81463
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A1C81463
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 07:47:34 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22C416000D;
 Tue, 20 Dec 2022 07:47:31 +0000 (UTC)
Date: Tue, 20 Dec 2022 08:47:30 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221220084730.5acd395d@booty>
In-Reply-To: <20221216100044.54270-1-neal.frager@amd.com>
References: <20221216100044.54270-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1671522452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1G79OY26QTwEGNBiGp9zp0zOvlOWq5W94tULpZ6qrw4=;
 b=A1BhjXmSjqwgnEtbE7OeU7qDSAeSl8m4k/vl59M1beykje3ujgNuAHYbtV0LCjb6WXhaiZ
 KaALoN32baKY7SLe70/Sai2TfUCsy0nPO9rauD9FBvdrTN4/Obcwxot+vcfwyps99S2u+7
 Nh6ez4PNIn9BlnNplaiUmdmnRegaHQKJ+83OMsDQIxdSCQkRSvjGsTQ/87ANiIZZpo2HA7
 ftbN3Yi+1g54cGNtyE9YbpRhviGiy9VnLh6DGR4dEhSnh9YIuR7Z8gSgIdwtPVvIuZ49PP
 davmdS/j6LTAixhGrWTfu1xRng105g8kDiFMRu6n9P0NquPaDgxSTjsaA7so5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A1BhjXmS
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 use CONFIG_MULTI_DTB_FIT work around
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Fri, 16 Dec 2022 10:00:44 +0000
Neal Frager <neal.frager@amd.com> wrote:

> Change work around for kv260 u-boot.itb. Uses CONFIG_MULTI_DTB_FIT for fit-dtb.blob generation.
> Adds a delay between fit-dtb.blob generation and building the u-boot.itb due to a build issue
> when using the buildroot compiler.
> 
> This work around will eventually be replaced when Xilinx u-boot migrates to binman.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/kria/kv260/kv260.sh              |  2 +-
>  ...ile-add-delay-for-buildroot-compiler.patch | 33 +++++++++++++++++++
>  board/zynqmp/kria/uboot.fragment              |  1 +
>  configs/zynqmp_kria_kv260_defconfig           |  1 +
>  4 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch
> 
> diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
> index e891852009..e3467f3068 100755
> --- a/board/zynqmp/kria/kv260/kv260.sh
> +++ b/board/zynqmp/kria/kv260/kv260.sh
> @@ -8,5 +8,5 @@
>  
>  UBOOT_DIR=$4
>  
> -fdtoverlay -o ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
> +fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
>  ${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
> diff --git a/board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch b/board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch
> new file mode 100644
> index 0000000000..391fa861bd
> --- /dev/null
> +++ b/board/zynqmp/kria/patches/uboot/v1-0001-Makefile-add-delay-for-buildroot-compiler.patch
> @@ -0,0 +1,33 @@
> +From 582b52bef69219df678ed04771eb643117cd094a Mon Sep 17 00:00:00 2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Fri, 16 Dec 2022 08:35:41 +0000
> +Subject: [PATCH v1 1/1] Makefile: add delay for buildroot compiler
> +
> +When using the buildroot compiler, it builds the u-boot.itb immediately
> +after building the fit-dtb.blob.  This causes a build failure when using
> +the CONFIG_MULTI_DTB_FIT build configuration.  This patch forces a minimal
> +delay before building the u-boot.itb which works around the problem.
> +
> +This patch has not been submitted to u-boot mainline as it is a work around
> +and not a proper solution.
> +
> +Signed-off-by: Neal Frager <neal.frager@amd.com>
> +---
> + Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile b/Makefile
> +index b96e2ffa15..0d3e33704d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1426,6 +1426,7 @@ ifdef U_BOOT_ITS
> + u-boot.itb: u-boot-nodtb.bin \
> + 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX),dts/dt.dtb) \
> + 		$(U_BOOT_ITS) FORCE
> ++	sleep 1
> + 	$(call if_changed,mkfitimage)
> + 	$(BOARD_SIZE_CHECK)
> + endif

I didn't study the current source code to understand the issue, however
the 'sleep 1' here seems a pretty bad hack and not necessarily solving
the problem in all cases.

As Michal wrote, dependencies must be enforced via makefile rules. Any
reason this cannot be done in this situation?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
