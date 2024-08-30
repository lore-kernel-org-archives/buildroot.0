Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5D4CA0EF3
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 21:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72596145C;
	Fri, 30 Aug 2024 21:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkE-u2Xq9Sie; Fri, 30 Aug 2024 21:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E1161483
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E1161483;
	Fri, 30 Aug 2024 21:47:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8EE51BF295
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2932400D8
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNMaY71Z7YMp for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 21:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C0D4402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C0D4402BC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C0D4402BC
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 21:47:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BC70513F88F;
 Fri, 30 Aug 2024 23:47:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 23:47:34 +0200
Date: Fri, 30 Aug 2024 23:47:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZtI99koWje9OE3o7@landeda>
References: <20240618194001.1907396-1-fiona.klute@gmx.de>
 <20240618194001.1907396-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618194001.1907396-2-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725054457;
 bh=URZDMVst2gW30KmR3E/LK9Ny/vYTmDRvu5yBuFOQgDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mmsreSAELQTu6dND0jhToVtlc1Pp8liC16OQQ9SXJ3QI9hXCNZHutCPmbRtV0xcck
 L3wUpePG4FBh8AsSAly8DWFrsrxuHjA8lCPDqqu5bcC1eYJzx4XI0yGmoRvZ/CQTdK
 KYVfeVFCP/yXV0549JlVSf+HBNvUA1iolbDxJrpFxpRJYoAbNFi+ROaRGHlsksFY5q
 nK9TAykuP3TORldttc6hTXSbhUexECHTFqcjGGgN63DSolZrNHczGqUQLr6ZNddaQ6
 b6S5ZQspXwekB9WraBDUYtGvxeZKdK0TX3Zi56bW07MxEv+I85PG3aVsu5lqJ+9bVx
 EhAH+FnqCgCuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mmsreSAE
Subject: Re: [Buildroot] [PATCH 1/2] board/raspberrypi: Support boot.scr for
 U-Boot
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
Cc: =?utf-8?B?Sm9zw6k=?= Mendes <jp.baltazar.mendes@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-06-18 21:40 +0200, Fiona Klute via buildroot spake thusly:
> If using U-Boot as "kernel" for the raspberrypi bootloader, include
> boot.scr in the boot partition if it exists.
> 
> To use this, use BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE to set a config
> file that uses U-Boot, and enable building a boot script in the U-Boot
> host tool settings.
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

I've not applied yet, in the hope that a defconfig that uses u-boot will
come soon! ;-)

Regards,
Yann E. MORIN.

> ---
>  board/raspberrypi/post-image.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index 9b9eac972b..e4611d05dd 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -19,6 +19,12 @@ if [ ! -e "${GENIMAGE_CFG}" ]; then
>  	KERNEL=$(sed -n 's/^kernel=//p' "${BINARIES_DIR}/rpi-firmware/config.txt")
>  	FILES+=( "${KERNEL}" )
> 
> +	# If config.txt calls for running U-Boot, include the boot
> +	# script if any.
> +	if [ "${KERNEL}" = "u-boot.bin" ] && [ -e "${BINARIES_DIR}/boot.scr" ]; then
> +		FILES+=( "boot.scr" )
> +	fi
> +
>  	BOOT_FILES=$(printf '\\t\\t\\t"%s",\\n' "${FILES[@]}")
>  	sed "s|#BOOT_FILES#|${BOOT_FILES}|" "${BOARD_DIR}/genimage.cfg.in" \
>  		> "${GENIMAGE_CFG}"
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
