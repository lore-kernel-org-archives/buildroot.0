Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F0FC30654
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7822860A7E;
	Mon,  3 Jul 2023 18:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7822860A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id snsxdSvcCT3D; Mon,  3 Jul 2023 18:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B114660A9B;
	Mon,  3 Jul 2023 18:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B114660A9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E03601BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8D4240420
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8D4240420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTbea6cBNsRo for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6624D40280
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6624D40280
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:42:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2BCC02003D6;
 Mon,  3 Jul 2023 20:42:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 20:42:23 +0200
Date: Mon, 3 Jul 2023 20:42:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Message-ID: <20230703184223.GB2510@scaer>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
 <20230629053130.3976-3-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629053130.3976-3-jeanmichel.hautbois@yoseli.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688409750;
 bh=ETxTxMf2EfufxAPEcMkUq9nDJdPlsk830gkkrXCq8Lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbPh8vvsie6M1e3coPDEtI+rQyX44ACae9+jUbDm4waCg+kmi50YWO/9AFnEAz0pr
 z1qor3hOMxgc2d946KrzkH6c/Akje7d8olqLt4GRpBoQDxmYzj0f9qXaGtR7QRp+wY
 J8FxgQwhorbpMn7CABC0p9hOlKRznh+c6yv2e3fVpmHFAvjbKCL4Bpgzx6mYKN0wxB
 qB0aUUObuluJl6Xz8HWM50L6rUq9fmAEQR64qOTJcJKYIXWG4Vie4S+V5iks2beUJg
 dgM87Zlg9RFGut16Fhpyw0Adtwk7hYw1OS4czgzyu0XGNnrVTKiqsmqU2yRcgEZhtZ
 6D6iep9/M39sQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DbPh8vvs
Subject: Re: [Buildroot] [PATCH 2/3] board: add the qemu board support for
 mcf54418
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jean-Michel, All,

On 2023-06-29 07:31 +0200, Jean-Michel Hautbois spake thusly:
> The Coldfire MCF54418 needs a board to give the proper linux defconfig
> to buildroot. Add it based on a simplified Linux stmark2_defconfig file.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  board/qemu/m68k-mcf54418/linux.config | 23 +++++++++++++++++++++++

This file is unused as of this patch; it only gets used in patch 3, when
you eventually do add the qemu defcconfig, which is where you should
also add the corresponding kernel config.

No need to rsend, these two can be squashed together when applying.

Regards,
Yann E. MORIN.

>  1 file changed, 23 insertions(+)
>  create mode 100644 board/qemu/m68k-mcf54418/linux.config
> 
> diff --git a/board/qemu/m68k-mcf54418/linux.config b/board/qemu/m68k-mcf54418/linux.config
> new file mode 100644
> index 0000000000..e950052061
> --- /dev/null
> +++ b/board/qemu/m68k-mcf54418/linux.config
> @@ -0,0 +1,23 @@
> +CONFIG_COLDFIRE=y
> +CONFIG_M5441x=y
> +CONFIG_CLOCK_FREQ=240000000
> +CONFIG_STMARK2=y
> +CONFIG_UBOOT=y
> +CONFIG_RAMBASE=0x40000000
> +CONFIG_RAMSIZE=0x8000000
> +CONFIG_VECTORBASE=0x40000000
> +CONFIG_KERNELBASE=0x40001000
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_BINFMT_FLAT=y
> +CONFIG_SERIAL_MCF=y
> +CONFIG_SERIAL_MCF_BAUDRATE=115200
> +CONFIG_SERIAL_MCF_CONSOLE=y
> +CONFIG_BOOTPARAM=y
> +CONFIG_BOOTPARAM_STRING="console=ttyS0,115200"
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_NETDEVICES=y
> +CONFIG_NET_VENDOR_FREESCALE=y
> +CONFIG_FEC=y
> -- 
> 2.39.2
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
