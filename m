Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD5DE77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED83041D99;
	Sat, 30 Sep 2023 15:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED83041D99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIYDwviMcIe2; Sat, 30 Sep 2023 15:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C766B41B41;
	Sat, 30 Sep 2023 15:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C766B41B41
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABE101BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5298C40B22
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5298C40B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oy896C9VQv4h for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:58:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE4614017A
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE4614017A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 792CEFF805;
 Sat, 30 Sep 2023 15:58:21 +0000 (UTC)
Date: Sat, 30 Sep 2023 17:58:20 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20230930175820.7b6b64bf@windsurf>
In-Reply-To: <20230921215633.34828-3-brandon.maier@collins.com>
References: <20230921215633.34828-1-brandon.maier@collins.com>
 <20230921215633.34828-3-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696089502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gN3qPClCv6skNKnaiQOvVo3Qnajgojq+b7AIUpm7rIE=;
 b=SIKBRHDquMgji/CpzY5YlcuZ39ZdNAqff05wivXWdlePWFLLpelbM2nNnUM9TY6/lyw3Fd
 M/6NJiKqE3HIJhPLmFWRLVuRMvRI7Fyd5SELqur6wWgr3O+WzYX1piYzyx8c4FcwlK1/KD
 PdIhjgsivdncmiU0rkN1Xs2nM0Ha+B9tSfKtYNxVWk2mAORkSlTpCM/LEOhiQ6jqcLNf0S
 Y8u77ucB7p6mK13J5WEhJZKOcR9GXPmaNKIEa3m49ciobtfWT8AsHDpGEwuRYaABk79pKG
 ioWKj2EOVN/elEIv0RzR4sVSNZXmT+K/jbXvxSzP+rpgZR3tApT/Hex+FP4cRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SIKBRHDq
Subject: Re: [Buildroot] [PATCH 3/4] package/qoriq-fm-ucode: add package for
 QorIQ FMan microcode
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
Cc: Maeva Manuel <maeva.manuel@oss.nxp.com>,
 Gilles Talis <gilles.talis@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Sep 2023 21:56:32 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> This package provides firmware needed for the LS1046A-FRWY Ethernet.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Applied after doing a few changes. First, changed the commit title to
"package/qoriq-fm-ucode: new package".

> diff --git a/package/qoriq-fm-ucode/Config.in b/package/qoriq-fm-ucode/Config.in
> new file mode 100644
> index 0000000000..224e7fde32
> --- /dev/null
> +++ b/package/qoriq-fm-ucode/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_QORIQ_FM_UCODE
> +	bool "qoriq-fm-ucode"
> +	help
> +	  These are the microcode families of the Frame Manager hardware
> +	  block in QorIQ products. Specific platforms require specific
> +	  binaries, and those also have to further match specific
> +	  software versions (Frame Manager Driver -- FMD).
> +
> +	  https://github.com/nxp-qoriq/qoriq-fm-ucode
> +
> +if BR2_PACKAGE_QORIQ_FM_UCODE
> +
> +config BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM
> +	string "Platform"

Added a:

	default "ls1046"

just to make sure that our autobuilders that generate random
configurations will have a valid configuration by default.

> +QORIQ_FM_UCODE_VERSION = LSDK-21.08
> +QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
> +QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
> +QORIQ_FM_UCODE_LICENSE_FILES = NXP-Binary-EULA.txt
> +QORIQ_FM_UCODE_REDISTRIBUTE = NO

This was not correct: this package *is* redistributable.

> +QORIQ_FM_UCODE_INSTALL_IMAGES = YES
> +QORIQ_FM_UCODE_INSTALL_TARGET = NO
> +
> +define QORIQ_FM_UCODE_INSTALL_IMAGES_CMDS
> +	cp $(@D)/fsl_fman_ucode_$(BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM)*.bin \

Modified a bit to qstrip the $(BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM)
variable.

As said above: applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
