Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5573CC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 13:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77FFD40399;
	Sat, 23 Dec 2023 13:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FFD40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0bQcoluSfbYD; Sat, 23 Dec 2023 13:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F93C40534;
	Sat, 23 Dec 2023 13:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F93C40534
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 581EC1BF41A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B89824CE
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B89824CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64o9Zab10UPI for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 13:37:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BF7282446
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 13:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF7282446
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43789C0003;
 Sat, 23 Dec 2023 13:37:03 +0000 (UTC)
Date: Sat, 23 Dec 2023 14:37:02 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20231223143702.2a4853b5@windsurf>
In-Reply-To: <20231222105655.444328-1-ju.o@free.fr>
References: <20230902193000.1457685-1-ju.o@free.fr>
 <20231222105655.444328-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703338623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Er+H0GsOhffwlXpr94eY+ERo57oUq4C5mzzKG7ksNk=;
 b=RloPUUnGhJZ1IBdn56o6PSits4obfnQdfq8AnpVoyLCGOb2exoJ8ZYJOIqh2HQrA5g3lQS
 cIPnVcvSM21+jBRDfW0w4T7lwVZN7jVHmTva7ygXjZW4GoIgi8u90C4piloi5vG/R+bHF5
 5aAZuEW58xsLAk5FvqzC35koNr9Cfta678Roxz0GV0SQ0+ElcS19Zci7kg3bel+16vS8cJ
 EWeJgbwJrKkOBA7oDeO7hjNpRPf9QHs1ybJis81JAPlTX1Y5YegZgQjTk/e2Q2aLrZfdQq
 XoUxNcljeZP2MaeKnyEJnZJshWlkE6ZU6elIpR5LYbHaxZ6XN1a2PNxJ2XnKag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RloPUUnG
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/edk2: add support for RISC-V
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

On Fri, 22 Dec 2023 11:56:55 +0100
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
> version on the host system might not be sufficient. This is why the
> Buildroot host-qemu is built in this config example.
> 
> [1] https://github.com/tianocore/edk2/releases/tag/edk2-stable202302
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Change v1 -> v2:
> - Fix 2 typos in the commit log, as reported by Thomas in [2]

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
