Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1058C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 16:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2507660AC0;
	Wed,  2 Nov 2022 16:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2507660AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RU7mXsfAVDV; Wed,  2 Nov 2022 16:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BA860758;
	Wed,  2 Nov 2022 16:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BA860758
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 811B51BF307
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51B1D4023D
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B1D4023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ssDDi1enb0Vi for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 16:38:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB57540204
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB57540204
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 16:38:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA0B3240004;
 Wed,  2 Nov 2022 16:38:42 +0000 (UTC)
Date: Wed, 2 Nov 2022 17:38:41 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221102173841.51cb9d06@windsurf>
In-Reply-To: <20221024142216.31273-2-neal.frager@amd.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
 <20221024142216.31273-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667407124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cr3ZIl/zAH/JxnVpBrd8tGI0hulWn+iP4N9yTNRE9lY=;
 b=Dril5VZFJnnf23zH/pALAeiqrvrEJxeaOCi1t6zvCx5fUDE0vJZholjlkjnnV0l02F8wTU
 Mb+9e8fYtmx/H5HNpzkD7cA8akSVcx7JH2HwKEnjIHwtyakWtZUJYQESTdo1Q4zcr42sR2
 XP1gB7wnsz8tGXX1Gg4TuZ0sjHXw6chAxPuPfy5WHCP+B74vqokQx++HQzBzaKbojQvUa1
 Sl6c16W0bMj55a3spvQ5mG/+Huk20KUor7j5wTce1ZHbnNFzohxfFynUp9FtdGHFYXbUIh
 Px+kkHokhN+K4PKJpF4kmWJ09iJVs7vdg9g9uJkEDeRIc/Ppa5gtEgJsd8v25g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dril5VZF
Subject: Re: [Buildroot] [PATCH v1 2/3] add board/versal
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

Please note that this is not a full review. Just some comments.

This PATCH 2/3 should be squashed with PATCH 3/3 into a single patch,
whose commit title should be:

	configs/versal_vck190: new defconfig

More comments below.

On Mon, 24 Oct 2022 08:22:15 -0600
Neal Frager <neal.frager@amd.com> wrote:


> diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
> new file mode 100755
> index 0000000000..0713bd1b05
> --- /dev/null
> +++ b/board/versal/post-build.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +# genimage will need to find the extlinux.conf
> +# in the binaries directory
> +
> +BOARD_DIR="$(dirname $0)"
> +CONSOLE=$2
> +ROOT=$3
> +
> +mkdir -p "${BINARIES_DIR}"
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +	label linux
> +	  kernel /Image
> +	  devicetree /system.dtb
> +	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
> +	__HEADER_EOF

Meeh, I don't know if I like being that smart. What about having an
extlinux.conf file per board, and simplify this? Sometimes dumb is
better than smart/complicated.


> diff --git a/board/versal/vck190/uboot.fragment b/board/versal/vck190/uboot.fragment
> new file mode 100644
> index 0000000000..961c4239bd
> --- /dev/null
> +++ b/board/versal/vck190/uboot.fragment
> @@ -0,0 +1 @@
> +CONFIG_DEFAULT_DEVICE_TREE="versal-vck190-rev1.1"

This can be removed in favor of passing DEVICE_TREE=... in
BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
