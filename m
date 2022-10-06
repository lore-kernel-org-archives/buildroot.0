Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E66C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F6BE83FC1;
	Thu,  6 Oct 2022 18:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F6BE83FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyIajfBM--o9; Thu,  6 Oct 2022 18:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF8783FBD;
	Thu,  6 Oct 2022 18:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF8783FBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27AFD1BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C2FA419E5
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2FA419E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBJzamFg4PGx for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56BB9419DE
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BB9419DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FEE086938; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:54:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b35597decbef4a26dcb662028357d2ac51b0978f
X-Git-Newrev: 1bd8e718a683a4af5db7f3aedb66717b45cdf2fc
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.4FEE086938@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/{canaan,
 sipeed_maix}*: specify kernel headers version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1bd8e718a683a4af5db7f3aedb66717b45cdf2fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfigs use a 5.19 kernel, so specify 5.19 kernel headers now that is
available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/canaan_kd233_defconfig            | 3 +++
 configs/sipeed_maix_bit_defconfig         | 3 +++
 configs/sipeed_maix_bit_sdcard_defconfig  | 3 +++
 configs/sipeed_maix_dock_defconfig        | 3 +++
 configs/sipeed_maix_dock_sdcard_defconfig | 3 +++
 configs/sipeed_maix_go_defconfig          | 3 +++
 configs/sipeed_maix_go_sdcard_defconfig   | 3 +++
 configs/sipeed_maixduino_defconfig        | 3 +++
 configs/sipeed_maixduino_sdcard_defconfig | 3 +++
 9 files changed, 27 insertions(+)

diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 3aa5dccf08..77b8abf531 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index d2bac9e0b8..d73ba0266a 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index e1c9dc417e..8a19996090 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index a7f0441e53..ccb563310e 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 6b7f8d9c68..d3d0f405e1 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index a68f9d3b72..c3bcf98f81 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index a127872cd8..75300997b8 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index c52adb5db7..a30596af92 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # Binary format
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index baaa2bc7bb..add9369747 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -10,6 +10,9 @@ BR2_RISCV_ISA_CUSTOM_RVC=y
 # BR2_RISCV_USE_MMU is not set
 BR2_RISCV_ABI_LP64D=y
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # System
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
