Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02222CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D8141B6C;
	Sun,  7 Apr 2024 10:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXU0P0UX4FTl; Sun,  7 Apr 2024 10:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59E0A4180D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E0A4180D;
	Sun,  7 Apr 2024 10:35:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 634891BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CCF0416DC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMgcOR1QeIk3 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E961415DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E961415DB
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E961415DB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d52e65d4a8so55362761fa.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486119; x=1713090919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mS439ZW+FduFo1jCPppJwj8/5fMZK/aUgldCOgHB9nE=;
 b=FpHAZELruUGTEzvdpL7F3Bu+HuYluFOHpzJOWP7oGDfCONAXnuJc0h35sGLTVlqTju
 GKJCRVfsw/KJvDwW0btRDitNK+z8HpUFZZpl/eZQkzyweQiRC+iUEs2RR+v9TeqZGgsn
 WcU/yGiJKRu2VFhYDEbZwSnqejeBNRsdi3kebOjTjceZDQUtB9HmAA+0lMPOXyjQz60y
 Lj+6QcyGmRilyGt8N5IqpT7JzDn1AtyDThwfVsCQyKoB+um7SSrxqdl3gPh+bgwXidLn
 bGLs7ilPnn8kgYbGgopIa9yQT5vy6Pkifs/KY0VFD3CcdCjOdhngOrPZVy+6Vep70jqD
 co9w==
X-Gm-Message-State: AOJu0YwZtXYpfb9pZ/gMjmUzIntFVHQuUvpuJeJC8orQ6GJsDcGP8wfc
 NHkZlLGHO4qfMTVLlY00dgAB8L+M3BY9UBQaXdYsG3880VX/lzJ0QgogOWu+7t/NOVW/1K+ObMn
 +
X-Google-Smtp-Source: AGHT+IGsl3WrfTb4e7fo6GGpRewxeTFTyKL9yaV9fL3ZwDJF9tFHkuFvuGgqhIEM5Zy7wDBYxjzdxA==
X-Received: by 2002:a2e:8704:0:b0:2d4:1fa4:9eb8 with SMTP id
 m4-20020a2e8704000000b002d41fa49eb8mr3505572lji.40.1712486118835; 
 Sun, 07 Apr 2024 03:35:18 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:18 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:59 +0200
Message-ID: <20240407103512.1112712-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486119; x=1713090919;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mS439ZW+FduFo1jCPppJwj8/5fMZK/aUgldCOgHB9nE=;
 b=SAv9PtnLmejZWdxAdiiDRrd3TUUACYpSAbJLTFkqQrS+URebLX6SulnBhrpYTiSHsj
 +MftrWmMHmRHri2mSbeh6RvJjLWpLd3/+F+4Bx719cKiHsFrR+vWXdZdAtk7AD7rbfjg
 NoNb84mzZoyNdIgq4YKmkhtUFbc+lNLNQ6APlHdfmsEji2WVUZ8PnEYUE7UFBFTd3bO1
 G93uAUgeHx5Kctw170IHCWeb18Ld1YHIRD/nueQGJo6V1y2eyENxph7QhpScH7xEhdgR
 0Vi5pPeO7F1dploN+reOMpBKjTp0tULkywacRClb0qsPvPd96c90YsqsbGDBz2e582/A
 dhKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=SAv9PtnL
Subject: [Buildroot] [PATCH v12 06/16] boot/ti-k3-r5-loader: install
 tiboot3.bin and sysfw.itb to BINARIES_DIR
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

With binman support enabled, u-boot for k3 r5 core (ti-k3-r5-loader)
install different target image (tiboot3*.bin) depending on the K3
SoC boot ROM:

- General Purpose devices (gp)
- High Security - Field Securable devices (hs-fs)
- High Security - Security Enforcing devices (hs)

An additional firmware binary is required on certain TI K3 devices such
as AM65 and J721e due to the "Split binary" boot flow [1]:

- Split binary with a combined firmware: (eg: AM65)
- Combined binary with a combined firmware: (eg: AM64)
- Split binary with a split firmware: (eg: J721E)
- Combined binary with a split firmware: (eg: AM62)

K3 SoC using Split Binary Boot Flow also requires sysfw-*.itb file
to boot (eg: am65, j721e). Only tiboot3*.bin is needed for other
boot flow.

From [1]:
"It's important to rename the generated tiboot3.bin and sysfw.itb
to match exactly tiboot3.bin and sysfw.itb as ROM and the wakeup
UBoot SPL will only look for and load the files with these names."

See the (not exhaustive) list of all tiboot3*.bin and sysfw*.itb file
variant found in meta-ti:

  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j722s.inc:IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/k3r5.inc:SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"

  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw.itb"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"

This firmware list can also be verified with the firmware name used in
the u-boot devicetree k3-*-binman.dtsi files.

On the SK-AM62B-P1, three tiboot3 binaries are built, one for each boot
ROM variant:

  tiboot3-am62x-gp-evm.bin
  tiboot3-am62x-hs-evm.bin
  tiboot3-am62x-hs-fs-evm.bin

A tiboot3.bin symlink is provided as default choice:

  tiboot3.bin -> tiboot3-am62x-hs-fs-evm.bin

On this board, the tiboot3.bin symlink links to the hs-fs variant
but it not always de case for all TI K3 devices.
(ex: J721e use gp variant by default).

The tiboot3.bin symlink links the -gp, -hs-fs, -hs tiboot3 binary
according to where "symlink = "tiboot3.bin";" line is located in
k3-*binman.dtsi.

As reported by Michael Walle [2], such firmware name can also be
customized by a SBC vendor [3], so we can't always be sure which
firmware to use.

If required, let the user provide a custom tiboot3 or sysfw firmware
name from the defconfig. Otherwise use the default firmware choice
by copying tiboot3.bin and sysfw.itb symlinks.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/doc/board/ti/k3.rst
[2] http://lists.busybox.net/pipermail/buildroot/2024-April/688943.html
[3] https://elixir.bootlin.com/u-boot/v2024.04/source/arch/arm/dts/k3-am625-phycore-som-binman.dtsi#L14

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v12:
- allow a custom tiboot3 and sysfw firmware name:
  http://lists.busybox.net/pipermail/buildroot/2024-April/688953.html

Changes in v11:
- Introduce BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN and BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB
  strings to provide firmware name to copy at the end of ti-k3-r5-loader build.
  This replace the "find . -regex" from provious patch version.
- Add sysfw.itb handling needed to TI K3 SoC using Split Binary Boot Flow.

Changes in v8:
- Use the `find' command in pipe with the `cp' command.

Changes in v6:
- Replace `find' command with `cp' one.

Changes in v5:
- Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
  tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin

Added in v4
---
 boot/ti-k3-r5-loader/Config.in          | 40 +++++++++++++++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 35 +++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 5f4f33b220..c0c7222a10 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -102,4 +102,44 @@ config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
 
 	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
 
+config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
+	string "tiboot3.bin binary name"
+	default "tiboot3.bin"
+	help
+	  Name of the TI K3 tiboot3.bin binary to use.
+
+	  The tiboot3 binary name must match with the TI K3 SoC boot
+	  ROM:
+
+	  - General Purpose devices (gp)
+	  - High Security - Field Securable devices (hs-fs)
+	  - High Security - Security Enforcing devices (hs)
+
+	  Or if the tiboot3 binary generated use a custom name.
+
+	  If unsure, use the default tiboot3.bin (symlink) generated by
+	  binman.
+
+config BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB
+	string "sysfw.itb binary name"
+	default "sysfw.itb"
+	help
+	  Name of the TI K3 sysfw.itb binary to use (if any required).
+
+	  sysfw*.itb are only generated for Split binary based Boot
+	  Flow (eg: am65, j721e). This option is not used on other
+	  TI K3 devices.
+
+	  The sysfw binary name must match with the TI K3 SoC boot
+	  ROM:
+
+	  - General Purpose devices (gp)
+	  - High Security - Field Securable devices (hs-fs)
+	  - High Security - Security Enforcing devices (hs)
+
+	  Or if the sysfw binary generated use a custom name.
+
+	  If unsure, use the default sysfw.itb (symlink) generated by
+	  binman.
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index cf18b43871..0191a2501c 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -73,7 +73,24 @@ TI_K3_R5_LOADER_DEPENDENCIES += \
 	host-python-pylibfdt \
 	host-python-setuptools
 TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
-endif
+
+TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
+
+define TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN
+	cp $(@D)/$(TI_K3_R5_LOADER_TIBOOT3_BIN) $(BINARIES_DIR)/tiboot3.bin
+endef
+
+TI_K3_R5_LOADER_SWSFW_ITB = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB))
+
+# sysfw*.itb are only generated for Split binary based Boot Flow (eg: am65, j721e).
+# So, if sysfw.itb symlink exist we must copy it or the custom sysfw.itb.
+define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
+	if test -e $(@D)/sysfw.itb ; then \
+		cp $(@D)/$(TI_K3_R5_LOADER_SWSFW_ITB) $(BINARIES_DIR)/sysfw.itb ; \
+	fi
+endef
+
+endif # BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
 
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
@@ -81,6 +98,22 @@ endef
 
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	$(TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN)
+	$(TI_K3_R5_LOADER_INSTALL_SWSFW_ITB)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER)$(BR_BUILDING),yy)
+
+ifeq ($(TI_K3_R5_LOADER_TIBOOT3_BIN),)
+$(error No custom tiboot3 name specified, check your BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN setting)
+endif
+
+ifeq ($(TI_K3_R5_LOADER_SWSFW_ITB),)
+$(error No custom sysfw name specified, check your BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB setting)
+endif
+
+endif # BR_BUILDING
+
 $(eval $(kconfig-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
