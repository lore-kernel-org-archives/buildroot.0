Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC92C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE80260F69;
	Thu, 11 Aug 2022 20:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE80260F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9X21rcvk2hJl; Thu, 11 Aug 2022 20:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EB160EA1;
	Thu, 11 Aug 2022 20:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EB160EA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33EDA1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AA5660F48
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA5660F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pkjhBAAIGlww for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:42:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E634E60EA1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E634E60EA1
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:42:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0B568240003;
 Thu, 11 Aug 2022 20:42:42 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:42:42 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20220811224242.009f83c9@windsurf>
In-Reply-To: <20220810115055.3898793-1-niklas.cassel@wdc.com>
References: <20220810115055.3898793-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660250563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCDwL0eU7XG6r+fNhxbi/QFjypygIavDtNCysZRALxQ=;
 b=DQQNrI2fiHfmPgiDI1ype6Eter+H348GiLsRPer8tJ/K0qdf0pj24gXormvm+PRi6oiYft
 q+oITSR/HY+qS8I4JPSY0STnr1odZ17tDsCmM765zubjVQ22/I85K8cmbXyCNnUhfWqykn
 +fGRwHIO7ZFafx5cZ31j/MszG0l3snPSooA3fYpP7C5MpsmOoK7fgkKUcnjCFflbzIIV3p
 OcvGJHIlPyPvJOeFoHktiAj//wsWemYjStrjv9glaOFxKMjcuMolic2/itkddFBkiQh530
 gd1c/IBCIz2l/7CUzfa03ugJVk4Z7/W2WnY6VMoXZuIzd9tUVpP8Kda/njdThw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQQNrI2f
Subject: Re: [Buildroot] [PATCH] board/riscv/nommu: bump kernel version and
 drop no longer needed patch
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, damien.lemoal@opensource.wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Aug 2022 13:50:55 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> Bump the kernel version for all riscv nommu configs from 5.18 to 5.19.
> That way, we can remove the one and only riscv nommu patch,
> since this patch is included in kernel 5.19.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  ...ot-stop-relocating-GOT-entries-prema.patch | 110 ------------------
>  board/riscv/nommu/patches/linux/readme.txt    |   3 -
>  configs/canaan_kd233_defconfig                |   5 +-
>  configs/qemu_riscv64_nommu_virt_defconfig     |   5 +-
>  configs/sipeed_maix_bit_defconfig             |   5 +-
>  configs/sipeed_maix_bit_sdcard_defconfig      |   5 +-
>  configs/sipeed_maix_dock_defconfig            |   5 +-
>  configs/sipeed_maix_dock_sdcard_defconfig     |   5 +-
>  configs/sipeed_maix_go_defconfig              |   5 +-
>  configs/sipeed_maix_go_sdcard_defconfig       |   5 +-
>  configs/sipeed_maixduino_defconfig            |   5 +-
>  configs/sipeed_maixduino_sdcard_defconfig     |   5 +-
>  12 files changed, 10 insertions(+), 153 deletions(-)
>  delete mode 100644 board/riscv/nommu/patches/linux/5.18/0001-binfmt_flat-do-not-stop-relocating-GOT-entries-prema.patch
>  delete mode 100644 board/riscv/nommu/patches/linux/readme.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
