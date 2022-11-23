Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA4BC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DEE781250;
	Wed, 23 Nov 2022 22:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DEE781250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKTie0dzqLTd; Wed, 23 Nov 2022 22:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C354E81062;
	Wed, 23 Nov 2022 22:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C354E81062
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0728C1BF316
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4F3081062
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F3081062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNpaZiqYT3QV for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:30:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3438180FA4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3438180FA4
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:30:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63876240004;
 Wed, 23 Nov 2022 22:30:22 +0000 (UTC)
Date: Wed, 23 Nov 2022 23:30:21 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221123233021.09ce037b@windsurf>
In-Reply-To: <20221123143126.17843-1-neal.frager@amd.com>
References: <20221123143126.17843-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669242622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGFVI7qi0NCpKSDt3CCRX6wRjJ6m8rp5bFRuREAISDE=;
 b=HNcK67H8TNytIz4n0HJXMCHZgay9ssDwa33OkaRjZbBPZxHE/eHVZXxQCNUUY0OP6szZN5
 nwbmWssJxh1pp3b6Dv8ttJOm1Blavvrj2BQLSahPx5NIek4UbIK2N0XUlsQHMa4qllcTxo
 /6ALRiuLge+wAieE9SZbWrbmNMyNRXfqEIVjH//lq6kznOZEp7t0s0u/BZs+FkohQT6xqe
 DkNuBTyACOjRH7lJa1iEW9IvrGFQco8gjj9PMCeVN7JTo9k/CXrzm9nX6PbF1huOu5ow1U
 Ri1x3uMYyrCUpUlC1ArGUsD+toBSmq3I+3APaQ0ZxIyy+p9JhUs+Fy9kcD2Hcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HNcK67H8
Subject: Re: [Buildroot] [PATCH v4 1/1] boot/uboot/uboot.mk: add binary
 u-boot.elf support
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
Cc: luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Wed, 23 Nov 2022 07:31:26 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> If a user requests a u-boot binary in elf format,
> they may actually want the stripped u-boot.elf version.
> This patch provides the stripped u-boot.elf binary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I've applied to next, after doing some further fixes.

>  config BR2_TARGET_UBOOT_FORMAT_ELF
> +	bool "u-boot"
> +	help
> +	  Configures the u-boot ELF file with debug symbols.

This option does not "configure", it "installs". Also, I'm not sure
having debugging symbols in u-boot is guaranteed, I suppose it depends
on whether debugging is enabled or not. So I changed this to:

+         Install the u-boot image, which is directly the ELF binary
+         for the main U-Boot, potentially with debugging symbols.

> +config BR2_TARGET_UBOOT_FORMAT_BIN_ELF
>  	bool "u-boot.elf"
> +	help
> +	  Configures the u-boot.elf binary version of ELF file.
> +	  Debug symbols are not included in this ELF file.

So I researched a bit more, and this u-boot.elf is produced when
CONFIG_REMAKE_ELF=y in U-Boot. So I changed this to:

+config BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF
        bool "u-boot.elf"
+       help
+         Install the u-boot.elf image, which is produced when
+         CONFIG_REMAKE_ELF=y. It is an ELF image (u-boot.elf)
+         produced from the raw U-Boot binary (u-boot.bin), which may
+         already have been statically relocated and may already have
+         a device-tree appended to it.

The description was taken from the CONFIG_REMAKE_ELF help text in U-Boot.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
