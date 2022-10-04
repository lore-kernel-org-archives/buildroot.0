Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DA3C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 19:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED00960A7B;
	Tue,  4 Oct 2022 19:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED00960A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-L6HQCB75U1; Tue,  4 Oct 2022 19:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 197E9607C7;
	Tue,  4 Oct 2022 19:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 197E9607C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 428AA1BF405
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC22D400BF
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC22D400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKhZI-WeFuVJ for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 19:54:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB37740132
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB37740132
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:54:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 834D0D2F60
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:51:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2B92240003;
 Tue,  4 Oct 2022 19:50:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ofnwP-003uT3-6d; Tue, 04 Oct 2022 21:50:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 21:50:37 +0200
Message-Id: <20221004195039.931947-9-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004195039.931947-1-peter@korsgaard.com>
References: <20221004195039.931947-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/11] configs/{canaan,
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfigs use a 5.19 kernel, so specify 5.19 kernel headers now that is
available.

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
