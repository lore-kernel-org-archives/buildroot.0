Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3AEC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 07:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF4F41680;
	Tue,  7 Jun 2022 07:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sluj7NmnQV0x; Tue,  7 Jun 2022 07:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7080B419B2;
	Tue,  7 Jun 2022 07:29:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD9711BF2C1
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9360404B3
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 07:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U78OZ9z24kIO for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 07:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA2C7404B0
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 07:29:37 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r200so8674067iod.5
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zGKnYBP+mWePe/q+2gqE3T956Yg+oo/ktov+XVrzASE=;
 b=i47ncMW58TxVUavmNj+qRI3HEb5g38s8n70qPivdkjRxK0/ZR6E6wwc/LW0A8LVAv9
 Ugb8qlZFD38JzjV6OY4YHiibXTSCVzxfZOUBQqw4A+JEcjQirbgS7naaZWLkyvLghfZO
 DvRjSZmpfoVEEz3n01yB3ahMww5L/jA4E2A4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zGKnYBP+mWePe/q+2gqE3T956Yg+oo/ktov+XVrzASE=;
 b=5ZeEEeU+3EMn5qygi8t5F6n6WrxLSkC5jE7cNW182Eealo8pU8RI9FWFpAlHPkJ56l
 23w/LEZQ2ybphbLOLisfGByeWNzJwtNbKVInDSBm+nrYoTEUwy9juOt0xT5vrgJXUUWv
 SDarJHBIMC7BteDK26gy73ZawxipEkQb2pYZV5V2xDFHCX05mPeGUVP3mVIo1x+E94zB
 HRYGgRAD2y/InCvIzVvEwcjFHy+y8lhBHpe4xaAbqoClsjMXRre+nRDmsAe+GTpdUfDT
 E+IR2eXSL1qTp5kvbok38OPA4NbLQeaITwGl6xXp5qPRDuFVLV0t6xNDpvwftq2X+kyX
 JapA==
X-Gm-Message-State: AOAM530y2ODTF68Dh7wxe+yIyPd3S0t5MK132QiU0n28ROOETFt8haDh
 Q4TK1bfoBaOXzAvKjS5VpyyPfqunXiz7gw==
X-Google-Smtp-Source: ABdhPJzsDp2a6NtLtdxpXQvIqBWAUljJuNu2PtPw1/JBsbVG8VFvnU27dh/22X9ShmIaErhpjcGOpA==
X-Received: by 2002:a05:6602:1346:b0:669:35d4:1a81 with SMTP id
 i6-20020a056602134600b0066935d41a81mr8666078iov.112.1654586976505; 
 Tue, 07 Jun 2022 00:29:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-80-116-90-174.retail.telecomitalia.it. [80.116.90.174])
 by smtp.gmail.com with ESMTPSA id
 cx4-20020a056638490400b0033126faae3asm6406075jab.116.2022.06.07.00.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 00:29:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 09:28:49 +0200
Message-Id: <20220607072852.1007185-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Add support for BSH smm s2 [pro] boards
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
Cc: michael@amarulasolutions.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Samuel Martin <s.martin49@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 dario.binacchi@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series applies the changes requested by Arnout Vandecappelle to the
V3 patch for adding support to BSH smm s2 pro board ([1]). It also adds
the support for the BSH smm s2 board and It builds the uuu package, used
for flashing the boards, as part of buildroot.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220131145555.2819020-1-michael@amarulasolutions.com/

Dario Binacchi (2):
  package/uuu: new package
  board/bsh: add support for iMX8MN BSH SMM S2 board

Michael Trimarchi (1):
  board/bsh: add support for iMX8MN BSH SMM S2 PRO board

 DEVELOPERS                                    |  11 +
 .../bsh/common/imx8mn-bsh-smm-s2/linux.config | 833 ++++++++++++++++++
 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf |   4 +
 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh      |  19 +
 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg  |  17 +
 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh |   7 +
 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh |   3 +
 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt    |  73 ++
 board/bsh/imx8mn-bsh-smm-s2/flash.sh          |  22 +
 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst     |  48 +
 ...dmaengine-mxs-fix-driver-registering.patch |  63 ++
 ..._nand-Fix-specific-hook-registration.patch |  78 ++
 ...-mxs_nand_spl-Fix-bad-block-skipping.patch | 165 ++++
 ...x-cmd_nandbcb-fix-bad-block-handling.patch |  95 ++
 ...d-Fix-bad-block-handling-in-fitImage.patch |  42 +
 ...h-to-nand-spl-load-instead-of-romapi.patch |  30 +
 ...Remove-rootwait-1-to-all-the-affecte.patch | 159 ++++
 ...gs-imx8mn_bsh_smm_s2-add-NAND-driver.patch |  42 +
 ...s-imx8mn_bsh_smm_s2-add-UBI-commands.patch |  29 +
 ...sh_smm_s2-remove-console-from-bootar.patch |  32 +
 ..._bsh_smm_s2-add-mtdparts-to-bootargs.patch |  30 +
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh     |   4 +
 board/bsh/imx8mn-bsh-smm-s2/readme.txt        |  75 ++
 configs/imx8mn_bsh_smm_s2_defconfig           |  44 +
 configs/imx8mn_bsh_smm_s2_pro_defconfig       |  41 +
 package/Config.in.host                        |   1 +
 package/uuu/Config.in.host                    |  18 +
 package/uuu/readme.txt                        |  13 +
 package/uuu/uuu.hash                          |   4 +
 package/uuu/uuu.mk                            |  19 +
 30 files changed, 2021 insertions(+)
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/linux.config
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2/flash.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/linux/0001-dmaengine-mxs-fix-driver-registering.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0001-nand-raw-mxs_nand-Fix-specific-hook-registration.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0002-mtd-nand-mxs_nand_spl-Fix-bad-block-skipping.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0003-arm-mach-imx-cmd_nandbcb-fix-bad-block-handling.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0004-spl-spl_nand-Fix-bad-block-handling-in-fitImage.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0005-board-bsh-Switch-to-nand-spl-load-instead-of-romapi.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0006-include-configs-Remove-rootwait-1-to-all-the-affecte.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0007-configs-imx8mn_bsh_smm_s2-add-NAND-driver.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0008-configs-imx8mn_bsh_smm_s2-add-UBI-commands.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0009-configs-imx8mn_bsh_smm_s2-remove-console-from-bootar.patch
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/patches/uboot/0010-configs-imx8mn_bsh_smm_s2-add-mtdparts-to-bootargs.patch
 create mode 100755 board/bsh/imx8mn-bsh-smm-s2/post-build.sh
 create mode 100644 board/bsh/imx8mn-bsh-smm-s2/readme.txt
 create mode 100644 configs/imx8mn_bsh_smm_s2_defconfig
 create mode 100644 configs/imx8mn_bsh_smm_s2_pro_defconfig
 create mode 100644 package/uuu/Config.in.host
 create mode 100644 package/uuu/readme.txt
 create mode 100644 package/uuu/uuu.hash
 create mode 100644 package/uuu/uuu.mk

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
