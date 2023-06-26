Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF3EEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4984C4159D;
	Mon, 26 Jun 2023 17:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4984C4159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Z19WRFG0m_d; Mon, 26 Jun 2023 17:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 713A240476;
	Mon, 26 Jun 2023 17:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713A240476
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7761BF37B
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724CB815CF
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724CB815CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckEFAtnq8WIj for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:04:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06CB815AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B06CB815AB
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:04:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:88cf:b268:1dd:7043])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id AFA8420039F;
 Mon, 26 Jun 2023 19:04:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Jun 2023 19:04:18 +0200
Date: Mon, 26 Jun 2023 19:04:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230626170418.GD646621@scaer>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687799063;
 bh=4nz0yMTqjZS19mMFARPV9q6+6N20gL/7NLpI2miGTK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uRuSexRjfMAZ62RvDZtCCa7UaaTLgTgbaXkBDNuOH/s7NoXcfkr6yYSdPoPz4+ySA
 SNw3rWGWAB2G5K+UT4QHGGwtpqasdyyNPQwrKiNsWgYIBTjD7Rchjs/oT8G3EQyqUc
 MSCNZLIhJr/LSH/xJVG8QCsI5NSb9wKAw9oEkY6cjlMOUjJH5UkHffrTPuPKnAkHfv
 oFq4t8G1v/qATQkSZNGBuvx8HQdbbyvCqXpckbKiaNlBOqWGKaw5dI2thd43bdXNYo
 mLkrYQ7uPHPmJ3ZBzSjwrkfT0rMyfcFhH2XeqOVi+8lIbI7q0EMSe0ZnfV2cN8o+by
 irUfuiTBprWpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uRuSexRj
Subject: Re: [Buildroot] [PATCH 00/10] riscv: Various fixes and small
 enhancements
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bin, All,

On 2023-06-27 00:00 +0800, Bin Meng spake thusly:
> A bug report [1] was filed recently against HiFive Unleashed board that
> it did not build. Although I could not reproduce the build failure, it
> does make sense to upgrade the OpenSBI version for this board, as
> discussed in the bug report.
> 
> Now OpenSBI version is bumped up to 1.3 in this series for all RISC-V
> boards. For HiFive Unleashed board I decided to use the latest U-Boot
> release as well, which requires some new changes.
> 
> The Kconfig options of RISC-V boards have been cleaned up. Instructions
> of using QEMU to test the HiFive Unleashed board images are added.
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=15658
> 
> 
> Bin Meng (10):
>   configs/hifive_unleashed: Update to use OpenSBI 1.2
>   configs/hifive_unleashed: Update to use U-Boot v2023.04
>   configs/hifive_unleashed: Enable BR2_RISCV_ISA_CUSTOM_RVA explicitly
>   configs/beaglev_defconfig: Enable BR2_RISCV_ISA_CUSTOM_RVA explicitly
>   arch/Config.in.riscv: Remove BR2_RISCV_ISA_CUSTOM_RVA from
>     BR2_riscv_custom

I've applied the first fice patches to master.

>   configs: riscv: Drop BR2_TARGET_OPENSBI_CUSTOM_VERSION

I'll reply to that one realy soon...

>   boot/opensbi: Config.in: Cosmetic style fix
>   boot/opensbi: Bump to version 1.3

I've applied those two to master too.

>   board/sifive: hifive-unleashed: Update rootfs offset
>   board/sifive: hifive-unleashed: Include QEMU instructions in
>     readme.txt

I'll handle those two very soon.

Thanks!

Regards,
Yann E. MORIN.

> 
>  arch/Config.in.riscv                            |  1 -
>  .../sifive/hifive-unleashed/genimage_sdcard.cfg |  1 +
>  board/sifive/hifive-unleashed/readme.txt        | 17 +++++++++++++++++
>  boot/opensbi/Config.in                          |  6 +++---
>  boot/opensbi/opensbi.hash                       |  2 +-
>  configs/beaglev_defconfig                       |  1 +
>  configs/hifive_unleashed_defconfig              | 10 +++++-----
>  configs/nezha_defconfig                         |  2 --
>  configs/qemu_riscv32_virt_defconfig             |  2 --
>  configs/qemu_riscv64_virt_defconfig             |  2 --
>  configs/sipeed_lichee_rv_defconfig              |  2 --
>  configs/sipeed_lichee_rv_dock_defconfig         |  2 --
>  configs/spike_riscv64_defconfig                 |  2 --
>  13 files changed, 28 insertions(+), 22 deletions(-)
> 
> -- 
> 2.34.1
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
