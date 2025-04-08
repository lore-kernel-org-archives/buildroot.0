Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C69C3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 11:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F2060BFD;
	Tue,  8 Apr 2025 11:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQ5dbafeUqYa; Tue,  8 Apr 2025 11:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4BAC60B42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4BAC60B42;
	Tue,  8 Apr 2025 11:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE781DA
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9749E82C3C
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U4UUfF-aE1D for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 11:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 672BA8112A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672BA8112A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 672BA8112A
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 11:08:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B56E43291;
 Tue,  8 Apr 2025 11:08:43 +0000 (UTC)
Date: Tue, 8 Apr 2025 13:08:40 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250408130840.212f3163@booty>
In-Reply-To: <20250407152911.3790939-1-neal.frager@amd.com>
References: <20250407152911.3790939-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueevveettddtieegveegffdugeevgffgleeuleejteeggfehueeffeffkefgkeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesm
 hhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744110524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vJX97AEKGn1aKYomjIW2GSEBTnmU8YgL5R6TlU4dis=;
 b=l7PS34evR2Nm6TTr3feMWKNNRmRXvzuhjZYBCngH5hJ4sKKiQ/U0AMc7OB9nPxYDvcAu2p
 +EB85+AsQ9UUxjK9n/+GnX/hZ235T5wM1mSkp0Sf4g0pXCzjFcQ9iqFlyPm6nFbHbsthAs
 SfczoJfvRft3030JYpBiJskcNEHCrTCrb6FqK6c9b2/Fmy6tm3y+w7dqNlep1vR62vf7Qz
 S3kCt8xDUe/N8wifLgMEG6cPbxId6UXsYYdgB1iHMmXGVpQj3/ajBuzT9DHYI+TIGSKEit
 Idp4f2bEItsinBO1GUyRjyYdBFkMZqoSa+4RASI2hTIi100otS49QjA/EzjSYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l7PS34ev
Subject: Re: [Buildroot] [PATCH v2 1/3] boot/xilinx-prebuilt: add segmented
 config support
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
Cc: ibai.erkiaga-elorza@amd.com, arnout@mind.be, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 fabio.caccamo@amd.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 7 Apr 2025 16:29:09 +0100
Neal Frager <neal.frager@amd.com> wrote:

> AMD has created a new segmented configuration for Versal products.  It splits
> the Vivado hardware design into two PDI files, one containing the minimal
> required configuration for the DDR and booting the processors, and a second PDI
> file which contains the rest of the FPGA design and can be loaded at run-time
> via U-boot or Linux.
> 
> The file names generated when using the Vivado Segmented Configuration are as
> follows:
> 
> <design>_boot.pdi - Minimal DDR and PS config for booting
> <design>_pld.pdi - Remainder of FPGA design to be loaded at run-time
> 
> Since two PDI files will be included in the XSA file when using Segmented
> Configuration, the xilinx-prebuilt package needs to be updated to support
> this feature.
> 
> For Buildroot purposes, the <design>_boot.pdi is the file that needs to be
> included in the boot.bin for booting the processors, so this patch checks
> for a file named *boot*.pdi which will indicate that Segmented Configuration
> is being used and will make sure to use the <design>_boot.pdi file and not
> the <design>_pld.pdi file when generating the boot.bin image.
> 
> If no pdi files contain the word "boot" in the filename, it can be assumed
> that Segmented Configuration is not being used, so the single file *.pdi
> method is the appropriate one for this case, and this patch is thus
> backwards compatible with prior designs not using Segmented Configuration.
> 
> Also, Segmented Configuration is going to become the default mode for Versal
> products, so the xilinx-prebuilt github location will also soon have two PDI
> files for each board.  For this reason, this patch is also handling Segmented
> Configuration for files downloaded from the xilinx-prebuilt repo.
> 
> For further information about the AMD Segmented Configuration, please see the
> github tutorial below.
> 
> https://github.com/Xilinx/Vivado-Design-Tutorials/tree/2024.2/Versal/Boot_and_Config/Segmented_Configuration
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Thank you for the very good explanation, it's very helpful!

> ---
> V1->V2:
> - $(@D) is not available in time for wildcard evaluation outside of shell
>   script, so moved the wildcard functions into the install scripts
> ---
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 ++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index d0817d3cc7..448c71a3fb 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -28,9 +28,6 @@ XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
>  XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
>  
>  ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
> -# We need the *.pdi glob, because the file has different names for the
> -# different boards, but there is only one, and it has to be named
> -# vpl_gen_fixed.pdi when installed.
>  ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
>  XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
>  # Unlike the psmfw.elf file for Xilinx development boards,
> @@ -39,11 +36,33 @@ XILINX_PREBUILT_PLM = $(@D)/pdi_files/gen_files/plm.elf
>  # so to support current and future AMD Vivado versions, the filename
>  # psm*fw.elf is used.
>  XILINX_PREBUILT_PSMFW = $(@D)/pdi_files/static_files/psm*fw.elf
> -XILINX_PREBUILT_PDI = $(@D)/*.pdi
> +# We need the *.pdi glob, because the file has different names for the
> +# different boards, and it has to be named vpl_gen_fixed.pdi when installed.
> +# If Segmented Configuration is used, there will be two pdi files and we need
> +# the file that has "boot" in the filename.
> +define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
> +	$(if $(wildcard $(@D)/*boot*.pdi),

According to your commit message, a more specific wildcard can be used:
"$(@D)/*_boot.pdi".

> +		$(INSTALL) -D -m 0755 $(@D)/*boot*.pdi \
> +			$(BINARIES_DIR)/vpl_gen_fixed.pdi,
> +		$(INSTALL) -D -m 0755 $(@D)/*.pdi \
> +			$(BINARIES_DIR)/vpl_gen_fixed.pdi
> +	)

It's very unfortunate that you are adding all this code, and in two
places (here and below). The code in v1 was looking a lot nicer, but
I'm not sure there is a way to make it work. If there is none, I think
you can at least improve by using the $(if) only for the filename, not
the whole command, as in this example (untested):

define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
	$(INSTALL) -D -m 0755 \
		$(if $(wildcard $(@D)/*_boot.pdi), $(@D)/*_boot.pdi, $(@D)/*.pdi) \
		$(BINARIES_DIR)/vpl_gen_fixed.pdi
#endef

Also, do you need 0755 permissions for this file? Is that an
executable? If it isn't, that should be fixed as a preliminary patch.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
