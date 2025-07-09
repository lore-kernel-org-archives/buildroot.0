Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247B4C83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 15:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7191407B6;
	Wed,  9 Jul 2025 15:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmdJ2oPTMZVf; Wed,  9 Jul 2025 15:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1429A407D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1429A407D7;
	Wed,  9 Jul 2025 15:09:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41D5E15F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33B3740367
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OglBerXq8Xyw for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 15:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 222D94043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222D94043A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 222D94043A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:09:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7D8243885;
 Wed,  9 Jul 2025 15:09:05 +0000 (UTC)
Date: Wed, 9 Jul 2025 17:08:40 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250709170840.347d5738@booty>
In-Reply-To: <20250617205801.2440300-1-neal.frager@amd.com>
References: <20250617205801.2440300-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeftdegueduuefhudfghffhjeegvdfgvedthfeffeekveefgfehveegudfhgefhleenucffohhmrghinhepsghinhdrsgihpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752073746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6Ddp54JTnj01DWqMO3RUFHUj8n/A4dBhktlZ8bpqvs=;
 b=mGAn+w9OYqzHT2WlhyyVnBP1z8cr1YIusykJDk0+RtgMruA3jG6xedw4bFK2Fpk1nibeh7
 TlY597woP+WpBpnxxSaVUlof0yXdiEtnQXkF6ImOzAWYQ0W6GzSCl3si3055UFHX4EFdxK
 1NXSRC/vIe/N5zWcLZALs1JC6u3yRSjenQkicvCSMQkZzSe4JdwulOHvTfDLocVWG7gjQ3
 6SUD0IpYKDhAsKE3HW+3uGEUHsC8lsBzxPJFbbN88QFw/5JlW8E0roXkoDIpbQahX5ZdIo
 MN68545FpWVGFLAxMbSeARXHgAnVcuBzujTFIYuhq7fa7+ofwxBqzrS5wUCrPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mGAn+w9O
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-embeddedsw: add family
 variant choice
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

On Tue, 17 Jun 2025 21:58:01 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a family variant choice to xilinx-embeddedsw for two reasons.
> 
> 1. It does not make sense to build a zynqmp_pmufw for a versal platform or
> versal_plm and versal_psmfw applications for a zynqmp platform.  With this
> solution, users can only select applications which are targeted for their
> device family.

I think ZynqmMP is based on Cortex-A53 and Versal on Cortex-A72, so
could the various Kconfig symbols depend on either  BR2_cortex_a53
or BR2_cortex_a72, without additional symbols?

> 2. Buildroot will soon be adding support for the versal_2ve_2vm second gen
> family. This family has a plm boot application that generates a plm.elf just
> like the current versal platform. If a user was to select both the versal_plm
> and the versal_2ve_2vm_plm, two different plm.elf files will be generated
> causing a conflict at the installation step and a run-time failure when the
> wrong plm.elf gets included in the boot.bin.  By having a family variant,
> only one plm.elf can be built at a time depending on the choice of family
> variant being "versal" or "versal_2ve_2vm".

Is this new family based on A53 or A72? If it is, clearly the above
idea won't work for the new family, so in that case see my discussion
below.

> The issue can be seen by comparing the two Makefiles which both create a
> plm.elf.
> 
> versal plm:
> https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src/versal
> 
> versal_2ve_2vm plm:
> https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm/src/versal_2ve_2vm
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/xilinx-embeddedsw/Config.in | 15 +++++++++++++++
>  configs/versal_vck190_defconfig  |  1 +
>  configs/versal_vek280_defconfig  |  1 +
>  configs/versal_vpk180_defconfig  |  1 +
>  4 files changed, 18 insertions(+)
> 
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index 0dd6433608..7af8d59929 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -28,8 +28,21 @@ config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
>  	  Release version of Xilinx/embeddedsw.
>  	  Must be xilinx_v2023.1 or newer.
>  
> +choice
> +	bool "family variant"
> +	default BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL
> +	bool "versal"
> +
> +config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP
> +	bool "zynqmp"
> +
> +endchoice

I agree about the overall idea. I'm not sure the xilinx-embeddedsw
package is the ideal place, though. We already have
BR2_TARGET_UBOOT_ZYNQMP in the u-boot options, and similar
setting might be needed in the future for other packages. Users are in
charge of configuring all those consistently, in different sub-menus.

So I wonder whether it might make sense to add a family selection in a
global place, and then have both uboot and xilinx-embeddedsw follow it.

I'm not sure where that might be added, though. The "Target options"
menu looks like the obvious place, but currently it is used only for
core-specific options, not SoC-specific ones.

Another possible place is the "Bootloaders" menu. While less ambitious,
the need for family selection is limited to bootloader-related packages.

Other opinions?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
