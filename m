Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C1C606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lsrn5v6H
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D90581335;
	Fri, 30 Oct 2026 17:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFjqlV33uFvm; Fri, 30 Oct 2026 17:17:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B0D568130A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793380666;
	b=A0lVtJ08tg8TZCHIhHXPx4dp3xlh3xdfIzabVdNA+RJVad0ABz3urap1Yk8NK7cl2gsw
	 6b/cLC3jiwJlsfkoGGas6fO3Xo0wDWPS2RpJe7rkCP+pVNONV8u+Y3WSgGgpY1x886876
	 mSZBTPj7DJ0WmpOTflfBrPvXMuofCjFaXQAgwlvkvbEF4EMdVQFgsWtX6RcZxVxcUCRIo
	 c004hykLn8tGh3l9Ca2XgzdW0p710OOLwzHV612D2Lks+pUz/0rmM/akFLnUZ5LrN14lN
	 dinEFlcplks+m9LacXoGx/dxehPvt3bRtTgS41DLLOaTyhy0DNRXiprENWEiD9h5Z2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793380666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sqvk9y+xTFWHpCgM5H9Ko7hGpgBTvKSCtt+jSraCsII=;
	b=K+pFEfCLNu4zBItdFL6qoV1XVrXrhv78lLso81fkgHVYNTpW8p2dV0cgi+LkmFv6ZLK5
	 TmYQRPuNzJT4VXZwpjkgKstvsu1XtNtzAm/2uo3+YxnriXyq3j/71fccEXGjriiBXaUkj
	 iAMzG/+J6eLYABI/mUQ+7wZlanGX8eNh2yLGLlWQcQmpYbiIXq2E8Znz/gMyXLQ7zR7VJ
	 LsR23Ac2EAk4qxqM4577EUJfse73nZonEb9X6GzgNMtWlP+FxpBHAQrhNOQRZVdXKmPlG
	 L98o9Qq/Q9iqVb46EIEnHQeDsSTrcPYHNt+cIJ+wgG6mrWN2NjyJfKH4EgaK5MT0Iow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793380666;
	bh=sqvk9y+xTFWHpCgM5H9Ko7hGpgBTvKSCtt+jSraCsII=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=lsrn5v6HQK38NbS1zX9GlRE8cHwxncGp+Lwa6oGblfgJmkn2AHWTKRMHnICVIdXJ0
	 lQTbB9LZ9DEZXnL4eKT+XhL61cDvprbwdE/eGaZUsiLmL7VYUlQjTzz2fvGQLgSjUM
	 Bg4adUX18m8lCz/nd+91HMUCcKQ92sMCgpXNEqOLH7Om+WdqZGNKd8X6w/lMgU00ob
	 AcGWnh4FoDJ2ZDriJa2AQja9QvJdTYQK8lp49k1LTFtE7451ZNX2jhx/XJaXg7YkNu
	 aB616STUBD+6laUYP3AKXfR0iwcp/xDjb5ly6yN/KoRZFeH2L2PAmnaFrJmoMz6KwV
	 6gzBZwSPifR4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D568130A;
	Fri, 30 Oct 2026 17:17:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3DA8362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 17:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE460403EA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 17:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9D86u0SMTlZ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 17:17:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3910C400AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793380662;
 b=krz3ikQyqh/+kAxKW9iLlVKeYQGAwDwsZIyO/H3yFpbsA3VhYbP0Rz+hSjlLBMN0zW98
 x53hLJ6+PMFmjkJNj14txCUMMO6k3e0OIYbqxSB1eqQC+zfZYWxoXMllUY7/ZI8cpV1TA
 hqN0GlUD71ulJVdBCkJkfdB0QLymNt+5gzNUG1F112ml8U4WkGNs/Ib52F2nP6zc2dEmF
 bkRJShsTrsR1Vxfzm1/9LntDFvXh8aPlKrkah4M5/u5Uw7bbA4woRRUXMwkeAzr4KG/NR
 k1PKiP2wVWIswalaA5bHbp/tGlW8qUzcblqUsL49KFu7WttyjQqIMm6ILUekMLEUhdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793380662;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ol5g7ygJ4pSU5L/SQ8uIgL5quk4d1zuI1gm5nFG8vMY=;
 b=pHCKChn4DAEo3dhQGPTOZaNb4b1HpE0AK0CGYIfe722kvkFZ0gjbMDPHctpFwJV8KEiW
 IS0NjYNSfZq4OH1Av/J083DbnaX9p3Pqy6DCINYj/EVm1pS26NDFZkcxwifDzB72GugRh
 KPXyNQ20Xwm6oPpse5YblPGOIGONWTPdGNEO0XCB6vbY5mffxmcbasOrSOcgllYziIKZK
 J4NINBPXH26bZHqfzp1n151rQVJ53LKZhiZVoXlylV3MoxbcFQwxFOwjMPorOQjPErBAm
 1BIT9p0w4xux3ERobTBEc+aGvQHzmCdSnx5LBW72g2j5SECk8PM31HrL0kOugpkoErA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nB6hLEbO; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3910C400AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 17:17:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 22C6460134;
 Fri, 30 Oct 2026 18:16:51 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 18:16:32 +0100
Message-ID: <20261030171632.206916-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs: remove undeeded BR2_aarch64=y now
 it is the default
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Bryan Brattlof <bb@ti.com>, Meena Murthy <meena.murthy@amarulasolutions.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Joachim Wiberg <troglobit@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, Javad Rahimi <javad321javad@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Roberto Medina <robertoxmed@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Neal Frager <neal.frager@amd.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Patrik Olsson <johan.patrik.olsson@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Vincent Jardin <vjardin@free.fr>, Julien Olivain <ju.o@free.fr>,
 Dagg Stompler <daggs@gmx.com>, Michael Durrant <mdurrant@arcturusnetworks.com>,
 Gilles Talis <gilles.talis@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, Michael Walle <michael@walle.cc>,
 Stefan Nickl <Stefan.Nickl@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, Dick Olsson <hi@senzilla.io>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bilal Wasim <bilalwasim676@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. Since Buildroot defconfigs are supposed to be kept
in their minimal form as generated by "make savedefconfig", all
defconfigs using the AArch64 architecture are now including a
superfluous BR2_aarch64=y.

This commit removes BR2_aarch64=y from all defconfigs using AArch64
architecture.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/aarch64_efi_defconfig               | 1 -
 configs/arcturus_ucls1012a_defconfig        | 1 -
 configs/arm_foundationv8_defconfig          | 1 -
 configs/arm_fvp_ebbr_defconfig              | 1 -
 configs/avnet_rzboard_v2l_defconfig         | 1 -
 configs/beagleboneai64_defconfig            | 1 -
 configs/beagleplay_defconfig                | 1 -
 configs/beagley_ai_defconfig                | 1 -
 configs/chromebook_elm_defconfig            | 1 -
 configs/coolpi_4b_defconfig                 | 1 -
 configs/engicam_px30_core_defconfig         | 1 -
 configs/freescale_imx8dxlevk_defconfig      | 1 -
 configs/freescale_imx8mmevk_defconfig       | 1 -
 configs/freescale_imx8mnevk_defconfig       | 1 -
 configs/freescale_imx8mpevk_defconfig       | 1 -
 configs/freescale_imx8mqevk_defconfig       | 1 -
 configs/freescale_imx8qmmek_defconfig       | 1 -
 configs/freescale_imx8qxpmek_defconfig      | 1 -
 configs/freescale_imx91evk_defconfig        | 1 -
 configs/freescale_imx91frdm_defconfig       | 1 -
 configs/freescale_imx93evk_defconfig        | 1 -
 configs/freescale_imx93frdm_defconfig       | 1 -
 configs/friendlyarm_nanopi_r2s_defconfig    | 1 -
 configs/friendlyarm_nanopi_r3s_defconfig    | 1 -
 configs/globalscale_espressobin_defconfig   | 1 -
 configs/imx8mm-evk_defconfig                | 1 -
 configs/imx8mmpico_defconfig                | 1 -
 configs/imx8mn-ddr4-evk_defconfig           | 1 -
 configs/imx8mn_bsh_smm_s2_defconfig         | 1 -
 configs/imx8mn_bsh_smm_s2_pro_defconfig     | 1 -
 configs/imx8mp-evk_defconfig                | 1 -
 configs/imx8mqevk_defconfig                 | 1 -
 configs/imx91frdm_defconfig                 | 1 -
 configs/imx93-evk_defconfig                 | 1 -
 configs/imx93frdm_defconfig                 | 1 -
 configs/iot-gate-imx8_ebbr_defconfig        | 1 -
 configs/khadas_vim3_defconfig               | 1 -
 configs/kontron_bl_imx8mm_defconfig         | 1 -
 configs/kontron_smarc_sal28_defconfig       | 1 -
 configs/lafrite_defconfig                   | 1 -
 configs/ls1028ardb_defconfig                | 1 -
 configs/ls1043a-rdb_defconfig               | 1 -
 configs/ls1046a-frwy_defconfig              | 1 -
 configs/ls1046a-rdb_defconfig               | 1 -
 configs/nexbox_a95x_defconfig               | 1 -
 configs/nitrogen8m_defconfig                | 1 -
 configs/nitrogen8mm_defconfig               | 1 -
 configs/nitrogen8mn_defconfig               | 1 -
 configs/nitrogen8mp_defconfig               | 1 -
 configs/nvidia_bf3_defconfig                | 1 -
 configs/odroidc2_defconfig                  | 1 -
 configs/olimex_a64_olinuxino_defconfig      | 1 -
 configs/orangepi_5_plus_defconfig           | 1 -
 configs/orangepi_pc2_defconfig              | 1 -
 configs/orangepi_zero2w_defconfig           | 1 -
 configs/orangepi_zero3_defconfig            | 1 -
 configs/orangepi_zero_plus2_defconfig       | 1 -
 configs/orangepi_zero_plus_defconfig        | 1 -
 configs/pine64_defconfig                    | 1 -
 configs/polyhex_debix_model_a_defconfig     | 1 -
 configs/qemu_aarch64_ebbr_defconfig         | 1 -
 configs/qemu_aarch64_sbsa_defconfig         | 1 -
 configs/qemu_aarch64_virt_defconfig         | 1 -
 configs/raspberrypi2_64_defconfig           | 1 -
 configs/raspberrypi3_64_defconfig           | 1 -
 configs/raspberrypi4_64_defconfig           | 1 -
 configs/raspberrypi5_defconfig              | 1 -
 configs/raspberrypicm4io_64_defconfig       | 1 -
 configs/raspberrypicm4io_64_uboot_defconfig | 1 -
 configs/raspberrypicm5io_defconfig          | 1 -
 configs/raspberrypizero2w_64_defconfig      | 1 -
 configs/roc_pc_rk3399_defconfig             | 1 -
 configs/rock4se_defconfig                   | 1 -
 configs/rock5b_defconfig                    | 1 -
 configs/rockpro64_defconfig                 | 1 -
 configs/rockpro64_ebbr_defconfig            | 1 -
 configs/solidrun_clearfog_gt_8k_defconfig   | 1 -
 configs/solidrun_macchiatobin_defconfig     | 1 -
 configs/ti_am62ax_sk_defconfig              | 1 -
 configs/ti_am62px_sk_defconfig              | 1 -
 configs/ti_am62x_sk_defconfig               | 1 -
 configs/ti_am64x_sk_defconfig               | 1 -
 configs/ti_tda4vm_sk_defconfig              | 1 -
 configs/versal2_vek385_defconfig            | 1 -
 configs/versal_vck190_defconfig             | 1 -
 configs/versal_vek280_defconfig             | 1 -
 configs/versal_vpk120_defconfig             | 1 -
 configs/versal_vpk180_defconfig             | 1 -
 configs/zynqmp_kria_kd240_defconfig         | 1 -
 configs/zynqmp_kria_kr260_defconfig         | 1 -
 configs/zynqmp_kria_kv260_defconfig         | 1 -
 configs/zynqmp_zcu102_defconfig             | 1 -
 configs/zynqmp_zcu104_defconfig             | 1 -
 configs/zynqmp_zcu106_defconfig             | 1 -
 94 files changed, 94 deletions(-)

diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 78292c0cc4..81475b5f07 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
index 72f308c86d..a67c36b108 100644
--- a/configs/arcturus_ucls1012a_defconfig
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
 BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 61e2f359ce..ff71c9f3e5 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15=y
 BR2_GLOBAL_PATCH_DIR="board/arm/foundation-v8/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
diff --git a/configs/arm_fvp_ebbr_defconfig b/configs/arm_fvp_ebbr_defconfig
index 665f59c130..531c48de13 100644
--- a/configs/arm_fvp_ebbr_defconfig
+++ b/configs/arm_fvp_ebbr_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/avnet_rzboard_v2l_defconfig b/configs/avnet_rzboard_v2l_defconfig
index 285aef39bc..69c5ebf293 100644
--- a/configs/avnet_rzboard_v2l_defconfig
+++ b/configs/avnet_rzboard_v2l_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_KERNEL_HEADERS_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="rzboard_v2l"
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index b41ea09f3e..13ab2da213 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/beagleplay_defconfig b/configs/beagleplay_defconfig
index 9e45680c31..6fe15740cf 100644
--- a/configs/beagleplay_defconfig
+++ b/configs/beagleplay_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/beagley_ai_defconfig b/configs/beagley_ai_defconfig
index d0a3bf58c4..14f5163561 100644
--- a/configs/beagley_ai_defconfig
+++ b/configs/beagley_ai_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index a43b620e1b..b38df203ed 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72_a53=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_GLOBAL_PATCH_DIR="board/chromebook/elm/patches"
diff --git a/configs/coolpi_4b_defconfig b/configs/coolpi_4b_defconfig
index c9b5a86758..85ee513b3a 100644
--- a/configs/coolpi_4b_defconfig
+++ b/configs/coolpi_4b_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a76_a55=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_14=y
 BR2_GLOBAL_PATCH_DIR="board/coolpi/coolpi-4b/patches"
diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
index d59effa96f..e485ab9272 100644
--- a/configs/engicam_px30_core_defconfig
+++ b/configs/engicam_px30_core_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_GLOBAL_PATCH_DIR="board/engicam/px30core/patches"
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
index 5ec0860a52..74e99a7eb2 100644
--- a/configs/freescale_imx8dxlevk_defconfig
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
index f37c9ca935..8c479d94b5 100644
--- a/configs/freescale_imx8mmevk_defconfig
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mmevk/patches"
diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
index 057f2eff87..fa8beee4e0 100644
--- a/configs/freescale_imx8mnevk_defconfig
+++ b/configs/freescale_imx8mnevk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mnevk/patches"
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 9a5759ca04..33294760a9 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mpevk/patches"
diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index 7a7d8f7e86..eaa768b51c 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mqevk/patches"
diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
index 6740d3915f..fb5e11cd64 100644
--- a/configs/freescale_imx8qmmek_defconfig
+++ b/configs/freescale_imx8qmmek_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8qmmek/patches"
diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index ef5bef7dc6..e6136c4cbb 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
diff --git a/configs/freescale_imx91evk_defconfig b/configs/freescale_imx91evk_defconfig
index 479ff6a2e0..1d751a26ef 100644
--- a/configs/freescale_imx91evk_defconfig
+++ b/configs/freescale_imx91evk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
diff --git a/configs/freescale_imx91frdm_defconfig b/configs/freescale_imx91frdm_defconfig
index 4e94b29075..a4e8e9e726 100644
--- a/configs/freescale_imx91frdm_defconfig
+++ b/configs/freescale_imx91frdm_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index 0a39859342..09957b213a 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
diff --git a/configs/freescale_imx93frdm_defconfig b/configs/freescale_imx93frdm_defconfig
index 788af67e37..c25fb57758 100644
--- a/configs/freescale_imx93frdm_defconfig
+++ b/configs/freescale_imx93frdm_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index 6250237707..551f0cf2be 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 971a0ae851..5bbc2de911 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
index 5b4f6dcf55..321ca4904f 100644
--- a/configs/globalscale_espressobin_defconfig
+++ b/configs/globalscale_espressobin_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
diff --git a/configs/imx8mm-evk_defconfig b/configs/imx8mm-evk_defconfig
index 00fe2fa761..9f701d934c 100644
--- a/configs/imx8mm-evk_defconfig
+++ b/configs/imx8mm-evk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mm-evk/patches"
diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index d1836db61a..5355eaec9b 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_GLOBAL_PATCH_DIR="board/technexion/imx8mmpico/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
diff --git a/configs/imx8mn-ddr4-evk_defconfig b/configs/imx8mn-ddr4-evk_defconfig
index 66c95315f0..6255ede0c1 100644
--- a/configs/imx8mn-ddr4-evk_defconfig
+++ b/configs/imx8mn-ddr4-evk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mn-evk/patches"
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 3364ad15cf..761ed2a615 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index 17f834130d..482aeea3bb 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
diff --git a/configs/imx8mp-evk_defconfig b/configs/imx8mp-evk_defconfig
index 2cb7ecbbde..12db057a44 100644
--- a/configs/imx8mp-evk_defconfig
+++ b/configs/imx8mp-evk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mp-evk/patches"
diff --git a/configs/imx8mqevk_defconfig b/configs/imx8mqevk_defconfig
index bac68f40a6..aa23296bfd 100644
--- a/configs/imx8mqevk_defconfig
+++ b/configs/imx8mqevk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
diff --git a/configs/imx91frdm_defconfig b/configs/imx91frdm_defconfig
index e77d6bfd03..5ea7429a72 100644
--- a/configs/imx91frdm_defconfig
+++ b/configs/imx91frdm_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index cf03bbe3c7..8fd428dc79 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/imx93frdm_defconfig b/configs/imx93frdm_defconfig
index e97eb28c02..07b024ad3c 100644
--- a/configs/imx93frdm_defconfig
+++ b/configs/imx93frdm_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/iot-gate-imx8_ebbr_defconfig b/configs/iot-gate-imx8_ebbr_defconfig
index 460494302a..f9f9bbabbf 100644
--- a/configs/iot-gate-imx8_ebbr_defconfig
+++ b/configs/iot-gate-imx8_ebbr_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
index 32e39fc64b..7e88af270d 100644
--- a/configs/khadas_vim3_defconfig
+++ b/configs/khadas_vim3_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a73_a53=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index ba3c58693b..b36693e722 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index b1e175b7b2..08ff88e8a5 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index f23fd0ca99..73a033ab1d 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index ec3828e74a..9cdc16fd66 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1028ardb/patches"
diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index e40fade23b..44d5221e9e 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1043a-rdb/patches"
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 346931bc2d..f7a56fa7d3 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index b604f1f33a..5a43f37ef4 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 2c7ddd98b6..5f270e108d 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 92d50051ba..3066dcbc52 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 91cdcd7a96..1189b43103 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 746c9faf29..57b7143539 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 867ce7c4eb..c634a6d82a 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
index 42bcb1299d..51705c1c09 100644
--- a/configs/nvidia_bf3_defconfig
+++ b/configs/nvidia_bf3_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a78=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/nvidia/bf3/patches"
diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index acb6a03bf0..28a7e24c05 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index 6173fc8c20..017004b1ee 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/olimex/a64-olinuxino/patches"
diff --git a/configs/orangepi_5_plus_defconfig b/configs/orangepi_5_plus_defconfig
index 53a633f639..dccbfc353d 100644
--- a/configs/orangepi_5_plus_defconfig
+++ b/configs/orangepi_5_plus_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a76_a55=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-5-plus/patches"
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 180c744bae..df16cdab8a 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
index b5702e48f0..f532eff8c9 100644
--- a/configs/orangepi_zero2w_defconfig
+++ b/configs/orangepi_zero2w_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero2w/patches"
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index 53c542ab1e..fd70471553 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero3/patches"
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 2b7ad2064d..6433517be8 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 48c8e993f0..7b1f101f70 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus"
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index 9a77452a51..26fb1ec69a 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/polyhex_debix_model_a_defconfig b/configs/polyhex_debix_model_a_defconfig
index 6f8ec49410..9d4d02aa6f 100644
--- a/configs/polyhex_debix_model_a_defconfig
+++ b/configs/polyhex_debix_model_a_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/polyhex/debix-model-a/patches"
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index 8d20813044..fcbe7ae1ab 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 56c160c85a..880a21a739 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_neoverse_n2=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 19c8b86ae6..3fb87a064d 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
diff --git a/configs/raspberrypi2_64_defconfig b/configs/raspberrypi2_64_defconfig
index f8cadcb731..2fa5523883 100644
--- a/configs/raspberrypi2_64_defconfig
+++ b/configs/raspberrypi2_64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 31568129ac..b1b171ed05 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index ce79952ff7..2f7476f05d 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 63432f45d5..6043db67da 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a76=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 53f5193db4..dab24c1e8f 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/raspberrypicm4io_64_uboot_defconfig b/configs/raspberrypicm4io_64_uboot_defconfig
index 84ce16b993..01c95a0efe 100644
--- a/configs/raspberrypicm4io_64_uboot_defconfig
+++ b/configs/raspberrypicm4io_64_uboot_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/raspberrypicm5io_defconfig b/configs/raspberrypicm5io_defconfig
index 706f759832..adb92805e1 100644
--- a/configs/raspberrypicm5io_defconfig
+++ b/configs/raspberrypicm5io_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a76=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
index e926f6f23d..66b070e43f 100644
--- a/configs/raspberrypizero2w_64_defconfig
+++ b/configs/raspberrypizero2w_64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index c5c6771bdf..636e986f04 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72_a53=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
index c4e13f6a39..8956a10cfa 100644
--- a/configs/rock4se_defconfig
+++ b/configs/rock4se_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72_a53=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index bef12adaa4..87aa1e74b5 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a76_a55=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index c31365ca6b..fae585f446 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72_a53=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/rockpro64_ebbr_defconfig b/configs/rockpro64_ebbr_defconfig
index 0a8fc46e58..f1fc40e61c 100644
--- a/configs/rockpro64_ebbr_defconfig
+++ b/configs/rockpro64_ebbr_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72_a53=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
index 4187f68c2b..72c0f1006b 100644
--- a/configs/solidrun_clearfog_gt_8k_defconfig
+++ b/configs/solidrun_clearfog_gt_8k_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="clearfog-gt-8k"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for SolidRun Clearfog GT-8K"
diff --git a/configs/solidrun_macchiatobin_defconfig b/configs/solidrun_macchiatobin_defconfig
index ed511bda99..2a5005ebf4 100644
--- a/configs/solidrun_macchiatobin_defconfig
+++ b/configs/solidrun_macchiatobin_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="mcbin"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index a4c35a106e..804900d6a7 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/ti_am62px_sk_defconfig b/configs/ti_am62px_sk_defconfig
index c91f3094a2..1c64b7389d 100644
--- a/configs/ti_am62px_sk_defconfig
+++ b/configs/ti_am62px_sk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 72df755117..ed4fbf0ba1 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index f914436d2d..1166d91ed2 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/ti_tda4vm_sk_defconfig b/configs/ti_tda4vm_sk_defconfig
index be2529fb37..795ecf4919 100644
--- a/configs/ti_tda4vm_sk_defconfig
+++ b/configs/ti_tda4vm_sk_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 89d2385d1d..5fe5ecdc62 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a78=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index 5499f1a229..e8c775ec3a 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/versal_vek280_defconfig b/configs/versal_vek280_defconfig
index 4072e7cb22..1fba1a268c 100644
--- a/configs/versal_vek280_defconfig
+++ b/configs/versal_vek280_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/versal_vpk120_defconfig b/configs/versal_vpk120_defconfig
index 37f353fb21..b817720a75 100644
--- a/configs/versal_vpk120_defconfig
+++ b/configs/versal_vpk120_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
index 1a67d54bbc..71f94fdf84 100644
--- a/configs/versal_vpk180_defconfig
+++ b/configs/versal_vpk180_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 52359fcd07..46cbe60ecb 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index bf5fdfe544..3da0e62204 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index a0a1d3557b..2d6b4d2370 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 623d37140d..ef81f9ebad 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 68213bbabf..fcb144a1d5 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index da3af3c6bb..813095ed6a 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,4 +1,3 @@
-BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
