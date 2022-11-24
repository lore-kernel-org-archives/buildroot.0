Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D31C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597DD8214C;
	Thu, 24 Nov 2022 21:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 597DD8214C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2nO1YgfE2c4; Thu, 24 Nov 2022 21:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9A98209A;
	Thu, 24 Nov 2022 21:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C9A98209A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 768731BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 522D58209A
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522D58209A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kj82fXsth4ER for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:57:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E04C78206A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E04C78206A
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:57:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF99A1BF204;
 Thu, 24 Nov 2022 21:57:15 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:57:14 +0100
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20221124225714.7cc1dcf4@windsurf>
In-Reply-To: <20221116025529.26935-1-peterlin@andestech.com>
References: <20221116025529.26935-1-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669327036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+Sp268ZgY67VAfhTEBqaN+frv8qtXtzgI6UJfqjuOI=;
 b=MrxyhyKWxFhVX5vgcxfxLVZp/PuAJmr7fgwC5gKVL+YlsirOWzdiRutvkoQ8d9fYQWhfxO
 bnOjKF1fJ0MwLkNy79jN7dJNmTo24qQeNlV8nnwHjd8J8QE+zu1VmXleU240q7gtN9XRr1
 1zUM06ePa16y8AKITs7UYQnwKQ09SGllWJhObJ4BO9LFnXgc2J0xeapS8J3+WRzLlIX/7j
 usBdA3pMeVRwMaRh/uYUIhLn4PZbT6a+hXKbJTac8is8JSVgX/TBLvTprzLz4XFGHuZk1T
 BgUsjasA4NBBEsKBCCvW/6sD3UQXchPj5jzJ0HP/4Zn4xSuV2zGRluwSJO6aeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MrxyhyKW
Subject: Re: [Buildroot] [PATCH v3] andes_ae350_45_defconfig: bump opensbi,
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Nov 2022 10:55:29 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> This patch bumps following packages to the newer version:
> - OpenSBI v1.1
> - U-boot v2022.10
> - Linux 6.0
> 
> Linux kernel is hosted on AndesTech Github which includes ethernet,
> SD card, DMAC, RTC, WDT drivers support. OpenSBI is based on v1.1
> with andes platfrom fdt driver.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changelog v1 -> v2
> - Add Signed-off and upstream status to U-boot patches
> - Bump U-boot to a revision that includes U-boot patch 0003 & 0004
> - Specify BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
> Changelog v2 -> v3
> - Drop unused packages
> ---
>  board/andes/ae350/ae350.dts                   | 274 ------------------
>  board/andes/ae350/genimage_sdcard.cfg         |   2 +-
>  ...isable-PIC-explicitly-for-assembling.patch |  29 --
>  ...2-Enable-cache-for-opensbi-jump-mode.patch |  25 --
>  ...001-Fix-mmc-no-partition-table-error.patch |  27 --
>  ...-Support-DTS-of-ftsdc010-driver-for-.patch |  38 +++
>  ...2-Prevent-fw_dynamic-from-relocation.patch |  27 --
>  ...-tree-blob-address-at-8-byte-boundar.patch |  42 +++
>  ...0003-Fix-u-boot-proper-booting-issue.patch |  26 --
>  ...04-Enable-printing-OpenSBI-boot-logo.patch |  25 --
>  board/andes/ae350/post-build.sh               |   2 +-
>  board/andes/ae350/readme.txt                  |   4 +-
>  .../boot/extlinux/extlinux.conf               |   2 +-
>  board/andes/ae350/uboot.config.fragment       |   6 +-
>  configs/andes_ae350_45_defconfig              |  19 +-
>  15 files changed, 98 insertions(+), 450 deletions(-)
>  delete mode 100755 board/andes/ae350/ae350.dts
>  delete mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
>  delete mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
>  create mode 100644 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
>  create mode 100644 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
