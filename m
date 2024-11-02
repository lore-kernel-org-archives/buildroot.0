Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD84E67802
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 15:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 562F382070;
	Sat,  2 Nov 2024 15:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1kTOTn0hv6c; Sat,  2 Nov 2024 15:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B05FB820B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05FB820B4;
	Sat,  2 Nov 2024 15:21:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D5427E1
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65BB94247F
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vbs6IfRb_HxJ for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 15:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30F744247B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30F744247B
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30F744247B
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:17 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c937982445so312988a12.2
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 08:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730560875; x=1731165675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1g1BPrjgvEv3EYDHL3yF/PdM/FQvAYHR915Q5XarYY8=;
 b=Hv9HjnRuMV2za5jLHXPqIFsDqUuc0rQqD4JV5QZF5sJGXYIowjPptQPfdgWTKTeBfQ
 6lOL8hQXb/k0uYhZrNvEek83G8qCG4eHCt94pi7MlsNR8xqsjsY3e7K1cHg7yWDz1Enl
 zq3N2NbkRbztg6QBaWp4WyMR1GLicI6JqjAawXKGpMC2v+G2yORUfEDdRiZxVvp6Qgwx
 ugVmFtcdKgphK+YRxQPUFaAU9qc0UsUdyLpBIquVx1C3QIiPnQ7tqvQXYZg5O3wDPK/t
 m9E0xUGGFp/6J+AN45hBdmGPn84aXbDRe8fo0y8rb1HPBdh3L1XA7/5ghhoOTeMIGMcp
 MTrA==
X-Gm-Message-State: AOJu0YxPomYchW7l5qyYg4eVl53RHM8w1INtte0I3Fox1+1cAzR4egTY
 MkbwBlMVZxC7UBCUtTXmCURVBLOhJF0x9OBm2Cdnym5Q+cmvxgpDsvuRWGfZ
X-Google-Smtp-Source: AGHT+IHU9B2RzMLJxO7Wb8SVH/TTysEQ80qgYQObmTUG+jjVslXfrOOUzZvCsCxl3NckNc4HpDNrHg==
X-Received: by 2002:a05:6402:3586:b0:5c9:11d9:f9a8 with SMTP id
 4fb4d7f45d1cf-5cbbf875191mr9273732a12.2.1730560875096; 
 Sat, 02 Nov 2024 08:21:15 -0700 (PDT)
Received: from skbuf.lan ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74ced8sm2587535a12.17.2024.11.02.08.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 08:21:13 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sat,  2 Nov 2024 17:20:59 +0200
Message-ID: <20241102152106.2153747-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730560875; x=1731165675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1g1BPrjgvEv3EYDHL3yF/PdM/FQvAYHR915Q5XarYY8=;
 b=OLTeM5IwmBi46hzXz04wfcvKfb6XfXQau2h/b/h4o2Elnud6ouxqG2LpbuBSaR1MHq
 vAW2xkENMmkUixJ301UCF6RXCLrGi72HSnCToWpvvroI5/k0MXXWCd1CKARfRFf02HvY
 rwa+CpduX2KsP+CJh8kqyOk8OMNTdL2rjdkJvY25wBKkbkT6gkHGLotEgdctuy486D/M
 EWY7g1dm1TtgEn9MPZ8dGLaeohf/hHbaRKs+DdJ3vnLXPhgOVffoDe0Z49LADDapt0cJ
 zm4YvZc31uojrUPL7sWrWr30jSZ5kDTA6cyo5GF2zVSglUNXSmmnB/7AZSVowgpe0rRD
 YRpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OLTeM5Iw
Subject: [Buildroot] [PATCH 0/7] Initial support for SolidRun LX2160A-CEX7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series aims to introduce basic initial support for the CX LX2
and HoneyComb LX2 boards by SolidRun (both of which are based on the
LX2160A-CEX7 SoM):
https://shop.solid-run.com/product/SRLX216S00D00GE064C08CH/
https://shop.solid-run.com/product/SRLX216S00D00GE064H09CH/

Although I also work at NXP, I am submitting this in a personal
capacity, and for personal use.

Patch 1/7 performs an uprev of existing NXP Layerscape BSP packages to
the latest tag. This is necessary because packages such as the RCW do
not permit versioning per board defconfig like Linux/U-Boot/ATF do,
instead the version is global. I've tested the uprev on an LS1028A-RDB.

Patches 2-5/7 add extra packages which are critical for the operation of
the NXP LX2160A SoC.

Patch 6/7 introduces the board files for the new platform. In my use
case, Buildroot makes the firmware and recovery Linux rootfs for the
main Debian operating system.

Note that the platform doesn't achieve everything that I wish just yet.
For example, U-Boot doesn't boot properly from a USB stick with a Debian
installer on it.

To launch the Debian installer, U-Boot attempts to push its own device
tree to Linux (and that doesn't go very well, because they have
partially incompatible formats). Thus, one would need to uprev the
bootloader to the current upstream master branch, rather than continue
developing on top of NXP Linux Factory tags, then sync the U-Boot device
trees with Linux, and upstream that work.

For this reason, the entire effort should be considered WIP, though in
itself, it is bootable and usable. I am submitting relatively early
because the speed of development in Buildroot appears fast, and the
existing work would go out of sync quickly. I intend to work with
Josua Mayer for developing further U-Boot/ATF patches, and including
them in Buildroot only once they are available through
https://github.com/SolidRun/lx2160a_build/, rather than Buildroot
behaving as its own upstream of sorts.

Finally, patch 7/7 is a cleanup made as I noticed that
board/freescale/common/patches has become a leftover since I started
working on the LX2160ACEX7 support.

Vladimir Oltean (7):
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0
  package/qoriq-ddr-phy-binary: new package
  package/qoriq-mc-binary: new package
  package/qoriq-mc-utils: new package
  package/qoriq-restool: new package
  board/lx2160acex7: new platform
  board/freescale: get rid of common patch folder

 DEVELOPERS                                    |    6 +
 ...Makefile-Suppress-array-bounds-error.patch |   51 -
 .../arm-trusted-firmware.hash                 |    2 +-
 .../ls1028ardb/patches/linux/linux.hash       |    2 +-
 .../ls1028ardb/patches/uboot/uboot.hash       |    2 +-
 board/freescale/ls1028ardb/readme.txt         |   15 +-
 .../arm-trusted-firmware.hash                 |    2 +-
 .../ls1046a-frwy/patches/linux/linux.hash     |    2 +-
 .../ls1046a-frwy/patches/uboot/uboot.hash     |    2 +-
 board/freescale/ls1046a-frwy/readme.txt       |   17 +-
 board/solidrun/lx2160acex7/extlinux.conf      |    4 +
 board/solidrun/lx2160acex7/genimage.cfg       |   54 +
 board/solidrun/lx2160acex7/linux.config       |    1 +
 .../0001-plat-nxp-lx2160a-auto-boot.patch     |  219 +
 ...ccount-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch |   85 +
 ...sert-SUS_S5-GPIO-to-poweroff-the-COM.patch |   29 +
 ...assert-IRQ0-GPIO-to-poweroff-the-EVB.patch |   29 +
 ...ptional-S5-gpio-from-Makefile-consta.patch |   63 +
 ...te-platform-for-solidrun-cex7-module.patch |  418 ++
 ...flexible-value-for-CONFIG_DDR_NODIMM.patch |   33 +
 ...tform-for-solidrun-internal-cex6-eva.patch |  544 +++
 ...ort-flushing-i2c-bus-before-ddr-init.patch |  365 ++
 ...h-i2c-bus-with-spd-eeprom-before-ddr.patch |   30 +
 ...h-i2c-bus-with-spd-eeprom-before-ddr.patch |   30 +
 ...-building-without-NXP_NV_SW_MAINT_LA.patch |   49 +
 ...-boot-without-spi-flash-disable-non-.patch |   33 +
 ...te-platform-for-solidrun-lx2162a-som.patch |  597 +++
 ...d-support-for-new-binutils-versions.patch} |    0
 .../arm-trusted-firmware.hash                 |    2 +
 .../patches/linux-headers/linux-headers.hash  |    1 +
 .../lx2160acex7/patches/linux/linux.hash      |    2 +
 ...x2160-cex7-based-clearfog-cx-dpl-dpc.patch |  937 +++++
 ...160-cex6-based-evaluation-board-dpl-.patch | 1454 +++++++
 ...n-for-lx2162a-som-and-clearfog-board.patch | 3622 +++++++++++++++++
 ...som-clearfog-enable-dpni-connections.patch |  188 +
 ...rfog-cx-configure-qsfp-ports-type-ph.patch |   52 +
 ...n-solidrun-lx2160a-cex-7-on-clearfog.patch |  951 +++++
 ...-MEM_PLL_CFG-into-ddr-speed-specific.patch |  112 +
 ...separate-configurations-for-flexspi-.patch |  894 ++++
 ...me-sdhc1-config-to-generic-sdhc-for-.patch |  149 +
 ...c-jumpc-and-jump-to-pbi-instructions.patch |   55 +
 ...add-configuration-for-both-sdhc-xspi.patch |  836 ++++
 ...ootlocptr-reduce-size-of-pbi-section.patch |   90 +
 ...ge-2.2GHz-configuration-platform-clo.patch |  475 +++
 ...configuration-for-fraction-ddr-speed.patch |  421 ++
 ...n-solidrun-internal-lx2160a-cex6-eva.patch |  220 +
 ...le-A-050426-workaround-for-silicon-o.patch |   35 +
 ...le-pci-errata-workarounds-for-all-ac.patch |   87 +
 ...-configuration-for-2.2GHz-binned-soc.patch |   42 +
 .../0014-lx2162aqds-re-enable-dpmac11.patch   |   27 +
 ...n-for-lx2162a-som-and-clearfog-evalu.patch |  532 +++
 ...rfog-cx-add-configuration-for-serdes.patch | 2000 +++++++++
 ...d-solidrun-lx2160-cex7-board-support.patch | 1342 ++++++
 ...ait-100ms-for-Link-Up-in-ls_pcie_g4_.patch |   65 +
 ...t-100ms-for-Link-Up-in-ls_pcie_probe.patch |   64 +
 ...-calculation-of-ddr-clock-rate-to-in.patch |   63 +
 ...able-workaround-for-SPI-erratum-A-05.patch |  102 +
 ...x2160-cex7-enable-additional-drivers.patch |   96 +
 .../lx2160acex7/patches/uboot/uboot.hash      |    2 +
 board/solidrun/lx2160acex7/post-build.sh      |    8 +
 board/solidrun/lx2160acex7/readme.txt         |  112 +
 .../udev/rules.d/74-dpaa2-networking.rules    |   12 +
 .../lx2160acex7/u-boot-environment-sd.txt     |   96 +
 configs/ls1028ardb_defconfig                  |    6 +-
 configs/ls1046a-frwy_defconfig                |    6 +-
 configs/solidrun_lx2160acex7_defconfig        |   53 +
 package/Config.in                             |    4 +
 package/fmc/fmc.hash                          |    2 +-
 package/fmc/fmc.mk                            |    2 +-
 package/fmlib/fmlib.hash                      |    2 +-
 package/fmlib/fmlib.mk                        |    2 +-
 .../qoriq-cadence-dp-firmware.hash            |    2 +-
 .../qoriq-cadence-dp-firmware.mk              |   10 +-
 package/qoriq-ddr-phy-binary/Config.in        |    6 +
 .../qoriq-ddr-phy-binary.hash                 |    3 +
 .../qoriq-ddr-phy-binary.mk                   |   18 +
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash    |    2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk      |    2 +-
 package/qoriq-mc-binary/Config.in             |   48 +
 package/qoriq-mc-binary/qoriq-mc-binary.hash  |    3 +
 package/qoriq-mc-binary/qoriq-mc-binary.mk    |   22 +
 package/qoriq-mc-utils/Config.in              |   35 +
 package/qoriq-mc-utils/qoriq-mc-utils.hash    |    3 +
 package/qoriq-mc-utils/qoriq-mc-utils.mk      |   22 +
 package/qoriq-rcw/qoriq-rcw.hash              |    2 +-
 package/qoriq-rcw/qoriq-rcw.mk                |    2 +-
 package/qoriq-restool/Config.in               |   21 +
 package/qoriq-restool/qoriq-restool.hash      |    3 +
 package/qoriq-restool/qoriq-restool.mk        |   24 +
 89 files changed, 18044 insertions(+), 91 deletions(-)
 delete mode 100644 board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
 create mode 100644 board/solidrun/lx2160acex7/extlinux.conf
 create mode 100644 board/solidrun/lx2160acex7/genimage.cfg
 create mode 100644 board/solidrun/lx2160acex7/linux.config
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0001-plat-nxp-lx2160a-auto-boot.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0002-dcfg-Take-into-account-MEM_PLL_CFG_SHIFT-for-ddr-fre.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0003-lx2160acex7-assert-SUS_S5-GPIO-to-poweroff-the-COM.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0004-lx2160acex6-assert-IRQ0-GPIO-to-poweroff-the-EVB.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0005-lx2160a-assert-optional-S5-gpio-from-Makefile-consta.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0006-add-separate-platform-for-solidrun-cex7-module.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0007-lx2160a-support-flexible-value-for-CONFIG_DDR_NODIMM.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0008-add-separate-platform-for-solidrun-internal-cex6-eva.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0009-lx2160a-support-flushing-i2c-bus-before-ddr-init.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0010-lx2160acex6-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0011-lx2160acex7-flush-i2c-bus-with-spd-eeprom-before-ddr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0012-plat-lx2160a-fix-building-without-NXP_NV_SW_MAINT_LA.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0013-plat-lx2160a-fix-boot-without-spi-flash-disable-non-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/0014-add-separate-platform-for-solidrun-lx2162a-som.patch
 rename board/{freescale/common/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch => solidrun/lx2160acex7/patches/arm-trusted-firmware/0015-feat-build-add-support-for-new-binutils-versions.patch} (100%)
 create mode 100644 board/solidrun/lx2160acex7/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/solidrun/lx2160acex7/patches/linux-headers/linux-headers.hash
 create mode 100644 board/solidrun/lx2160acex7/patches/linux/linux.hash
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0001-add-solidrun-lx2160-cex7-based-clearfog-cx-dpl-dpc.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0002-add-solidrun-lx2160-cex6-based-evaluation-board-dpl-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0003-add-configuration-for-lx2162a-som-and-clearfog-board.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0004-lx2162-som-clearfog-enable-dpni-connections.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-mc-utils/0005-lx2160acex7-clearfog-cx-configure-qsfp-ports-type-ph.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0001-add-configuration-solidrun-lx2160a-cex-7-on-clearfog.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0002-lx2160acex7-move-MEM_PLL_CFG-into-ddr-speed-specific.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0003-lx2160acex7-add-separate-configurations-for-flexspi-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0004-lx2160acex7-rename-sdhc1-config-to-generic-sdhc-for-.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0005-add-loadc-jumpc-and-jump-to-pbi-instructions.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0006-lx2160acex7-add-configuration-for-both-sdhc-xspi.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0007-bootlocptr-reduce-size-of-pbi-section.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0008-lx2160acex7-change-2.2GHz-configuration-platform-clo.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0009-lx2160acex7-add-configuration-for-fraction-ddr-speed.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0010-add-configuration-solidrun-internal-lx2160a-cex6-eva.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0011-lx2160acex7-enable-A-050426-workaround-for-silicon-o.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0012-lx2160acex6-enable-pci-errata-workarounds-for-all-ac.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0013-lx2160acex6-add-configuration-for-2.2GHz-binned-soc.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0014-lx2162aqds-re-enable-dpmac11.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0015-add-configuration-for-lx2162a-som-and-clearfog-evalu.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/qoriq-rcw/0016-lx2160acex7-clearfog-cx-add-configuration-for-serdes.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0001-add-solidrun-lx2160-cex7-board-support.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0002-pci-ls_pcie_g4-Wait-100ms-for-Link-Up-in-ls_pcie_g4_.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0003-pci-ls_pcie-Wait-100ms-for-Link-Up-in-ls_pcie_probe.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0004-fsl-lsch3-update-calculation-of-ddr-clock-rate-to-in.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0005-armv8-lx2160a-enable-workaround-for-SPI-erratum-A-05.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0006-configs-lx2160-cex7-enable-additional-drivers.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/uboot.hash
 create mode 100755 board/solidrun/lx2160acex7/post-build.sh
 create mode 100644 board/solidrun/lx2160acex7/readme.txt
 create mode 100644 board/solidrun/lx2160acex7/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/solidrun/lx2160acex7/u-boot-environment-sd.txt
 create mode 100644 configs/solidrun_lx2160acex7_defconfig
 create mode 100644 package/qoriq-ddr-phy-binary/Config.in
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
 create mode 100644 package/qoriq-mc-binary/Config.in
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.hash
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.mk
 create mode 100644 package/qoriq-mc-utils/Config.in
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.hash
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.mk
 create mode 100644 package/qoriq-restool/Config.in
 create mode 100644 package/qoriq-restool/qoriq-restool.hash
 create mode 100644 package/qoriq-restool/qoriq-restool.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
