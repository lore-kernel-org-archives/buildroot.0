Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC79C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC3A81E82;
	Wed,  1 Feb 2023 22:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC3A81E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ToJKKyjJm6e; Wed,  1 Feb 2023 22:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BA4381E76;
	Wed,  1 Feb 2023 22:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BA4381E76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4491BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF22441825
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF22441825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDdvZ3k9Utfy for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:32:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18570417FA
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18570417FA
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:32:45 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NLekpeh5dvodANLempwuwK; Wed, 01 Feb 2023 23:32:44 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:32:39 +0100
Message-Id: <20230201223241.3867678-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
References: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHx0opEOFD0m8Wd5y0YKymLKMxwAcVQVwUmah0myaD/0L/m+lziVFSt8tTKC1CnAFuZotZWgNTvHjRVKcJQXTkD2CNP1w80/rghyFAcoVxOh6kjynPPJ
 WJGf8htjbp3u4AVmDAQpnz4EzXWwD4Jiwq9B9cz5Vbt8rIB2vWHJG52WVrE+t9U7w+mU75jmgPNBPcDxICaFacSgC9Prpi4YaSH41COfdOYvWaPX6IIlaz52
 THG7mnXdXxFubkanPIGEOTKSQL5p1SsapRQpAWpIFSA79STn0AuS23fG0HcK2T0RLCJXfb+xIUzwYaUu9Ppdvzyw/6ZzkJ6nJC6q23Z+oeRN59fB8/fGQdEJ
 IWUMyriOMWoiSjNCdHfnKvFqdoYtEeIv8SkhLePBWe0S1iSNeWTSoLrcHImb8FVG8NbuSS1AYM9yl7w+sbbHZe02pPevPA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675290764; bh=/wrd/JOIYjZvbh3gfQrihEgGF4OMslfX5jqPOUTgFdA=;
 h=From:To:Subject:Date:MIME-Version;
 b=SMeBaK8uNwU/tMiUleMzAujhspSrK9DyLGYc2h9qW6CqFKHx9cbYi7qmAmhtDm6Xq
 UoWy+yWTVtXI1NnrAuDbZa02j4Z2Il7pWeZ028Lr9UDsm7K5WkzcAb9cU4FZiR7LFk
 yt/0XL/Ko5r1pPHrVZRL9CmLgfcj2HFjJhlRBYIGSp6A6mY0P8/baNyRVNqKLJPgFZ
 f1ga9LqLEN+lBzc7ZbgBFxBdhEwEwMZi2ZSvwohmXPGSXFv62hCG/0Pi9ge1O0aAhE
 GD6usWWME6eogwWHHpPI0M9Ai+5yOpxBrgVv8NU8AAsfs45/7ruMfXGtUdt5y59Yz6
 R5XvDa6sIJznw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SMeBaK8u
Subject: [Buildroot] [PATCH 5/7]
 configs/olimex_a20_olinuxino_micro_defconfig: bump Linux to 6.1.9 and
 U-Boot to 2023.01
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_micro_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 1394c0b8b8..a7a6eb51a0 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
@@ -18,7 +18,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-micro"
@@ -33,7 +33,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino_MICRO"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
