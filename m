Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA805C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 13:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 854E3606BA;
	Sun,  2 Jun 2024 13:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2cwOCY6B3wp; Sun,  2 Jun 2024 13:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7545E60760
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7545E60760;
	Sun,  2 Jun 2024 13:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF1041BF83B
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 13:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989B681416
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 13:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CY63m96g7bim for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 13:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DD8380AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD8380AE6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DD8380AE6
 for <buildroot@busybox.net>; Sun,  2 Jun 2024 13:07:47 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaad2c670aso1996521fa.1
 for <buildroot@busybox.net>; Sun, 02 Jun 2024 06:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717333665; x=1717938465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZ5iXj7wjVrvlDKElOSDyNSxzplHeMFMFE3JKmdrx88=;
 b=Z3pohjg8Vkh8zI0tESqGYZt5BDsEovNArZ8MQqbic9iOLbx/ZxqqHi//Hp3Ld2fzZ4
 VdppK7OBnEVGC0RWRoeMTwHugagaoACQsO4crm1Dwkjt7pA6CWPwNOLi9WWjZFSOe6VC
 SpnxIDiwnIHYJGguNtEoBhdEL0xj9toiQb9WRcd9STGOX4b4cwHHykLuJ/662rR5iVWL
 WXk7UauQYopLvkSwOFylTol/VMmr+OQyahS0TX5Gcu599Rw7lVw8gr+z2m6WCFBJljwi
 V6nwQmXyZqDra5qlBlS3H4CjMuG+SaC1PGlGG0fD1hUomFei1umzAMdlnYVd5SUo0PtZ
 pJeQ==
X-Gm-Message-State: AOJu0YxlWylplnWl0CXMaZb2NXbpt1un0oUvZlizww0lRDrVkwzZJap7
 OxrVdnv6xD6zIxuvg8AQV1rOmB4v/HsmRi9CwbPdFUXnPssoMWO1A2hyDa79V09y+w8cYUjOiiS
 hag==
X-Google-Smtp-Source: AGHT+IHWyzPO65Z4x/6/aQaRbaj5bMBCCPnUciCZTxgD+9k4x1XyDAabX8bgdKmUVo8as04zWqIVjA==
X-Received: by 2002:a2e:7314:0:b0:2e9:865e:4ab1 with SMTP id
 38308e7fff4ca-2ea950b558dmr39502131fa.6.1717333664941; 
 Sun, 02 Jun 2024 06:07:44 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064b684sm6227156f8f.100.2024.06.02.06.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 06:07:44 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  2 Jun 2024 15:07:32 +0200
Message-ID: <20240602130733.931870-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717333665; x=1717938465; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jZ5iXj7wjVrvlDKElOSDyNSxzplHeMFMFE3JKmdrx88=;
 b=BhkNgBPdtyXBk9Q3I2iHhYb4WmTIm/69AuiEekRQFqgH/J3Aw04dGniW1CFt8Vlte/
 BKJpBTiK0+erxB/kKwD+xSFr2NwrMji0bdGRGA89WMVJBqnz1pRtiAOqKRUpwcgaaEfI
 VTziZ1LfPMYwyUC9P6O3iSXMr4okQzX+J7MzU3NcNWuW70m5zDl94eURNpgWDw8SVETp
 Gj2Q+MYNEvpOKEWpPpRKASk+oY9wkfJDgl8LJ3QYv4X9qmpFtTcfpZJHomHkzcoqdaH4
 1AibuLNU0qGZitbeJVFbt8t/26aDRLT3dxkxbhrcF7DGRtELQ0cSBybQnLJgyeaYDMAc
 A1nA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=BhkNgBPd
Subject: [Buildroot] [PATCH] configs/ls1028ardb: add hashes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .checkpackageignore                                          | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 ++
 .../ls1028ardb/patches/linux-headers/linux-headers.hash      | 1 +
 board/freescale/ls1028ardb/patches/linux/linux.hash          | 2 ++
 board/freescale/ls1028ardb/patches/uboot/uboot.hash          | 2 ++
 configs/ls1028ardb_defconfig                                 | 5 +++--
 6 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/ls1028ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/ls1028ardb/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 201ec2a85..bee31d240 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -215,7 +215,6 @@ configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
 configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
-configs/ls1028ardb_defconfig lib_defconfig.ForceCheckHash
 configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
 configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000..17c409530
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0dda154c335e1a50c727601e698b6a0827e3f92308873b373449fb888df5acfd  atf-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash b/board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000..5808d92af
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
new file mode 100644
index 000000000..bd5e29d02
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6db58cf91b98f7fc279f341279a5d43d4069fb56a660a34209aba6af53ea2b57  linux-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
new file mode 100644
index 000000000..d0cc110fd
--- /dev/null
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6279c161ad8a218b549e6631be969b74f358cf01a20103953ccaf3bb14185ac2  u-boot-LSDK-21.08.tar.gz
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index d92c543b4..462e642c3 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -2,8 +2,9 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 
-# patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
+# Build
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1028ardb/patches board/freescale/common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 # Toolchain
 # Linux headers same as kernel, a 5.10 series
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
