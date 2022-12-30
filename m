Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEC4C4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 09:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2667E4010D;
	Fri, 30 Dec 2022 09:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2667E4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWeS_gQ2TJCt; Fri, 30 Dec 2022 09:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CAF84012B;
	Fri, 30 Dec 2022 09:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CAF84012B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4B21BF20D
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 09:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1FC4010D
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 09:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA1FC4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWFsx1zUQWQf for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 09:59:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2051400FD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2051400FD
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 09:59:22 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.224.71])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E6DD95FFC0;
 Fri, 30 Dec 2022 10:59:04 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 10:57:28 +0100
Message-Id: <20221230095728.5941-6-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230095728.5941-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
 <20221230095728.5941-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672394361;
 bh=CiF7L/qHiHIc/e9YXRLyGvb7oF6x1j1S7ZFqA4+E+cQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rCb1laK/84jD4xzMd/trOcZ8GRAUNLzjensUM8BZEN5xt/uO9tAxUF7CfWak2hOH6
 ibBzo5YOrgCPVFLDGklBY60zD5ShFfpLjbJY82XaFUAyM0BH+t3ANuXK15g6/oGVSu
 /+QFCTuzq3uvZcuruoRgd5HDv6nK/mfIHjNMJe/B/B8CW1aBmsk2NWu/xSPTL+3JZV
 sM+Bh+UyDmO5UtFKOKv+Zr6GdCLmhVQns7QGKBeOZn5y7FFB1C15Mh006YCA0mz+9G
 ifFoMQGdWok92wUTl1Ib+61D0vLFXh1pj0E2pU1cPHF1V2SzRRtJoYxdIUKv3J9UAh
 bvjttFH16mAFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rCb1laK/
Subject: [Buildroot] [PATCH 27/27] configs/ls1028ardb: update codeaurora
 URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NXP moved all its open source code repositories from Code Aurora Forum
to github. See for example:
https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097

Software packages are now grouped in several NXP github
projects/organizations (nxp-imx, nxp-qoriq, ...). See:
https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITHUB

The NXP code published on Code Aurora is still present (at the time of
this commit) but is no longer receiving updates. It is also expected
to be shut down on 2023-03-31. The Code Aurora website
https://source.codeaurora.org/ currently show the following message:
"""
Note: Qualcomm Innovation Center Inc. maintained repositories have
migrated to git.codelinaro.org. QUIC repositories on this site will
not receive any updates after March 31, 2022, and will be deleted on
March 31, 2023. If your project depends on these repositories, please
adjust your tooling configuration to use the new, up-to-date project
location.
"""

For this reason, the NXP recipes using codeaurora.org urls need to be
updated to the correct github.com replacement.

Note: this commit does not change the component version. Only the
download URL is updated. The archive content is expected to be the
same.

Note 2: this commit updates the Kernel, U-Boot and ATF download urls.
The method is also changed from _CUSTOM_GIT to _CUSTOM_TARBALL.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ls1028ardb_defconfig | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 1bc84f7b80..a46b94511a 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -17,9 +17,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,LSDK-21.08)/linux-LSDK-21.08.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -37,9 +36,8 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,LSDK-21.08)/atf-LSDK-21.08.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
@@ -48,9 +46,8 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,LSDK-21.08)/u-boot-LSDK-21.08.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
