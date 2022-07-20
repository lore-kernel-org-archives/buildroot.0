Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31907C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 02:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61687833CD;
	Wed, 20 Jul 2022 02:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61687833CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zFjLnvZUy7B; Wed, 20 Jul 2022 02:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571088308B;
	Wed, 20 Jul 2022 02:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571088308B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CF261BF275
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 02:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 703FB4198B
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 02:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703FB4198B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wt6ABc7gN10k for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 02:45:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 134B541972
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 134B541972
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 02:45:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.92,285,1650902400"; d="scan'208";a="207041436"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2022 10:45:36 +0800
IronPort-SDR: M43f9p9u7yThz1cQDsa6NXYMvwG0hoRRyGdtfSDy9GJuwavzWkZWsp8KFIAH2/GFshGJiP+bG2
 TXFz6XFraF8WEEwVoVW3aVDYzxeFnJwYEVqNDUS5Dqz62y6NfKrE94aV6meT4tXbhFXeDS+0Lr
 AMfdLv7EElHHkhqaDKLQQRacz/x3eBjUH1DxmHwDbtss73T1GBZ3dp+85TrhbRPoanUQ963Ufq
 gsudBx/EdNP10o62ZlL1RqXWaDjFGEd+lRo0Rgaz438R22SeK3btgmWaPCnrYbZacsSS3DkJ8A
 bnINf94idZXN243t7JK0wEcT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 19:02:02 -0700
IronPort-SDR: 8MWYQsxhvya13jdPWVM6bsh5cnxSTgrvkE3cL/NDKZLqRDfZchAdFhQmi18okngfYKiRcN33qY
 kT7V/t8ENbxr0YpG/SGKmTBMbAylOK+R9oU69aOGRHWiwJH/t+xXIq/w1K6204N4HnF6CScFTN
 4HA25/YmsA+JLxdoTk7DQkECN973lkfkELi01ZBiORvVuaFF+Qb565ME9pxU3m5Zm4yvgAcvs5
 HIZBdlFjRNSwGNldferK+hi5quDTEbCwa/82EmtsQIABuRlbZDtweVA8KK1efi+N+DzbWDKgT3
 TKE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 19:45:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lng6l4jCDz1Rwnx
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 19:45:35 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KqBF2BVgMdjC for <buildroot@buildroot.org>;
 Tue, 19 Jul 2022 19:45:34 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lng6k0vP3z1RtVk;
 Tue, 19 Jul 2022 19:45:33 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Jul 2022 11:45:24 +0900
Message-Id: <20220720024531.435748-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1658285139; x=1689821139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4rqoTWxaFN6npOYNbj0eEvfl9a60xgi9VUIe2eiSwo0=;
 b=gVj4FUwSFRoL4IKlBkM2aahO46w/CgFw6NHJEBFAoHc63KVaG8oXuj2c
 Hde2NCzIAwqxNW6QWV7eFEmVjtSN/K1HfyonH9JXvtk2yKUhYbEIxIrJH
 wzKBzd3b39XaSPkpq00ARUhwMM7+14Z610g3uTKg2UjoSPPemKElFsCUe
 Bfl5Za8oPSKhmiVwhYF3Rw2j8y1bP4n1QEHSg1pmHhWDXeiyeJj/UJ67p
 /ZfBBmATnJoft4DkqvhcmR+iBWbVvjy86UfmTWlVVD1I5YYoFa5S/uNRE
 et0tuvuSdphmeasit33Vz70pqI5at3wo/iW0WSKFal+Y6xS2aRSrmd2NT
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1658285134;
 x=1660877135; bh=4rqoTWxaFN6npOYNbj0eEvfl9a60xgi9VUIe2eiSwo0=; b=
 YNTyvT+6xRo8h920LLaqDU8U4je8varWyU+f19ug7YIXFOP1T5mEiRICNMgVkyHw
 QObuY6Hng3bvcy7+r8PB4KSYr3F7ZHdaMI4lUU73NVNiSWou4n0GQAC/ZW7z7fp7
 axmAjF2pjbg4+pI6cOQ1hjOlF5Mda1JW6sf5hmxjIqTiqEqyXE48Oc/g1EngwGZj
 m99JsBFX3mCHUELQE98vyk5de7+vbTnmgHEVwyF2dvPttVhaXtR+S9K9nFP/avOo
 HM4zRPbed6TZmJO3KBA8hFFVHGWuxUBKUNsZNHJ7nMPu0zHXagNCM4uoAHmnkpow
 Ntl1YkvxNPLnVvAhmSNVww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=gVj4FUwS; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=YNTyvT+6
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: [Buildroot] [PATCH v4 0/7] Fix RV64 NOMMU and add Canaan K210 SoC
 support
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series is a rework of the old v5 series "Add RV64 NOMMU and
Canaan K210 SoC support" already posted some (long) time ago.

This series adds support for building 64-bits RISC-V NOMMU kernels (both
bootable kernels and u-boot sdcard boot envronements) for NOMMU RISC-V
64-bits boards. The board supported include QEMU and many boards using
the dual-core RISC-V 64-bits Cannan Kendryte K210 SoC.

The first patch is a simple fix of elf2flt configuration.

Patch 2 adds the configurations files common to all K210-based boards.

The last 5 patches add support for the following K210-based boards:
* Sipeed MAIX Bit
* Sipeed MAIXDUINO
* Sipeed MAIX Dock (dan)
* Sipeed MAIX Go
* Canaan KD233 development board

For each board, a readme.txt file is added to document how to build and
install images for these boards.

Changes from v3:
* Rebased on latest master to solve a conflict in patch 1.

Changes from v2:
* Rebased patches on next branch
* Modified patch 1 to address Thomas comments
* Removed patches already applied
* Modified patches 2 to 7 to remove the BR2_PACKAGE_HOST_ELF2FLT and
  reference the global patch directory in boar/riscv/nommu

Changes from v1:
* Modified patch 5 to add the python-kflash utility as a host package as
  the new 1.1.5 version of this utility fixes the previously identified
  problems with python dependencies.
* Fixed patch 4 (qemu riscv nommu) to have buildroot configuration file
  reference kernel 5.18.
* Fixed patch 11 (kd233 board) to have buildroot configuration file
  reference kernel 5.18.
* Modified patch 7 to 11 to add the python-kflash host package to the
  buildroot configuration files. The instructions in the readme.txt
  file for each board are also updated accordingly.

Damien Le Moal (7):
  package/elf2flt: Remove Config.in.host
  board: Add common support for Canaan K210 SoC-based boards
  board: Add Sipeed MAIX-Bit board support
  board: Add Sipeed MAIXDUINO board support
  board: Add Sipeed MAIX-Dock board support
  board: Add Sipeed MAIX-Go board support
  board: Add Canaan KD233 board support

 Config.in                                     |   2 +-
 DEVELOPERS                                    |  11 +
 arch/Config.in                                |   1 +
 board/canaan/k210-soc/busybox-tiny.config     | 231 +++++++++++++
 board/canaan/k210-soc/genimage.cfg            |  30 ++
 board/canaan/k210-soc/linux-sdcard.config     |   4 +
 board/canaan/k210-soc/post-build.sh           |  28 ++
 board/canaan/k210-soc/rootfs_overlay/init     |   1 +
 .../canaan/k210-soc/rootfs_overlay/sbin/init  |  41 +++
 board/canaan/k210-soc/uboot.config            |   1 +
 board/canaan/kd233/linux-cpio.config          |   2 +
 board/canaan/kd233/readme.txt                 | 149 ++++++++
 board/sipeed/maix-bit/linux-cpio.config       |   2 +
 board/sipeed/maix-bit/readme.txt              | 316 +++++++++++++++++
 board/sipeed/maix-dock/linux-cpio.config      |   2 +
 board/sipeed/maix-dock/readme.txt             | 321 ++++++++++++++++++
 board/sipeed/maix-go/linux-cpio.config        |   2 +
 board/sipeed/maix-go/readme.txt               | 320 +++++++++++++++++
 board/sipeed/maixduino/linux-cpio.config      |   2 +
 board/sipeed/maixduino/readme.txt             | 292 ++++++++++++++++
 configs/canaan_kd233_defconfig                |  39 +++
 configs/qemu_riscv64_nommu_virt_defconfig     |   1 -
 configs/qemu_xtensa_lx60_nommu_defconfig      |   1 -
 configs/sipeed_maix_bit_defconfig             |  39 +++
 configs/sipeed_maix_bit_sdcard_defconfig      |  57 ++++
 configs/sipeed_maix_dock_defconfig            |  39 +++
 configs/sipeed_maix_dock_sdcard_defconfig     |  57 ++++
 configs/sipeed_maix_go_defconfig              |  39 +++
 configs/sipeed_maix_go_sdcard_defconfig       |  57 ++++
 configs/sipeed_maixduino_defconfig            |  39 +++
 configs/sipeed_maixduino_sdcard_defconfig     |  57 ++++
 package/elf2flt/Config.in.host                |  13 -
 toolchain/toolchain-buildroot/Config.in       |   1 -
 33 files changed, 2180 insertions(+), 17 deletions(-)
 create mode 100644 board/canaan/k210-soc/busybox-tiny.config
 create mode 100644 board/canaan/k210-soc/genimage.cfg
 create mode 100644 board/canaan/k210-soc/linux-sdcard.config
 create mode 100755 board/canaan/k210-soc/post-build.sh
 create mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 create mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/k210-soc/uboot.config
 create mode 100644 board/canaan/kd233/linux-cpio.config
 create mode 100644 board/canaan/kd233/readme.txt
 create mode 100644 board/sipeed/maix-bit/linux-cpio.config
 create mode 100644 board/sipeed/maix-bit/readme.txt
 create mode 100644 board/sipeed/maix-dock/linux-cpio.config
 create mode 100644 board/sipeed/maix-dock/readme.txt
 create mode 100644 board/sipeed/maix-go/linux-cpio.config
 create mode 100644 board/sipeed/maix-go/readme.txt
 create mode 100644 board/sipeed/maixduino/linux-cpio.config
 create mode 100644 board/sipeed/maixduino/readme.txt
 create mode 100644 configs/canaan_kd233_defconfig
 create mode 100644 configs/sipeed_maix_bit_defconfig
 create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_go_defconfig
 create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
 create mode 100644 configs/sipeed_maixduino_defconfig
 create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
 delete mode 100644 package/elf2flt/Config.in.host

-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
