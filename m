Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34666EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 07:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7046B817B3;
	Tue,  1 Aug 2023 07:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7046B817B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylHXKeL-HFcf; Tue,  1 Aug 2023 07:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E8C381266;
	Tue,  1 Aug 2023 07:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E8C381266
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 565DC1BF318
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 07:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEF0540134
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 07:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEF0540134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lenDgWeiXLS for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 07:03:36 +0000 (UTC)
X-Greylist: delayed 67930 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Aug 2023 07:03:36 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B7E34034B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B7E34034B
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 07:03:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81D731BF20F;
 Tue,  1 Aug 2023 07:03:27 +0000 (UTC)
Date: Tue, 1 Aug 2023 09:03:26 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230801090326.7f95eb85@booty>
In-Reply-To: <20230724103508.772579-1-neal.frager@amd.com>
References: <20230724103508.772579-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690873413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgSq4PRz23HYiW8g143l77rRLsXU5PBRmqiV/Zf4GxY=;
 b=LUmk8d4+8Lx9L6rbGEfAaAXOcnx3QxfO8l7toXBcEvacX5EZR90wJRbA9nY2tQccmIlMzF
 F3JSEeO5U+nR6nYXq9GsXW8RhhN/57HCqn9Out7QqmVwa9Tx3PVDLASF39iUgtkMKZbvdP
 I71xCEI2c/D7TPqfrEF+ZMA2DwqA9RaEVSZ88B9D7cmSvpkbabX+EMZk87klcJketAH1Qv
 djgYeY41IKuQm6D6mxdYEIxt+ZKRbJ7WKa0cdwUiTLgmj7FP2lFdN5Z97hafavxDfqns5f
 60v4v4012YFeYtlzB9pCOzWiwjYlOXzOKAr0eH7a0dKGwsj3KipCXtFLzMsVqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LUmk8d4+
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: merge post scripts
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon, 24 Jul 2023 11:35:08 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch merges the zynqmp post scripts as only one script is needed.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/post-build.sh          | 15 ---------------
>  board/zynqmp/post-image.sh          | 13 +++++++++++++
>  configs/zynqmp_kria_kv260_defconfig |  2 +-
>  configs/zynqmp_zcu102_defconfig     |  1 -
>  configs/zynqmp_zcu106_defconfig     |  1 -
>  5 files changed, 14 insertions(+), 18 deletions(-)
>  delete mode 100755 board/zynqmp/post-build.sh
> 
> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
> deleted file mode 100755
> index 747991e3f1..0000000000
> --- a/board/zynqmp/post-build.sh
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -#!/bin/sh
> -
> -# genimage will need to find the extlinux.conf
> -# in the binaries directory
> -
> -CONSOLE="$2"
> -ROOT="$3"
> -
> -mkdir -p "${BINARIES_DIR}"
> -cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> -	label linux
> -	  kernel /Image
> -	  devicetree /system.dtb
> -	  append console="${CONSOLE}" root="/dev/${ROOT}" rw rootwait
> -	__HEADER_EOF
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..4da8a64940 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -12,4 +12,17 @@ FIRST_DT=$(sed -nr \
>  
>  BOARD_DIR="$(dirname "$0")"
>  
> +# genimage will need to find the extlinux.conf in the binaries directory
> +
> +CONSOLE="$2"
> +ROOT="$3"
> +
> +mkdir -p "${BINARIES_DIR}"
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +	label linux
> +	  kernel /Image
> +	  devicetree /system.dtb
> +	  append console="${CONSOLE}" root="/dev/${ROOT}" rw rootwait
> +	__HEADER_EOF

Why is this change needed?

The extlinux.conf file generation is in always in post-build in the
whole Buildroot tree, thus moving it to post-image only for some boards
seems confusing.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
