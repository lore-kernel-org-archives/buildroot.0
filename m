Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6432EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 07:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6B7160AC2;
	Sun, 20 Nov 2022 07:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B7160AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7v5fWZlY_NYY; Sun, 20 Nov 2022 07:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 055D760A69;
	Sun, 20 Nov 2022 07:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 055D760A69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 968621BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 07:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 534A881551
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 07:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 534A881551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5qglN9ss48A for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 07:50:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B578814AB
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B578814AB
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 07:50:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F1919352069F; Sun, 20 Nov 2022 08:50:12 +0100 (CET)
Date: Sun, 20 Nov 2022 08:50:12 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Yimin Gu <ustcymgu@gmail.com>
Message-ID: <Y3ncNLHK8OQhOo7d@waldemar-brodkorb.de>
References: <20221117140349.27692-1-ustcymgu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117140349.27692-1-ustcymgu@gmail.com>
X-Operating-System: Linux 5.10.0-18-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1668930613; bh=RQ44NviG26cOGB2VHob8t+oqcKw7xWqHua6P/i4tb/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d6AnqeJdo5IBm39Q5XRWlByPrDdj/0rPVW1JSCPe9qYHm6Ee94PtgKlH1Ywew33hH
 Gba85xVygCB9ajAA2SgPBk2kWwA0QT3oTX6dBpN3CM3EEQoKdZN8GDg0qJQH2eOL2m
 C2G8ZJJWByqdI7VCW6Mlq28/uB6dtKQj9EETyHmk3brOSw0tRe2/fDecB6ue1o7y74
 qvMDM8NZQLQH/G8jS3/6+ShwBY7mRB6dOJvIcrQPWR/i2NSNDJTfYZvF5ZUCeiB4VL
 uXG+jYUM22IyxdVxYhWkyT0g9SFlVsYoGeSRPET3uhvIoEhqYOyHUGh8mVqxEc9Nzk
 eSnYqi9GEqUlA==
Subject: Re: [Buildroot] [PATCH 0/1] arch/riscv: RISC-V 32-bit NO MMU support
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
Cc: Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
Yimin Gu wrote,

> The following patch adds support for 32-bit RISC-V No-MMU build.
> Currently for No-MMU RISC-V, only 64-bit is supported. There're no
> substancial changes in code but macros and compiling options. Uclibc,
> elf2flt, and the kernel need to be patched. 
> This is based on damien-lemoal/buildroot which first added 64-bit No-MMU
> support, and my earlier porting attempt regymm/buildroot. 
> As a lot of FPGA-based RISC-V cores are 32-bit and many of the low ones
> are without MMU, this can bring Linux to cores as light as RV32IMA.
> For this reason, only the minimum required extensions are enabled in the
> buildroot and kernel configurations. 
> 
> Yimin Gu (1):
>   arch/riscv: RISC-V 32-bit NO MMU support
> 
>  arch/Config.in.riscv                          |    2 -
>  board/riscv/nommu/patches/linux-headers       |    1 +
>  ...imental-RISC-V-32-bit-No-MMU-support.patch | 1355 +++++++++++++++++
>  configs/qemu_riscv32_nommu_virt_defconfig     |   19 +
>  package/Makefile.in                           |   13 +-
>  ...ed-RISC-V-32-bit-compilation-support.patch |   74 +
>  .../uclibc/0001-RISC-V-32-bit-support.patch   |  145 ++
>  package/uclibc/Config.in                      |    2 +
>  8 files changed, 1607 insertions(+), 4 deletions(-)
>  create mode 120000 board/riscv/nommu/patches/linux-headers
>  create mode 100644 board/riscv/nommu/patches/linux/5.19/0001-Experimental-RISC-V-32-bit-No-MMU-support.patch
>  create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig
>  create mode 100644 package/elf2flt/0006-Added-RISC-V-32-bit-compilation-support.patch
>  create mode 100644 package/uclibc/0001-RISC-V-32-bit-support.patch

You can add a 
Tested-By: Waldemar Brodkorb <wbx@openadk.org>

One minor note, add a startup description for noMMU in
board/qemu/riscv32-virt/readme.txt.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
