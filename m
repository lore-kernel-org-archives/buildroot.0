Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C35EC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA48841601;
	Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdhGXTwdLep7; Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17AE841605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17AE841605;
	Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3879B1BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 258DA4010F
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zf4hRmlUgy-L for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25D52400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25D52400D8
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25D52400D8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso807949f8f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845300; x=1708450100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wfuNWHRBMWjzJiKPHRQmNi08ARgYmCcTCg13zw2Dgxw=;
 b=VqCTu2kdMxdqk5Wt2bronXJPUZQ3029lbkgrQyjgZ3zt9kVYPiJl3056OP5C4riBOu
 fHTex17vvycrwzXOnDPih2NdSprOtYMBNea3eGCRE1fhuuQlGtduAyQ/YoZQ8PYAe9rG
 PkkHES8xk04nVfVrtQTWV9BjDGmxb6pvksEpBikLQnEkI3v5ymw5EBRKK7I9jxhyM2xG
 uEdzO5hpmw0f+JINEPqV8QgitoSzeBZriESv9PQb9MAeP7EuEoNy+45GJVPlnvMcrvwC
 21S2itGHbla2GDlgQRMshEs4mKYGoi1A0gQP5p44p1SUOqHiX56KVwmQv4Fq2lli7i0z
 mGYQ==
X-Gm-Message-State: AOJu0YxeKeoF/Q193HuPnLeE3Me6kIPowP6ZvQf03Olp5p4kJ8wH4bR+
 26KGNzKkhlhYbn6TzHd+NTpFfn0tR4V7ZZu8Rbsg4W7/TPr36c6MT0vDNxy1TGTqXFuQPiuYFr5
 7
X-Google-Smtp-Source: AGHT+IHAbKKchb/8IYtHZSaPbozOsDFOU4VMoRGE2qiXW3SrNBfeZUmiq+zhUB/4qbvcdJLcddHang==
X-Received: by 2002:a5d:6c6d:0:b0:33c:d88b:bc5a with SMTP id
 r13-20020a5d6c6d000000b0033cd88bbc5amr2042715wrz.34.1707845300081; 
 Tue, 13 Feb 2024 09:28:20 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:19 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:27:56 +0100
Message-ID: <20240213172817.2872849-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845300; x=1708450100;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wfuNWHRBMWjzJiKPHRQmNi08ARgYmCcTCg13zw2Dgxw=;
 b=muvAYk0BOKPSKYx8y3p7/lA8my5ib6EeUs1OgjRLy3DTCv9ojKzBcSZq6j851fjk8U
 aji1PWA7RihCnV12k0hIQUWWwihSsmQ0eZNVvgadieHWiW/V5KIQaYl7hHNsbDbz0BgB
 0vTI4zlDxr6YGR8jcau3f6iU7toTwhicj0X9+5o/41ECngZzvdIJsaauQfG+W/OiZiDI
 cAHNiYxVrkptuq6aI+4j70e4PmOJ+bxT2Tc1ne3EeOznvuzgsePnSjP6UBLmyZH7ff4l
 l/rqbl0xBCKGtZMnxN8S853WtTLCBEqbkkRs8oVtnkfe9FL3st4+igSVvBcH62V+WIII
 9vnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=muvAYk0B
Subject: [Buildroot] [PATCH 00/21] Add ti_j721e_sk_defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series aim to add the SK-TDA4VM board support based on TI K3 j721e SoC.

This series start by adding U-boot binman support already submitted in the
preview series "Add support for AM62x-SK HS-FS devices" from Dario Binacchi
[1], with small improvements.
See the FOSDEM 2024 talk "Standardizing the generation and signing of boot images" [2]

With binman support, we can add the TI K3 j721e SoC support by
providing all required firmware generated by the build.

Add the new ti_j721e_sk_defconfig file to build a basic SD card image to
boot the board (serial debug and ethernet working).

Thanks to binman support, we can remove the ti-k3-image-gen tool from
Buildroot. To do that, we have to update existing defconfig (am62, am64).

Followup commits can improve TI K3 HS-FS devices based on binman instead
of legacy core-secdev-k3 tool.

[1] http://lists.busybox.net/pipermail/buildroot/2023-December/681139.html
[2] https://fosdem.org/2024/events/attachments/fosdem-2024-3067-standardizing-the-generation-and-signing-of-boot-images/slides/22808/FOSDEM24_Speaker_Slides_y7FsIKM.pdf

Best regards,
Romain

Dario Binacchi (5):
  package/python-attrs: add host variant
  package/python-rpds-py: add host variant
  package/python-referencing: add host variant
  package/python-jsonschema-specifications: add host variant
  package/python-jsonschema: add host variant

Romain Naour (16):
  DEVELOPERS: add Romain Naour for am574x_idk_defconfig
  configs/ti_am62x_sk_defconfig: fix optee-os plateform
  configs/ti_am64x_sk_defconfig: fix optee-os plateform
  boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
  boot/ti-k3-r5-loader: add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
  boot/ti-k3-r5-loader: install tiboot3.bin and sysfw.itb to
    BINARIES_DIR
  boot/ti-k3-boot-firmware: introduce
    BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_{AM62AX,AM62X,AM64X,AM65X}
  boot/uboot: use DM firmware name defined by ti-k3-boot-firmware
    package
  boot/ti-k3-boot-firmware: add BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
  boot/uboot: replace ti-k3-image-gen options by ti-k3-firmware options
  boot/uboot: enable TI K3 Device Manager (DM) for j721e
  boot/ti-k3-boot-firmware: bump to version 09.02.00.004
  configs/ti_j721e_sk_defconfig: new defconfig
  configs/ti_am62x_sk_defconfig: update to uboot 2024.01 to use binman
    tool
  configs/ti_am64x_sk_defconfig: update to uboot 2024.01 to use binman
    tool
  boot/ti-k3-image-gen: remove package

 Config.in.legacy                              |  7 ++
 DEVELOPERS                                    |  6 +-
 board/ti/j721e-sk/genimage.cfg                | 28 +++++++
 board/ti/j721e-sk/post-build.sh               | 16 ++++
 board/ti/j721e-sk/readme.txt                  | 34 ++++++++
 boot/Config.in                                |  1 -
 boot/ti-k3-boot-firmware/Config.in            | 39 ++++++++++
 .../ti-k3-boot-firmware.hash                  |  2 +-
 .../ti-k3-boot-firmware.mk                    | 16 ++--
 boot/ti-k3-image-gen/Config.in                | 77 -------------------
 boot/ti-k3-image-gen/ti-k3-image-gen.hash     |  3 -
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 54 -------------
 boot/ti-k3-r5-loader/Config.in                |  8 ++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 23 ++++++
 boot/uboot/Config.in                          | 27 ++++---
 boot/uboot/uboot.mk                           | 10 ++-
 configs/ti_am62x_sk_defconfig                 | 14 ++--
 configs/ti_am64x_sk_defconfig                 | 14 ++--
 ...62x_sk_defconfig => ti_j721e_sk_defconfig} | 34 ++++----
 package/python-attrs/python-attrs.mk          |  6 ++
 .../python-jsonschema-specifications.mk       | 10 +++
 .../python-jsonschema/python-jsonschema.mk    | 14 ++++
 .../python-referencing/python-referencing.mk  | 11 +++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 24 files changed, 275 insertions(+), 180 deletions(-)
 create mode 100644 board/ti/j721e-sk/genimage.cfg
 create mode 100755 board/ti/j721e-sk/post-build.sh
 create mode 100644 board/ti/j721e-sk/readme.txt
 delete mode 100644 boot/ti-k3-image-gen/Config.in
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
 copy configs/{ti_am62x_sk_defconfig => ti_j721e_sk_defconfig} (54%)

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
