Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C5EC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 21:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 994D360C06;
	Mon,  7 Nov 2022 21:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 994D360C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGKeDWHmVd1N; Mon,  7 Nov 2022 21:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025DF60C04;
	Mon,  7 Nov 2022 21:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 025DF60C04
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FBED1BF27A
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B9F360BD6
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B9F360BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpUiDW6Ct2bj for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 21:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2D660A46
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D2D660A46
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 21:20:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1dd2:f7fa:6fba:b565])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B30E819F5AD;
 Mon,  7 Nov 2022 22:20:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 22:20:19 +0100
Date: Mon, 7 Nov 2022 22:20:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221107212019.GL3918838@scaer>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667856021;
 bh=h8+akKaDnJ/UumIvhmyJ2fviYiBXxgZPSVqPUF5Ix9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmBO2Zwfhpz5lSS6+ivpOscXb4O9BKekPESLUNpB53KFYzHAelYVL8M8sgW2EBx0r
 qkAY9cmr5NoyNsi1w5FAaFIW0r2aDkUtW61iWcxsIy1CTUT8EfI519BJWdhMhKALw/
 oksq5Q1fhQavY25nCjBfIs+yP0jHaOFJQOrzYO+6NqoROl+ZVDUz8kKj1/Wfuc3yJ6
 giAKg7Bhvw4oaCyzNOhDCzD6LvJ7cztVMIMGBa6e1s5pyQ4ufTGoPYn1VZVw30c4JA
 LbpjFTHZQ5CJ7M0zqHSl8C2HcG2x3lCxf3Y6eMAVuE45wqLL92jdAHnoe3dhqBwmZd
 vujngGGCN5iaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jmBO2Zwf
Subject: Re: [Buildroot] [PATCH 00/21] First batch of defconfig removals
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-01 23:03 +0100, Thomas Petazzoni via buildroot spake thusly:
> This patch series proposes to remove 21 defconfigs which have been
> failing to build for month. All of these defconfigs have already been
> listed in an e-mail sent on August 6, 2022 [0] to the relevant
> defconfig maintainers, and they still haven't been fixed. Close to 3
> months later, it's time to remove them, with the goal of having all
> defconfigs building for the upcoming 2022.11 release.
> 
> I'm proposing to give one extra week (until November 7) before
> applying these patches, to see if some of the defconfig maintainers
> send patches to fix the defconfigs they are in charge of, or if
> anybody else steps up.

Exc ept for the pine64 defconfig which got fixed, there's been no other
feedback. The week-long delay has now elapsed, so: applied to master,
thanks.

Regards,
Yann E. MORIN.

> [0] https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
> 
> Thanks,
> 
> Thomas Petazzoni
> 
> Thomas Petazzoni (21):
>   configs/amarula_a64_relic: remove defconfig
>   configs/arm_juno: remove defconfig
>   configs/bananapi_m1: remove defconfig
>   configs/bananapi_m1_plus: remove defconfig
>   configs/bananapi_m2_plus: remove defconfig
>   configs/bananapi_m64: remove defconfig
>   configs/friendlyarm_nanopc_t4: remove defconfig
>   configs/friendlyarm_nanopi_a64: remove defconfig
>   configs/friendlyarm_nanopi_m1: remove defconfig
>   configs/friendlyarm_nanopi_m1: remove defconfig
>   configs/friendlyarm_nanopi_m4: remove defconfig
>   configs/friendlyarm_nanopi_neo2: remove defconfig
>   configs/friendlyarm_nanopi_neo4: remove defconfig
>   configs/friendlyarm_nanopi_neo_plus2: remove defconfig
>   configs/friendlyarm_nanopi_r1: remove defconfig
>   configs/orangepi_pc2: remove defconfig
>   configs/orangepi_plus: remove defconfig
>   configs/orangepi_prime: remove defconfig
>   configs/orangepi_rk3399: remove defconfig
>   configs/orangepi_win: remove defconfig
>   configs/pine64: remove defconfig
> 
>  DEVELOPERS                                    |  38 ----
>  board/amarula/a64-relic/extlinux.conf         |   4 -
>  board/amarula/a64-relic/genimage.cfg          |  11 --
>  board/amarula/a64-relic/post-build.sh         |   4 -
>  board/amarula/a64-relic/readme.txt            |  90 ----------
>  .../lib/firmware/brcm/brcmfmac4330-sdio.txt   |  83 ---------
>  board/arm/juno/linux-juno-defconfig           | 169 -----------------
>  board/arm/juno/readme.txt                     | 134 --------------
>  board/bananapi/bananapi-m1/boot.cmd           |   7 -
>  board/bananapi/bananapi-m1/genimage.cfg       |  34 ----
>  board/bananapi/bananapi-m1/readme.txt         |  37 ----
>  board/bananapi/bananapi-m64/boot.cmd          |   6 -
>  board/bananapi/bananapi-m64/genimage.cfg      |  40 -----
>  board/bananapi/bananapi-m64/readme.txt        |  37 ----
>  board/friendlyarm/nanopc-t4/extlinux.conf     |   4 -
>  board/friendlyarm/nanopc-t4/genimage.cfg      |  39 ----
>  board/friendlyarm/nanopc-t4/post-build.sh     |   5 -
>  board/friendlyarm/nanopc-t4/readme.txt        |  45 -----
>  board/friendlyarm/nanopi-a64/boot.cmd         |   6 -
>  board/friendlyarm/nanopi-a64/genimage.cfg     |  40 -----
>  board/friendlyarm/nanopi-a64/readme.txt       |  37 ----
>  board/friendlyarm/nanopi-m1-plus/boot.cmd     |   8 -
>  board/friendlyarm/nanopi-m1-plus/genimage.cfg |  36 ----
>  board/friendlyarm/nanopi-m1-plus/readme.txt   |  29 ---
>  board/friendlyarm/nanopi-m1/boot.cmd          |   8 -
>  board/friendlyarm/nanopi-m1/genimage.cfg      |  37 ----
>  board/friendlyarm/nanopi-m1/readme.txt        |  29 ---
>  board/friendlyarm/nanopi-m4/extlinux.conf     |   4 -
>  board/friendlyarm/nanopi-m4/genimage.cfg      |  39 ----
>  board/friendlyarm/nanopi-m4/post-build.sh     |   5 -
>  board/friendlyarm/nanopi-m4/readme.txt        |  45 -----
>  .../nanopi-neo-plus2/extlinux.conf            |   4 -
>  .../friendlyarm/nanopi-neo-plus2/genimage.cfg |  40 -----
>  .../nanopi-neo-plus2/linux-extras.config      |  10 --
>  .../nanopi-neo-plus2/post-build.sh            |   4 -
>  board/friendlyarm/nanopi-neo-plus2/readme.txt |  37 ----
>  ...3430-sdio.friendlyarm,nanopi-neo-plus2.txt |  53 ------
>  board/friendlyarm/nanopi-neo2/boot.cmd        |   6 -
>  board/friendlyarm/nanopi-neo2/genimage.cfg    |  40 -----
>  board/friendlyarm/nanopi-neo2/readme.txt      |  37 ----
>  board/friendlyarm/nanopi-neo4/extlinux.conf   |   4 -
>  board/friendlyarm/nanopi-neo4/genimage.cfg    |  22 ---
>  board/friendlyarm/nanopi-neo4/post-build.sh   |   5 -
>  board/friendlyarm/nanopi-neo4/readme.txt      |  53 ------
>  board/friendlyarm/nanopi-r1/boot.cmd          |   8 -
>  board/friendlyarm/nanopi-r1/genimage.cfg      |  37 ----
>  .../nanopi-r1/kernel/linux-extras.config      |   2 -
>  .../nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts   | 170 ------------------
>  board/friendlyarm/nanopi-r1/readme.txt        |  29 ---
>  .../nanopi-r1/uboot/nanopi_r1_defconfig       |  22 ---
>  .../nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts    | 102 -----------
>  board/orangepi/orangepi-pc2/boot.cmd          |   6 -
>  board/orangepi/orangepi-pc2/genimage.cfg      |  40 -----
>  board/orangepi/orangepi-pc2/readme.txt        |  37 ----
>  board/orangepi/orangepi-plus/boot.cmd         |   8 -
>  board/orangepi/orangepi-plus/genimage.cfg     |  36 ----
>  board/orangepi/orangepi-plus/readme.txt       |  29 ---
>  board/orangepi/orangepi-prime/boot.cmd        |   6 -
>  board/orangepi/orangepi-prime/genimage.cfg    |  40 -----
>  board/orangepi/orangepi-prime/readme.txt      |  37 ----
>  board/orangepi/orangepi-rk3399/extlinux.conf  |   4 -
>  board/orangepi/orangepi-rk3399/genimage.cfg   |  38 ----
>  board/orangepi/orangepi-rk3399/post-build.sh  |   5 -
>  board/orangepi/orangepi-rk3399/readme.txt     |  56 ------
>  board/orangepi/orangepi-win/boot.cmd          |   6 -
>  board/orangepi/orangepi-win/genimage.cfg      |  40 -----
>  board/orangepi/orangepi-win/readme.txt        |  37 ----
>  board/pine64/pine64/boot.cmd                  |   6 -
>  board/pine64/pine64/genimage.cfg              |  40 -----
>  board/pine64/pine64/readme.txt                |  38 ----
>  board/sinovoip/m1-plus/boot.cmd               |   5 -
>  board/sinovoip/m1-plus/genimage.cfg           |  38 ----
>  board/sinovoip/m1-plus/linux-wifi.fragment    |  10 --
>  ...nanapi-m1-plus-Disable-OOB-IRQ-for-b.patch |  39 ----
>  board/sinovoip/m1-plus/post-build.sh          |   4 -
>  board/sinovoip/m1-plus/readme.txt             |  64 -------
>  ...rcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt |   1 -
>  .../lib/firmware/brcm/brcmfmac43362-sdio.txt  |  56 ------
>  board/sinovoip/m2-plus/boot.cmd               |   7 -
>  board/sinovoip/m2-plus/genimage.cfg           |  34 ----
>  configs/amarula_a64_relic_defconfig           |  63 -------
>  configs/arm_juno_defconfig                    |  23 ---
>  configs/bananapi_m1_defconfig                 |  29 ---
>  configs/bananapi_m1_plus_defconfig            |  45 -----
>  configs/bananapi_m2_plus_defconfig            |  30 ----
>  configs/bananapi_m64_defconfig                |  50 ------
>  configs/friendlyarm_nanopc_t4_defconfig       |  53 ------
>  configs/friendlyarm_nanopi_a64_defconfig      |  50 ------
>  configs/friendlyarm_nanopi_m1_defconfig       |  45 -----
>  configs/friendlyarm_nanopi_m1_plus_defconfig  |  45 -----
>  configs/friendlyarm_nanopi_m4_defconfig       |  53 ------
>  configs/friendlyarm_nanopi_neo2_defconfig     |  50 ------
>  configs/friendlyarm_nanopi_neo4_defconfig     |  55 ------
>  .../friendlyarm_nanopi_neo_plus2_defconfig    |  62 -------
>  configs/friendlyarm_nanopi_r1_defconfig       |  49 -----
>  configs/orangepi_pc2_defconfig                |  50 ------
>  configs/orangepi_plus_defconfig               |  44 -----
>  configs/orangepi_prime_defconfig              |  50 ------
>  configs/orangepi_rk3399_defconfig             |  53 ------
>  configs/orangepi_win_defconfig                |  48 -----
>  configs/pine64_defconfig                      |  50 ------
>  101 files changed, 3559 deletions(-)
>  delete mode 100644 board/amarula/a64-relic/extlinux.conf
>  delete mode 100644 board/amarula/a64-relic/genimage.cfg
>  delete mode 100755 board/amarula/a64-relic/post-build.sh
>  delete mode 100644 board/amarula/a64-relic/readme.txt
>  delete mode 100644 board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
>  delete mode 100644 board/arm/juno/linux-juno-defconfig
>  delete mode 100644 board/arm/juno/readme.txt
>  delete mode 100644 board/bananapi/bananapi-m1/boot.cmd
>  delete mode 100644 board/bananapi/bananapi-m1/genimage.cfg
>  delete mode 100644 board/bananapi/bananapi-m1/readme.txt
>  delete mode 100644 board/bananapi/bananapi-m64/boot.cmd
>  delete mode 100644 board/bananapi/bananapi-m64/genimage.cfg
>  delete mode 100644 board/bananapi/bananapi-m64/readme.txt
>  delete mode 100644 board/friendlyarm/nanopc-t4/extlinux.conf
>  delete mode 100644 board/friendlyarm/nanopc-t4/genimage.cfg
>  delete mode 100755 board/friendlyarm/nanopc-t4/post-build.sh
>  delete mode 100644 board/friendlyarm/nanopc-t4/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-a64/boot.cmd
>  delete mode 100644 board/friendlyarm/nanopi-a64/genimage.cfg
>  delete mode 100644 board/friendlyarm/nanopi-a64/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-m1-plus/boot.cmd
>  delete mode 100644 board/friendlyarm/nanopi-m1-plus/genimage.cfg
>  delete mode 100644 board/friendlyarm/nanopi-m1-plus/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-m1/boot.cmd
>  delete mode 100644 board/friendlyarm/nanopi-m1/genimage.cfg
>  delete mode 100644 board/friendlyarm/nanopi-m1/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-m4/extlinux.conf
>  delete mode 100644 board/friendlyarm/nanopi-m4/genimage.cfg
>  delete mode 100755 board/friendlyarm/nanopi-m4/post-build.sh
>  delete mode 100644 board/friendlyarm/nanopi-m4/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-neo-plus2/extlinux.conf
>  delete mode 100644 board/friendlyarm/nanopi-neo-plus2/genimage.cfg
>  delete mode 100644 board/friendlyarm/nanopi-neo-plus2/linux-extras.config
>  delete mode 100755 board/friendlyarm/nanopi-neo-plus2/post-build.sh
>  delete mode 100644 board/friendlyarm/nanopi-neo-plus2/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt
>  delete mode 100644 board/friendlyarm/nanopi-neo2/boot.cmd
>  delete mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
>  delete mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-neo4/extlinux.conf
>  delete mode 100644 board/friendlyarm/nanopi-neo4/genimage.cfg
>  delete mode 100755 board/friendlyarm/nanopi-neo4/post-build.sh
>  delete mode 100644 board/friendlyarm/nanopi-neo4/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-r1/boot.cmd
>  delete mode 100644 board/friendlyarm/nanopi-r1/genimage.cfg
>  delete mode 100644 board/friendlyarm/nanopi-r1/kernel/linux-extras.config
>  delete mode 100644 board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts
>  delete mode 100644 board/friendlyarm/nanopi-r1/readme.txt
>  delete mode 100644 board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig
>  delete mode 100644 board/friendlyarm/nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts
>  delete mode 100644 board/orangepi/orangepi-pc2/boot.cmd
>  delete mode 100644 board/orangepi/orangepi-pc2/genimage.cfg
>  delete mode 100644 board/orangepi/orangepi-pc2/readme.txt
>  delete mode 100644 board/orangepi/orangepi-plus/boot.cmd
>  delete mode 100644 board/orangepi/orangepi-plus/genimage.cfg
>  delete mode 100644 board/orangepi/orangepi-plus/readme.txt
>  delete mode 100644 board/orangepi/orangepi-prime/boot.cmd
>  delete mode 100644 board/orangepi/orangepi-prime/genimage.cfg
>  delete mode 100644 board/orangepi/orangepi-prime/readme.txt
>  delete mode 100644 board/orangepi/orangepi-rk3399/extlinux.conf
>  delete mode 100644 board/orangepi/orangepi-rk3399/genimage.cfg
>  delete mode 100755 board/orangepi/orangepi-rk3399/post-build.sh
>  delete mode 100644 board/orangepi/orangepi-rk3399/readme.txt
>  delete mode 100644 board/orangepi/orangepi-win/boot.cmd
>  delete mode 100644 board/orangepi/orangepi-win/genimage.cfg
>  delete mode 100644 board/orangepi/orangepi-win/readme.txt
>  delete mode 100644 board/pine64/pine64/boot.cmd
>  delete mode 100644 board/pine64/pine64/genimage.cfg
>  delete mode 100644 board/pine64/pine64/readme.txt
>  delete mode 100644 board/sinovoip/m1-plus/boot.cmd
>  delete mode 100644 board/sinovoip/m1-plus/genimage.cfg
>  delete mode 100644 board/sinovoip/m1-plus/linux-wifi.fragment
>  delete mode 100644 board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
>  delete mode 100755 board/sinovoip/m1-plus/post-build.sh
>  delete mode 100644 board/sinovoip/m1-plus/readme.txt
>  delete mode 120000 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
>  delete mode 100644 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
>  delete mode 100644 board/sinovoip/m2-plus/boot.cmd
>  delete mode 100644 board/sinovoip/m2-plus/genimage.cfg
>  delete mode 100644 configs/amarula_a64_relic_defconfig
>  delete mode 100644 configs/arm_juno_defconfig
>  delete mode 100644 configs/bananapi_m1_defconfig
>  delete mode 100644 configs/bananapi_m1_plus_defconfig
>  delete mode 100644 configs/bananapi_m2_plus_defconfig
>  delete mode 100644 configs/bananapi_m64_defconfig
>  delete mode 100644 configs/friendlyarm_nanopc_t4_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_a64_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_m1_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_m1_plus_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_m4_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_neo2_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_neo4_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_neo_plus2_defconfig
>  delete mode 100644 configs/friendlyarm_nanopi_r1_defconfig
>  delete mode 100644 configs/orangepi_pc2_defconfig
>  delete mode 100644 configs/orangepi_plus_defconfig
>  delete mode 100644 configs/orangepi_prime_defconfig
>  delete mode 100644 configs/orangepi_rk3399_defconfig
>  delete mode 100644 configs/orangepi_win_defconfig
>  delete mode 100644 configs/pine64_defconfig
> 
> -- 
> 2.37.3
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
