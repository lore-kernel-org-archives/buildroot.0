Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05559C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 20:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BF06408C7;
	Tue,  8 Aug 2023 20:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BF06408C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9ZrwfHe1lKp; Tue,  8 Aug 2023 20:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A6FC4089D;
	Tue,  8 Aug 2023 20:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6FC4089D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85FD71BF25F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57FEE813BD
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57FEE813BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OOj1XiZOMKCO for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 20:59:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CA58813A1
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CA58813A1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B23F1BF203;
 Tue,  8 Aug 2023 20:59:08 +0000 (UTC)
Date: Tue, 8 Aug 2023 22:59:07 +0200
To: Ludwig Kormann <ludwig.kormann@ict42.de>
Message-ID: <20230808225907.7afe6748@windsurf>
In-Reply-To: <20230628095825.905451-1-ludwig.kormann@ict42.de>
References: <20230628095825.905451-1-ludwig.kormann@ict42.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691528349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RDMruM2Unj6A5nS/DHatumo+TalGEoU+uSxHwwOPyU=;
 b=LEvF9D+y1jEaSbb2UyL2CVwWPRT/GWCCAA6FYfMX+hDOl8VPAk15N+RzF4Z/N/NlCBgUkW
 XrzSoNIDrPkOcaoUMMXUHlGrdrLWPjuY6bWOEO4Qs83U7Cquw6efsJ3TGEEbk1GQfLRDBX
 dAVl5Vnm2cEe4rfcwAHbDbHfPFsyQjmOx5v0lEz3+VfyPskFjq3jFguZ4L6+F9S5Gr/vet
 AzT66zqe4nz8R3Hz40InlNpL89v+3SgrpsSeTPpqfGtTJtuTTG4jPEyKIxpafxx+fCQWmc
 Y7RbveW9HDVrvpcWPllfEvdoRxsJzJb9G7XlnMHi/QZfVGU7pz4CiFsSgCdT0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LEvF9D+y
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/icnova-a20-adb4006: new
 defconfig
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

Hello Ludwig,

Thanks for your contribution!

On Wed, 28 Jun 2023 11:58:25 +0200
Ludwig Kormann <ludwig.kormann@ict42.de> wrote:

> Add a defconfig for ICnova A20 SomPi compute module on ADB4006
> development board with Allwinner A20 chip and 512MB/1GB RAM.
> 
> Board support package includes the following components:
> - mainline Linux kernel 6.1.35
> - mainline U-Boot 2023.04
> - custom dts & uboot defconfig
> - default packages from buildoot
> 
> https://wiki.in-circuit.de/index.php5?title=ICnova_ADB4006
> https://wiki.in-circuit.de/index.php5?title=ICnova_A20_SODIMM
> 
> changes in v2:
> - rebase on 2023.05
> - get dts reviewed on the linux mailing list and
> scheduled for kernel 6.5 [1]
> - uboot defconfig upstreaming in progress [2]

Changes between v1 and v2 have to go after the --- sign that follows
your Signed-off-by line. Indeed, we don't want such "changelog" to stay
forever in the commit log preserved in git history. However, the fact
that your board support was upstreamed in Linux and submitted to U-Boot
should have definitely been part of the commit log so I fixed that up.

> diff --git a/board/in-circuit/icnova-a20-adb4006/post-image.sh b/board/in-circuit/icnova-a20-adb4006/post-image.sh
> new file mode 100755
> index 0000000000..9cca1b1789
> --- /dev/null
> +++ b/board/in-circuit/icnova-a20-adb4006/post-image.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?

As suggested by Kilian, I dropped this and used
support/scripts/genimage.sh instead.

Applied to next with those changes. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
