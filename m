Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4236EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58DDF611AA;
	Tue, 22 Aug 2023 19:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58DDF611AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpUaLvqPkG-v; Tue, 22 Aug 2023 19:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B039E60A6F;
	Tue, 22 Aug 2023 19:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B039E60A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 914891BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DF6D81A50
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF6D81A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z470T8InfDG8 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:20:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC5781AA7
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC5781AA7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77D9020004;
 Tue, 22 Aug 2023 19:20:06 +0000 (UTC)
Date: Tue, 22 Aug 2023 21:20:05 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230822212005.7a243dff@windsurf>
In-Reply-To: <ZNpVxMiYs0ONyfJS@waldemar-brodkorb.de>
References: <ZNpVxMiYs0ONyfJS@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692732006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GaBtB8SxX8R8H7GiWHE/F5OmgsJHB/FlgZG+Mjx72SM=;
 b=oR/liydt2BICzvvj7vQApzesfB/dHIbzx36PYcJAY4R0yygtrdvmAnN3oFZvtvWuN8/efl
 LmThldb8/rgp5h/M2mW+/BVMcEkU6sWoVWz30oUcocm2d3rEnp/EkjDq9lQSSbmknEPcTa
 JbQZY826e9Sp0uSsGmIAz2W5GKP+Pwf3wFQSvz9nRT/1cjebntOHyaehMIj83nJznXVams
 8ylnsARGd/pXdK+aksUxfhs/PriSzb5AQC3CL4UjxoxfsfozK8XWz+soETr+cejxWijOmA
 yT7VgDZ7Ia3kk375W/5CVjtuy/+B6Sug5Yz3ZErcw2pxlIQNoYRl3iNyZy3ECw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oR/liydt
Subject: Re: [Buildroot] [PATCH] configs/qemu*: bump kernel to 6.1.44
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

On Mon, 14 Aug 2023 18:26:44 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> All defconfigs were runtime tested in Qemu 8.0.3.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  configs/qemu_aarch64_ebbr_defconfig       | 2 +-
>  configs/qemu_aarch64_sbsa_defconfig       | 2 +-
>  configs/qemu_aarch64_virt_defconfig       | 2 +-
>  configs/qemu_arm_ebbr_defconfig           | 2 +-
>  configs/qemu_arm_versatile_defconfig      | 2 +-
>  configs/qemu_arm_vexpress_defconfig       | 2 +-
>  configs/qemu_arm_vexpress_tz_defconfig    | 2 +-
>  configs/qemu_m68k_mcf5208_defconfig       | 2 +-
>  configs/qemu_m68k_q800_defconfig          | 2 +-
>  configs/qemu_microblazebe_mmu_defconfig   | 2 +-
>  configs/qemu_microblazeel_mmu_defconfig   | 2 +-
>  configs/qemu_mips32r2_malta_defconfig     | 2 +-
>  configs/qemu_mips32r2el_malta_defconfig   | 2 +-
>  configs/qemu_mips32r6_malta_defconfig     | 2 +-
>  configs/qemu_mips32r6el_malta_defconfig   | 2 +-
>  configs/qemu_mips64_malta_defconfig       | 2 +-
>  configs/qemu_mips64el_malta_defconfig     | 2 +-
>  configs/qemu_mips64r6_malta_defconfig     | 2 +-
>  configs/qemu_mips64r6el_malta_defconfig   | 2 +-
>  configs/qemu_nios2_10m50_defconfig        | 2 +-
>  configs/qemu_or1k_defconfig               | 2 +-
>  configs/qemu_ppc64_e5500_defconfig        | 2 +-
>  configs/qemu_ppc64_pseries_defconfig      | 2 +-
>  configs/qemu_ppc64le_powernv8_defconfig   | 2 +-
>  configs/qemu_ppc64le_pseries_defconfig    | 2 +-
>  configs/qemu_ppc_bamboo_defconfig         | 2 +-
>  configs/qemu_ppc_e500mc_defconfig         | 2 +-
>  configs/qemu_ppc_g3beige_defconfig        | 2 +-
>  configs/qemu_ppc_mac99_defconfig          | 2 +-
>  configs/qemu_ppc_mpc8544ds_defconfig      | 2 +-
>  configs/qemu_riscv32_virt_defconfig       | 2 +-
>  configs/qemu_riscv64_nommu_virt_defconfig | 2 +-
>  configs/qemu_riscv64_virt_defconfig       | 2 +-
>  configs/qemu_s390x_defconfig              | 2 +-
>  configs/qemu_sh4_r2d_defconfig            | 2 +-
>  configs/qemu_sh4eb_r2d_defconfig          | 2 +-
>  configs/qemu_sparc64_sun4u_defconfig      | 2 +-
>  configs/qemu_x86_64_defconfig             | 2 +-
>  configs/qemu_x86_defconfig                | 2 +-
>  configs/qemu_xtensa_lx60_defconfig        | 2 +-
>  configs/qemu_xtensa_lx60_nommu_defconfig  | 2 +-
>  41 files changed, 41 insertions(+), 41 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
