Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667AC606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bv+b2cja
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 465B460705;
	Sun,  1 Nov 2026 17:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id va1o3NFvzXPA; Sun,  1 Nov 2026 17:45:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 987D860619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555136;
	b=k7WTEgDNqiVNOv9lq6qBfznvhyWnjEQMP6FkID1BbKe4cDqPLKgK0bHo/h3bnXLBPJfv
	 uH9Uf9aMySA4gz/5kDvqBYpSYTiDUB6n3qigncdX6i8ekE9gr6KMAn+YuBwGGhmUGpxv8
	 KdXX4Mkwxlz5Pql2lbjDvJ8kYyffxLSYNzwE5DWasYMfFK50rvaCzDU87cVMTFb123yb+
	 n3qBIPXlgY72WX2QnkojaK5oCWmH3AidETO4nPYy5AY1XJ6xe7pUzu4fvWwvGXR3RveP9
	 ZgxSWnkTQ7li2QhwFJKkOSyK6IkmGVdSCbpG7lhOmaz1tHcKnodRAbRJi/5KymAKcjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555136;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jeW71MzVZpeidcAzDqLfI2IavHCIdSoWCH0zY9or2M4=;
	b=HERvcICjiY3Gu5fiGXkDPFhFHruHcymmXwynAJcruAfjfVBQ9SdHs1RjXUuofCCcVIvq
	 3aR/Py2ozMSA+SwMTQ7QpJ24nprRcvQHnvMjaN8vqYnRsCq4X+UvabyIk8jEuS9lGRCgL
	 YV9LiehW3XnStGjPlGmGHj9ZZsQV7B0J3l6WKh0fzNUhpuq16VlFqSE9QjN1Kd3vhGjjy
	 xJN/icCJTBqjRYSbflnMaBUKcQS1EKvqOmgKLAoQQp47LYfM28nnYgw+sIbVVDaehxIs+
	 ruZnC7XU0MbqQ0WOaLX4xPs1nTRCymezldvqFmKjaJNut/3lCVffZGdzWLS4u+r5Oog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555136;
	bh=jeW71MzVZpeidcAzDqLfI2IavHCIdSoWCH0zY9or2M4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bv+b2cjaaTVw9RBXVYfSbD6dgWymBff1rZGU6Q6uIeqiPcZqhc9sMND9FLw6F3NRe
	 mGlw42JkB3NQ7lkbPTuGgnnA1mTcar2KBuA8mqLTvi+2lZyf/nJsZ5SlO+fa1KZZpZ
	 f2/0l2XtVHQvKLGu/O0VyK4ndI4TQeBFHK677dWXtuwI+eW68wNp3pLxD0Rs89N7Pn
	 OB2cI9K60I827LniC9hORSWnSY716zSDHIlicEbRhrI/mCPcQARStYCgKdMJlEF0Yv
	 N9qPvr1steFLh4IgO06QQG3DbvxAc8Py+e6uM588DGK0J76cUZUIS1glXN3bwSXk5q
	 +lL1kOBsdTLLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987D860619;
	Sun,  1 Nov 2026 17:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A43323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3974480D8B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6bfL6uSESwt for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:45:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 81C4E80D97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555133;
 b=T+VRGLN4xipdOkzw21Qr5lbwQhbqMj5ebsepBoh5fb7jiLxD5hnMA+N7WBkDDyuPl4cn
 zj9PocoYwENVigjgPEch/3G0ZFJf8KwYaWXyK11QClbf6GWz88r81iUUrSUIjZkKz7Ccs
 QjAdD0V8NbpO2rPGJGWR0mLpZTEJ9unFUmYv4+ZSL6/dcMAtT6v7FLuTWigJP5iSHKAw+
 6J6lTK42RBuykX6gYn6eCRt+PMV0/XgPLC86OWdSV9VDuKg/Gbj61R7TTdW6zi3XuGENv
 fYsGOcKEmHGWa+dOJqSczUGbMtBuO9aJ1DAmSy9GjoWhC4py+WOXcXGEhJlqGaSGKKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555133;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F31Yeh1yKRjCuuYU8D9mX4h8T7rO69j3jxe8uLmCcW0=;
 b=mMG7cDpgMBYOjWevtDf/0YSICo1J6PS7QDvxDn2NTgNGmGaBcfT6JGcytSVwECPuBfQQ
 ixrOlncZWHWPJUK/5IjjUP6vvkTDEuTUWsOKen1cxGOnf8rvgIOizqRhPKgZfuGUyfy5l
 s3OEK0Yk6z1ZgkNL/43L94mJ9XvEib0ZVfS6wrlXE/utxBsG/DToQcGZUPQOO2fnJMzgZ
 uhs+uRL27uUbZsch2FaCO+IBPkohRuLy8tFkdls0X0gaiAdtF4tUdCtmJ0V0I4i+dtxZQ
 u3jP1GBISlmiYopDbDCt7lD1ryf7vidsHb7tVPGV8DfiHk6wLf70y8msOPoOIi8y0Sw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81C4E80D97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49C889D53B; Sun,  1 Nov 2026 17:44:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:44:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 545b29b942c7efa00d67e9c6b36a938a5e3fdd76
X-Git-Newrev: c1490f289c129c12de1249074eac765dee1a5d9d
X-Patchwork-Hint: ignore
Message-Id: <20261101174404.49C889D53B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: remove undeeded BR2_aarch64=y now
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1490f289c129c12de1249074eac765dee1a5d9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. Since Buildroot defconfigs are supposed to be kept
in their minimal form as generated by "make savedefconfig", all
defconfigs using the AArch64 architecture are now including a
superfluous BR2_aarch64=y.

This commit removes BR2_aarch64=y from all defconfigs using AArch64
architecture.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
