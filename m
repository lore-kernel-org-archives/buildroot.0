Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908A0C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 20:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C202560784;
	Sat,  2 Sep 2023 20:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C202560784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTQXvczK_Nd2; Sat,  2 Sep 2023 20:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A16606BF;
	Sat,  2 Sep 2023 20:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24A16606BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4D01BF3F7
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 20:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C15B181F24
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C15B181F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42DxHGkgh1Hi for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 20:18:20 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 425E581F34
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 20:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 425E581F34
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A59160002;
 Sat,  2 Sep 2023 20:18:17 +0000 (UTC)
Date: Sat, 2 Sep 2023 22:18:15 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230902221815.62c472d1@windsurf>
In-Reply-To: <20230902193000.1457685-1-ju.o@free.fr>
References: <20230902193000.1457685-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693685897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OodiqlAdbKV/f/hwvB3jiuA0IJV4pgH0hzjNonAfCg=;
 b=lHOUO2plS+RVyerRSaTOWdrQhpWZYPtVLIhRqPtZLR9Wzg53c8FTCjH2Ak5ZkPatINw0ju
 nvApNFVYL00jX+AKgQ7kroctqQ8UCVm28PsYzQoNo2U7FGN7atdMo5UWHLiv1xt+KMiCF+
 CiMMBmsNhVn8w06wRWg7jeI0dtVH4E/XQgB0OQt35QkFv72hdYzMmuia1BYyRuOuPE8w1c
 hFHbviVejnoPFSofOXaTpEeryLLHSXzMdifm/p1kqv8ocHE+RKtsUkyJS28RaqlZcSxg1v
 WmvF/svHXywG4TlUuOQcTelnV4RsZ3VBTytvkFvg6YhdQi9EaUAruG2fOxD67g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lHOUO2pl
Subject: Re: [Buildroot] [PATCH next 1/1] boot/edk2: add support for RISC-V
 64bit architecture
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

On Sat,  2 Sep 2023 21:30:00 +0200
Julien Olivain <ju.o@free.fr> wrote:

> RISC-V 64bit qemu virt machine support has been added in edk2
> version "stable202302". See [1].
> 
> Since edk2-stable202308, introduced in buildroot in commit 5c9f310
> "boot/edk2: bump to version edk2-stable202308", it is now possible
> to boot the edk2 UEFI shell in qemu.
> 
> This commit adds this early RISC-V support to edk2.
> 
> The RISC-V edk2 UEFI shell can be booted in Buildroot with the
> following commands:
> 
>     # Build EDK2 images
>     cat > .config <<EOF
>     BR2_riscv=y
>     BR2_RISCV_64=y
>     BR2_PACKAGE_HOST_QEMU=y
>     BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
>     BR2_TARGET_EDK2=y
>     EOF
>     make olddefconfig
>     make
> 
>     # edk2 image size should fit the 32MB of qemu pflash memories
>     truncate -s 32M output/images/RISCV_VIRT_CODE.fd
>     truncate -s 32M output/images/RISCV_VIRT_VARS.fd
> 
>     # Start qemu:
>     output/host/usr/bin/qemu-system-riscv64 \
>         -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off \
>         -nographic \
>         -blockdev node-name=pflash0,driver=file,read-only=on,filename=output/images/RISCV_VIRT_CODE.fd \
>         -blockdev node-name=pflash1,driver=file,filename=output/images/RISCV_VIRT_VARS.fd
> 
> Note: a Qemu version >= 8.0.0 is needed to properly start edk2. A qemu
> version on the host system might now be suffucient. This is why the

                                   ^^^ not   ^^^^^ sufficient

(Minor nits, no need to send a v2 for this)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
