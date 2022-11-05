Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2B9C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25DF408BD;
	Sat,  5 Nov 2022 21:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25DF408BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6NQpSqz6VvY; Sat,  5 Nov 2022 21:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F3040877;
	Sat,  5 Nov 2022 21:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74F3040877
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0201BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 672E060899
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 672E060899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPTIwVMlssUM for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:08:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D902260888
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D902260888
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:08:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9DFC5C0003;
 Sat,  5 Nov 2022 21:08:36 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:08:35 +0100
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20221105220835.1e1fa5f0@windsurf>
In-Reply-To: <20221104080407.25870-1-peterlin@andestech.com>
References: <20221104080407.25870-1-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667682517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUk7n5X82wNMu4PFeAJnS5lFN4piStPmbeirRVqR3sw=;
 b=TvIGpJDa0+b08ApAqBhenJ1V5caMSBDer++cMJ/vVAGdv3AAx+u8AkFIeJNVRNfq71MAVs
 ahw6Jqs2dFHTQjTtfBY4vnoVfGLFXi4nN9uD+8nZATBnKPwOlc5Fv+IOuZUZCED0yu2kGS
 mV2MNn0hFnxhYNlkAy+wZ9Tajhu18HNWMCP/V4v/3rjlTU/x2kI2IvpbY/pxCSFahBHj3z
 pWO8+hxgrSRNNGfOSdPaYXvQFUh9D1g8ll3pYJams6zNV6g4OCYGaFh7K/cIfn+7VUPUBW
 fuo81kOIOzwctJFDBdogP38vXSf22T3OqWwg6apSfDb4Pmp7RH86+bloabxFxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TvIGpJDa
Subject: Re: [Buildroot] [PATCH 1/1] andes_ae350_45_defconfig: bump opensbi,
 u-boot and linux
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
Cc: tim609@andestech.com, ycliang@andestech.com, dylan@andestech.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 4 Nov 2022 16:04:07 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> This patch bumps following packages to the newer version:
> - OpenSBI v1.1
> - U-boot v2022.10
> - Linux 6.0
> 
> Linux kernel is hosted on AndesTech Github which includes ethernet,
> SD card, DMAC, RTC, WDT drivers support. OpenSBI is based on v1.1
> with andes platfrom fdt driver, hence adding patches for U-boot to
> update the plmt and plicsw compatible strings and modify the IPI scheme.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>  board/andes/ae350/ae350.dts                   | 274 ------------------
>  board/andes/ae350/genimage_sdcard.cfg         |   2 +-
>  ...isable-PIC-explicitly-for-assembling.patch |  29 --
>  ...2-Enable-cache-for-opensbi-jump-mode.patch |  25 --
>  ...001-Fix-mmc-no-partition-table-error.patch |  27 --
>  ...-Support-DTS-of-ftsdc010-driver-for-.patch |  35 +++
>  ...2-Prevent-fw_dynamic-from-relocation.patch |  27 --
>  ...-tree-blob-address-at-8-byte-boundar.patch |  37 +++
>  ...0003-Fix-u-boot-proper-booting-issue.patch |  26 --
>  ...andes_plic.c-use-modified-IPI-scheme.patch |  43 +++
>  ...04-Enable-printing-OpenSBI-boot-logo.patch |  25 --
>  ...04-riscv-Rename-Andes-PLIC-to-PLICSW.patch | 263 +++++++++++++++++
>  board/andes/ae350/post-build.sh               |   2 +-
>  board/andes/ae350/readme.txt                  |   4 +-
>  .../boot/extlinux/extlinux.conf               |   2 +-
>  board/andes/ae350/uboot.config.fragment       |   6 +-
>  configs/andes_ae350_45_defconfig              |  16 +-
>  17 files changed, 394 insertions(+), 449 deletions(-)
>  delete mode 100755 board/andes/ae350/ae350.dts
>  delete mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
>  delete mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
>  create mode 100644 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
>  create mode 100644 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
>  create mode 100644 board/andes/ae350/patches/uboot/0003-riscv-andes_plic.c-use-modified-IPI-scheme.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
>  create mode 100644 board/andes/ae350/patches/uboot/0004-riscv-Rename-Andes-PLIC-to-PLICSW.patch

It looks mostly good. Could you however:

 (1) Add your Signed-off-by inside each of the U-Boot patches you are
 introducing, as well as provide a link to where the patches were
 downloaded from?

 (2) Remove the numbering in the U-Boot patch titles. I.e instead of
 [PATCH 1/2], we want to see [PATCH]. Use "git format-patch -N" to not
 have this numbering.

 (3) Keep the correct BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_xxyz=y
 option in the defconfig?

With these changes, your patch will be ready to be applied.

Also, are those U-Boot changes going to be accepted in upstream U-Boot?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
