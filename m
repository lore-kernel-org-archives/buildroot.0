Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C65C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 08:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F44840CE2;
	Fri, 16 May 2025 08:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5KsbZ8xkSPi; Fri, 16 May 2025 08:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4FD40CBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4FD40CBA;
	Fri, 16 May 2025 08:13:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 074AC1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC9FF82993
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYF7z-4Sfvxy for <buildroot@buildroot.org>;
 Fri, 16 May 2025 08:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5029680EE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5029680EE8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5029680EE8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:13:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2F5A43349;
 Fri, 16 May 2025 08:13:26 +0000 (UTC)
Date: Fri, 16 May 2025 10:13:25 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250516101325.587ab846@booty>
In-Reply-To: <20250409110455.3850790-1-neal.frager@amd.com>
References: <20250409110455.3850790-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueevveettddtieegveegffdugeevgffgleeuleejteeggfehueeffeffkefgkeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesm
 hhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747383208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TUE5IeCMO/EoXpA1+5CBZSYn/0dqOmEWhuxVrtEKgZw=;
 b=jAgklhNUCquGYunNbDQZ1NO0GgWGoB49QBqozX3DLW7/LztdTxFkJ2DKMC+wzRP41T8+GI
 tuK9ZEhFA5plr/MsSIjQodvxfCRHI5nrm2hphl1mMkbsobCUxlUhE+IZW6DdLmo9vgOZb/
 ah1JnQD1+z29mcrAHaXz4U3dfwEXLptdEt3i8Z4drHgWLBiSM1pA0i8MzFlwUDt0xRvQY/
 O2DeB9O2XlEQsBddbsj7b80ah6pp9RvOIn/DaHrNlLWwT7DQAIVJo5I+XnVNxtcLoCtWh/
 kbU9JdoV7TQp3G6BPR9z0OHqbNOGlsAIxQ9GTDv0LJdcjtHJWDWV+d3D02ymBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jAgklhNU
Subject: Re: [Buildroot] [PATCH v3 1/3] boot/xilinx-prebuilt: add segmented
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

On Wed, 9 Apr 2025 12:04:53 +0100
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
> ---
> V1->V2:
> - $(@D) is not available in time for wildcard evaluation outside of shell
>   script, so moved the wildcard functions into the install scripts
> V2->V3:
> - Moved if statement inside of $(INSTALL) commands to make the code easier
>   to read.
> - Changed wildcards to more specific name "*_boot.pdi".
> - Changed pdi file permissions to 0644.
> ---
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 36 ++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index d0817d3cc7..4d1dfc5ca0 100644
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
> +# the file that has "_boot.pdi" in the filename.
> +define XILINX_PREBUILT_INSTALL_VERSAL_XSA_BOOT_PDI
> +	$(INSTALL) -D -m 0644 \

I still think fixing the permissions from 755 to 644 should have been a
separate, initial patch, because it is a fix. This would allow for
example to cherry-pick the fix on a stable branch, without adding the
new feature.

If maintainers are OK with this patch as is, I'm OK to apply it because
the "bug" probably does not create practical issues. But if you send a
v4 please split it.

Otherwise looks good:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
