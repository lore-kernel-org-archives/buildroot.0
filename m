Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C353C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 11:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D344155F;
	Mon,  4 Jul 2022 11:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D344155F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctszae9e9fK7; Mon,  4 Jul 2022 11:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F7C74051E;
	Mon,  4 Jul 2022 11:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F7C74051E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A969D1BF375
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 11:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76491827FA
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 11:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76491827FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4xNANPr4Fng for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 11:30:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6494F82741
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6494F82741
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 11:30:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.92,243,1650902400"; d="scan'208";a="205474859"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Jul 2022 19:30:08 +0800
IronPort-SDR: 3oBP4/n3huG2f/mPfILvqsEnhsOfT+MfhON71gycNSY6N4nDZW8SqGad3fA7H7TR35TvhsEqbF
 dtxMJQ/YhPEytp8TpAfxNLO+Ru1vWBwPI1EL/q89brEjNDVTjPgguyOCyEby+YSHOdfjSLxD+B
 2hb8Cssupiybn0RAF1K9mdgzead/5VVJskU2L2Ma9iNKTyjZJMoN6PT6V5YdKD+pJd+HH9aeue
 uPA/craKYklQ2JdML2a30KYqh+r/APLyxpwZ07/Lz1ZUQKZfxgN6SseKoR1BnuqkejjhlnGZjS
 2A1/Mu/UD5PpfhyfulPHkT53
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 03:52:00 -0700
IronPort-SDR: LP+pEIsIQiy4vFPAh9pIIXqoj8zFvfYNidXPBPeBeXVzGew3Bgv2f6u3Ck5XWXZ7oyFy5YKIhS
 1up4Dqhu1WRhWqaEnp/+QkPWHfQoEiF7CoCUo+OjmiDjdqCKngLmn4O/LWmYR41eQb+TdNiM6R
 g60RjDGkPHeZRCplyJbtY5tnD8kQta3qLnyjROExdqVA95kI0kIK4GXX81DJASSUiXoyxB+SYR
 z/Sr0CBOaC6PBtVZBriBgA3yxmUzCXPkZeKMTHp52xjdu3mLuqfErRD+8fYaPk0qNNDnAAw7Tu
 P4o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 04:30:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lc3WN2NqMz1Rw4L
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 04:30:08 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id K5kdbd5KgEdR for <buildroot@buildroot.org>;
 Mon,  4 Jul 2022 04:30:07 -0700 (PDT)
Received: from [10.225.163.105] (unknown [10.225.163.105])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lc3WL5FWsz1RtVk;
 Mon,  4 Jul 2022 04:30:06 -0700 (PDT)
Message-ID: <bd4eeaff-f4ce-ecd3-8e3b-03d5a924b53a@opensource.wdc.com>
Date: Mon, 4 Jul 2022 20:30:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656934209; x=1688470209;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rA7OXpc7AZTQn6BYGJqup0zEeqEloWx5dv9jSKuxtNM=;
 b=kIGG7xZEQMHMM0W689tnj5V7S9iHv1IssjCw/YmnrL7ODdx7+bfP5qJ3
 F8l4HRZoZ7rZ/QWsTPIJCGnk3oIbfi6EPSVIMgEd3UluPCiyM2jLDOgVD
 AMinOikGGd7HmwoPwGOldEcw0m7L8AxNFp/2y+B9Klx6xG/C26Gcf9Y4U
 AlyurRQpYWi3Z3MYvWIHyf+ALKUmFyo1zgK4vLJ5xkrc/tFlVw04/xPfy
 tdpvX2sGFKwNNJp+o9xS/eW2pOEREOZL2z8RrpkRyoSXVnnv0NHjBlyyZ
 13L/IL+JMmeeSi4eE48hR3RoHFyRctBYzQOijTJqxGcbMXu4w9ms5Mun0
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656934207; x=1659526208; bh=rA7OXpc7AZTQn6BYGJqup0zEeqEloWx5dv9
 jSKuxtNM=; b=FY3Zdh+hTuay5CIlh/FiIPVzMglrcPWsTNV1ZUegDRHLRDfU/N+
 VcN09GBxMFtD4lZgXgwDp+y8gnqHGNwuonuugva+UVx5EL9Z0VzyRNJFyeWPtTwj
 ciRoQDXscC6uSGnHAXDwxrUVEc8MD9RwW0yZOCCWbkAb+SvDMsLjZJyga2hEoQPe
 /8H490rHw4cFzyA62zP0mFY2pD3/IzI1oJZwU6YmB/DKKkvKMSWpfWYmm9e/GWeG
 OonlE4zYZmm/SToJ2HMUuuiWaFvXQP9kpWZsmKUgeDiCWQsWqeEjIfWh8P5dmm75
 nSHpyeqQKVHUfHfV9kNloOc1iJ04Fbb2TLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=kIGG7xZE; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=FY3Zdh+h
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: Re: [Buildroot] [PATCH v3 0/7] Fix RV64 NOMMU and add Canaan K210
 SoC support
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 5/31/22 14:49, Damien Le Moal via buildroot wrote:
> This patch series is a rework of the old v5 series "Add RV64 NOMMU and
> Canaan K210 SoC support" already posted some (long) time ago.
> 
> This series adds support for building 64-bits RISC-V NOMMU kernels (both
> bootable kernels and u-boot sdcard boot envronements) for NOMMU RISC-V
> 64-bits boards. The board supported include QEMU and many boards using
> the dual-core RISC-V 64-bits Cannan Kendryte K210 SoC.
> 
> The first patch is a simple fix of elf2flt configuration.
> 
> Patch 2 adds the configurations files common to all K210-based boards.
> 
> The last 5 patches add support for the following K210-based boards:
> * Sipeed MAIX Bit
> * Sipeed MAIXDUINO
> * Sipeed MAIX Dock (dan)
> * Sipeed MAIX Go
> * Canaan KD233 development board
> 
> For each board, a readme.txt file is added to document how to build and
> install images for these boards.

Ping ? This was sent at the end of May and still not applied nor
commented. Any blocker here ?

> 
> Changes from v2:
> * Rebased patches on next branch
> * Modified patch 1 to address Thomas comments
> * Removed patches already applied
> * Modified patches 2 to 7 to remove the BR2_PACKAGE_HOST_ELF2FLT and
>   reference the global patch directory in boar/riscv/nommu
> 
> Changes from v1:
> * Modified patch 5 to add the python-kflash utility as a host package as
>   the new 1.1.5 version of this utility fixes the previously identified
>   problems with python dependencies.
> * Fixed patch 4 (qemu riscv nommu) to have buildroot configuration file
>   reference kernel 5.18.
> * Fixed patch 11 (kd233 board) to have buildroot configuration file
>   reference kernel 5.18.
> * Modified patch 7 to 11 to add the python-kflash host package to the
>   buildroot configuration files. The instructions in the readme.txt
>   file for each board are also updated accordingly.
> 
> Damien Le Moal (7):
>   package/elf2flt: Remove Config.in.host
>   board: Add common support for Canaan K210 SoC-based boards
>   board: Add Sipeed MAIX-Bit board support
>   board: Add Sipeed MAIXDUINO board support
>   board: Add Sipeed MAIX-Dock board support
>   board: Add Sipeed MAIX-Go board support
>   board: Add Canaan KD233 board support
> 
>  Config.in                                     |   2 +-
>  DEVELOPERS                                    |  11 +
>  arch/Config.in                                |   1 +
>  board/canaan/k210-soc/busybox-tiny.config     | 231 +++++++++++++
>  board/canaan/k210-soc/genimage.cfg            |  30 ++
>  board/canaan/k210-soc/linux-sdcard.config     |   4 +
>  board/canaan/k210-soc/post-build.sh           |  28 ++
>  board/canaan/k210-soc/rootfs_overlay/init     |   1 +
>  .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 +++
>  board/canaan/k210-soc/uboot.config            |   1 +
>  board/canaan/kd233/linux-cpio.config          |   2 +
>  board/canaan/kd233/readme.txt                 | 149 ++++++++
>  board/sipeed/maix-bit/linux-cpio.config       |   2 +
>  board/sipeed/maix-bit/readme.txt              | 316 +++++++++++++++++
>  board/sipeed/maix-dock/linux-cpio.config      |   2 +
>  board/sipeed/maix-dock/readme.txt             | 321 ++++++++++++++++++
>  board/sipeed/maix-go/linux-cpio.config        |   2 +
>  board/sipeed/maix-go/readme.txt               | 320 +++++++++++++++++
>  board/sipeed/maixduino/linux-cpio.config      |   2 +
>  board/sipeed/maixduino/readme.txt             | 292 ++++++++++++++++
>  configs/canaan_kd233_defconfig                |  39 +++
>  configs/qemu_arm_versatile_nommu_defconfig    |   1 -
>  configs/qemu_riscv64_nommu_virt_defconfig     |   1 -
>  configs/qemu_xtensa_lx60_nommu_defconfig      |   1 -
>  configs/sipeed_maix_bit_defconfig             |  39 +++
>  configs/sipeed_maix_bit_sdcard_defconfig      |  57 ++++
>  configs/sipeed_maix_dock_defconfig            |  39 +++
>  configs/sipeed_maix_dock_sdcard_defconfig     |  57 ++++
>  configs/sipeed_maix_go_defconfig              |  39 +++
>  configs/sipeed_maix_go_sdcard_defconfig       |  57 ++++
>  configs/sipeed_maixduino_defconfig            |  39 +++
>  configs/sipeed_maixduino_sdcard_defconfig     |  57 ++++
>  package/elf2flt/Config.in.host                |  13 -
>  toolchain/toolchain-buildroot/Config.in       |   1 -
>  34 files changed, 2180 insertions(+), 18 deletions(-)
>  create mode 100644 board/canaan/k210-soc/busybox-tiny.config
>  create mode 100644 board/canaan/k210-soc/genimage.cfg
>  create mode 100644 board/canaan/k210-soc/linux-sdcard.config
>  create mode 100755 board/canaan/k210-soc/post-build.sh
>  create mode 120000 board/canaan/k210-soc/rootfs_overlay/init
>  create mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
>  create mode 100644 board/canaan/k210-soc/uboot.config
>  create mode 100644 board/canaan/kd233/linux-cpio.config
>  create mode 100644 board/canaan/kd233/readme.txt
>  create mode 100644 board/sipeed/maix-bit/linux-cpio.config
>  create mode 100644 board/sipeed/maix-bit/readme.txt
>  create mode 100644 board/sipeed/maix-dock/linux-cpio.config
>  create mode 100644 board/sipeed/maix-dock/readme.txt
>  create mode 100644 board/sipeed/maix-go/linux-cpio.config
>  create mode 100644 board/sipeed/maix-go/readme.txt
>  create mode 100644 board/sipeed/maixduino/linux-cpio.config
>  create mode 100644 board/sipeed/maixduino/readme.txt
>  create mode 100644 configs/canaan_kd233_defconfig
>  create mode 100644 configs/sipeed_maix_bit_defconfig
>  create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
>  create mode 100644 configs/sipeed_maix_dock_defconfig
>  create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
>  create mode 100644 configs/sipeed_maix_go_defconfig
>  create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
>  create mode 100644 configs/sipeed_maixduino_defconfig
>  create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
>  delete mode 100644 package/elf2flt/Config.in.host
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
