Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ACBC04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 14:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80CD3400EA;
	Sat, 22 Oct 2022 14:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80CD3400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FCuTRTXEEs7; Sat, 22 Oct 2022 14:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1588403B3;
	Sat, 22 Oct 2022 14:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1588403B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 308901BF2BC
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 14:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C581605AF
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 14:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C581605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CC4t4-pEbPa8 for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 14:20:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA5786058B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA5786058B
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 14:20:54 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.237.175])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3FAD82003EE;
 Sat, 22 Oct 2022 16:20:48 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 16:20:40 +0200
Message-Id: <20221022142040.625468-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666448451;
 bh=rEoOu5O2z7T339GcInwsTfXIIWZOLZ+X24o7WiluJDI=;
 h=From:To:Cc:Subject:Date:From;
 b=GwVAaBwqNTcnMlNtXz42F9VYqAVjGNV6zNUIuARvUOltwcWzYwRRlLfATQKCdvuJU
 h9p9Szys0s2UEsd5UUoGBf/cDOIK7rZZqOon9r8L1sBbmX39Cs6yCIuXxa1d1GMW8V
 hnqsI240ZvN6ckh7ToFoWRGaPOZ+XP3jJMPWTf/UjlljH4SoNyRJeOoyUMT0hKATSY
 wPqXnk4ognee+Co2ay3yNvEUqCv6PBFtyAKLb0Q90o9WarigaiLmGmsgCFl3+rSN96
 pW+mnGh9XmwXSkqMiQErT40z+BhBsv+40ff2rsjD49Vscv/wy228S3xc4CCh27VNLx
 uy13ofDGPiQEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GwVAaBwq
Subject: [Buildroot] [PATCH 1/1] configs/imx8{m,mm}pico: disable ATF SSP
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

imx8{m,mm}pico configs are currently failing at ATF link with output:

    aarch64-buildroot-linux-gnu-ld: asm_stack_protector.o: in function `update_stack_protector_canary':
    (.text.asm.update_stack_protector_canary+0x4): undefined reference to `plat_get_stack_protector_canary'

The ATF version in those configs does not provide platform level
support for SSP.

This build failure was introduced by commit
09acc7cbc91f50305730ca0690a58fb93529034b
"boot/arm-trusted-firmware: fix SSP support". Before this commit,
ATF SSP was globally disabled, by default.

This commit fixes those build issues by disabling the ATF SSP in the
defconfigs.

Fixes:
  - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498119
  - https://gitlab.com/buildroot.org/buildroot/-/jobs/3200498120

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/imx8mmpico_defconfig | 1 +
 configs/imx8mpico_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index 7c19c8c81b..55fd2d01c1 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -22,6 +22,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/e
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.72-2.2.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
diff --git a/configs/imx8mpico_defconfig b/configs/imx8mpico_defconfig
index 55746fb67e..d7e5b6273a 100644
--- a/configs/imx8mpico_defconfig
+++ b/configs/imx8mpico_defconfig
@@ -22,6 +22,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/e
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.72-2.2.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
