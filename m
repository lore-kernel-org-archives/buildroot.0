Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE08C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 12:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BAC407F3;
	Wed, 18 Jun 2025 12:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iiMmiZQDFHg; Wed, 18 Jun 2025 12:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D3E540721
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D3E540721;
	Wed, 18 Jun 2025 12:11:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A68F151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BEE880F49
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icAkXWF2foUd for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 12:11:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 466FA80ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466FA80ED6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 466FA80ED6
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 12:11:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27F7243859;
 Wed, 18 Jun 2025 12:11:11 +0000 (UTC)
Date: Wed, 18 Jun 2025 14:11:09 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250618141109.3dff0c99@booty>
In-Reply-To: <20250617141534.2074877-2-neal.frager@amd.com>
References: <20250617141534.2074877-1-neal.frager@amd.com>
 <20250617141534.2074877-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtt
 hhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750248671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoOt05x38IwWixn0kWSkc+792eFgua26yaKnITsRQtA=;
 b=EZM0fTOhSPtcNcSdlUmunaSvn13S1cpLLjhBIyNQdyiz68f3hl33sJ6Jgic1t0+cxwwZYX
 RH37yzBptrduGryBHxRNTuECQ8q1XA4ZSFbPJZfrumk8B3ieCe88WNWPBtfmKfV4AeByNk
 ClfQcEzIIiV6P7aG15bgirTyWVcw1oE36+C6eNzXSVKaqIEP0kKVCvg2YNIkCUovhFriAN
 otp0dUzwUrNLOfX3PK2ZtsoVA88PxtWaL+l9iibf8GWgrDU6BJVTm3GrVSkqJYhCIthzgD
 Kv9vXA+1+FoJn8R+gJOExSZmpS0IOVWeNYBYBOJ2X/PhqnvFgTze9akj+qNp7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EZM0fTOh
Subject: Re: [Buildroot] [PATCH v2 2/2] board/zynqmp: add custom board
 documentation
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 Jun 2025 15:15:34 +0100
Neal Frager <neal.frager@amd.com> wrote:

> The readme.txt file for zynqmp boards does not have documentation for working
> with custom boards.  This patch adds documentation for custom board support.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - correct copy paste error as the output directory of step 3 should be:
>     output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/
>   and not:
>     output/build/uboot-custom/board/xilinx/zynq/custom_hw_platform/
> ---
>  board/zynqmp/readme.txt | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
> index 3f1b3a80c2..a98ff78f6f 100644
> --- a/board/zynqmp/readme.txt
> +++ b/board/zynqmp/readme.txt
> @@ -65,6 +65,47 @@ Where 'sdX' is the device node of the SD.
>  
>  Eject the SD card, insert it in the board, and power it up.
>  
> +Support for other boards:
> +=========================
> +
> +If you want to build a system for other boards based on the same SoC, and the
> +board is already supported by the upstream kernel and U-Boot, you simply need
> +to change the following Buildroot options:
> +
> + - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
> + - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
> +
> +Custom psu_init_gpl.c/h support:
> +
> +To generate a working boot.bin image, psu_init_gpl.c/h are required in
> +the U-Boot source tree. Without those files, boot.bin will be built
> +successfully but it will not be functional at all. Those files are
> +output from the Xilinx tools, but for convenience, U-Boot includes the
> +default psu_init_gpl.c/h of popular boards. Those files may need to be
> +updated for any programmable logic or DDR customizations which impact
> +psu_init (clock/pin setup & mapping/AXI bridge setup/etc). See
> +board/xilinx/zynqmp/ directory of U-Boot for natively supported psu_init
> +files. If the psu_init files for your board are not found in U-Boot,
> +you need to add them by yourself.
> +
> +1) Start with a defconfig supported by Buildroot (e.g. ZCU106)
> +    make zynqmp_zcu106_defconfig
> +
> +2) make uboot-menuconfig
> +    Visit the following menu and enable CONFIG_XILINX_PS_INIT_FILE
> +
> +    ARM architecture  --->
> +       [*] Zynq/ZynqMP PS init file(s) location

CONFIG_XILINX_PS_INIT_FILE is a string, not a bool. But this might be
irrelevant, see below.

> +3) Copy psu_init_gpl.c/h generated by the Xilinx Vivado tools into
> +   output/build/uboot-custom/board/xilinx/zynqmp/custom_hw_platform/

Ain't this automated in Buildroot by
BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE? There should be no manual step
needed. Am I missing something?

> +4) make
> +
> +Note: The files in step 3 will need to be re-copied after cleaning the
> +output directory and at this time, there is no way to save them as
> +part of the buildroot configuration, except as a U-Boot patch.

If such manual step were needed, that would be a huge hole in Buildroot
that needs to be fixed.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
