Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB93CC4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 07:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 364B2417C0;
	Thu, 13 Oct 2022 07:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364B2417C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0TPkXMaQKrS; Thu, 13 Oct 2022 07:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F021419CC;
	Thu, 13 Oct 2022 07:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F021419CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 079B11BF869
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 07:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE12F419CC
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 07:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE12F419CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3LgK-MMO1ei for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 07:56:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B067417C0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B067417C0
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 07:56:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="325781211"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 15:56:50 +0800
IronPort-SDR: j5AcAtE7uHSSk9rTHEuu2sTS05BxujoRyjCZqHFTZTfBb/Z9Fw+29wTizEVj8K9ldgoUCSXaIw
 kpit4MyLP4Qwi7cBzYPCv3p17PoCfuoeVRCOMTPu+YLg4b3cmE0WBbhzsEzf1Thi5dk4XnhYti
 9FKolL6C2ygiszZlcr0j80izicLaD/vuSENxgtoJi6IrUVz9X3tMTQsut31UIBV8tbjtS6JBVs
 nCXUShzqx79KWdN6HM9sWacaBOZ7i+PeJgpRrmYSzV4sxPJ8eG4wVZi6C0bLYn1k4up/NyG655
 3RoU598sZ3TLWdjPPKH/l5OQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 00:16:28 -0700
IronPort-SDR: h7j3eGQKlBFb3ejIBorWO7r15XK4lWDOBDomQtEZZPHpRTEE3sK5vKV/p4D8oKpX1R+oXdAV+c
 rCD+XVhlKDu7f5CKhgey9I0Nrm6ffZrDJS+H9pMoNnfCFdTd+4jr2uaCS/sl8XCNiz6vsH5u0x
 XdPabU64C6q2eKgnEupEQCxNrzr/ZvaNC3KrhFfS90vFX7Ho+XSbd5AAOuupWIv/m2UDLVYtgs
 RZFS2CNZnw8+P3GIDEG0xr7+3XIDrim3o6U21rRij6HtUx8qBU+UZiDpsQKAeIqdh9+vgO/OtY
 ynU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 00:56:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mp20d51S0z1RvTr
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 00:56:49 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Zsv5ZsLXvvCC for <buildroot@buildroot.org>;
 Thu, 13 Oct 2022 00:56:49 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mp20c16zcz1RvLy;
 Thu, 13 Oct 2022 00:56:47 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Oct 2022 16:56:46 +0900
Message-Id: <20221013075646.505807-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665647811; x=1697183811;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AXyVekXarantOdrTD5cG8CtbnnN+30UF6FZ5GvdOF/g=;
 b=pvv2rjouw5dNsEErro/i8ai4j/l4UVxaSZ10kt8WzmTrmWTr6mUQBkC/
 qwb6XhrS2tJr3L0QAM3dh6NYDPpCDQ6AysPJLljzkVHUAhI5be1kx7Nhe
 kdF74hy95CiRXkkOQlLNQmNNehTPLmbLxoYu9TzCdq0pp3poboJRb5Wv0
 Q3TvW9kxd12/oGNb78yg8ifcEsQwNUbOyo2F5BwX2KUzOP7bxLnpReiSv
 5dOz0as3GvgQvCVTjiNVrRNVZH+1iaR7erhgGh7uGy1/0uuh8S2YjScwU
 UtIXNzt4qyKy+DVl2CKuKOcKBsDSEt/4CSSTO72Awfo1oQn4kk7I1XLE/
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1665647809;
 x=1668239810; bh=AXyVekXarantOdrTD5cG8CtbnnN+30UF6FZ5GvdOF/g=; b=
 rOJoCkfBbmQc6kPXOHOscaK3vT9iQJiLbYWxgX5PgX985xhbToAMfy5yPh1H5bsM
 raGGAudEVrAxtu7zUiSTHy1lGKCoW7QklTsKZrZXj7Tk1PRfwAs2xeAeKxbeCcEZ
 mKkVlt9cHzYoI4CMMROgwTm2wDvEzx5LNckC1CWkcEkMTAeElnF7YCOcEsDCyiaO
 sry5eYPRd+kZdk7yaET+GZhHaB0/1gOD7YePSgHbJLez23wFPnvpgGhwpDzrPe6F
 gSxIuO0m+4O0wEjRnkxGoPZEz+V5jGTS6554yNrXkbhsO91RKkiI5MChWLoX/y5u
 oQD8cHar9whido24i0hMFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=pvv2rjou; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=rOJoCkfB
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: [Buildroot] [PATCH v2] configs/sipeed_*_sdcard: Add dependency on
 host-openssl
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gitlab CI reported build failures for the sipeed RISC-V nommu boards
with the u-boot/sdcard enabled default configuration. The compilation
errors are related to the openssl/evp.h header file missing, e.g.:

In file included from tools/imagetool.h:24,
                 from tools/fit_common.c:20:
include/image.h:1166:12: fatal error: openssl/evp.h: No such file or
directory
 1166 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fix this issue by adding BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the config
files so that host-openssl gets built as a dependency of U-Boot.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229992
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229994
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229996
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229998

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 configs/sipeed_maix_bit_sdcard_defconfig  | 1 +
 configs/sipeed_maix_dock_sdcard_defconfig | 1 +
 configs/sipeed_maix_go_sdcard_defconfig   | 1 +
 configs/sipeed_maixduino_sdcard_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 8a19996090..34769eeca8 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index d3d0f405e1..62f6a0e0b8 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 75300997b8..6c61e3aaaf 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index add9369747..da8cbe45f9 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
