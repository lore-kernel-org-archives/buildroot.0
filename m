Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA6CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88B1B60809;
	Thu, 14 Aug 2025 22:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ph45g2y7E92D; Thu, 14 Aug 2025 22:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D45A0607F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D45A0607F7;
	Thu, 14 Aug 2025 22:05:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D7D7228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C26940769
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSWk519nqAqg for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 22:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3932E40764
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3932E40764
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 339BC87622; Thu, 14 Aug 2025 22:05:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 23:56:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 83b3dc9815144ba94a54d833e86e060fe2ff6133
X-Git-Newrev: c45735988ef19aa7085bc89a5e9e2327248ab3e5
X-Patchwork-Hint: ignore
Message-Id: <20250814220509.339BC87622@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/freescale_imx93evk:
 Add OP-TEE OS support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4119963705421079791=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4119963705421079791==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c45735988ef19aa7085bc89a5e9e2327248ab3e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add OP-TEE OS Support. NXP BSP lf-6.12.3-1.0.0 version.

The i.MX93 Boot Container requires a raw TEE binary without a TEE header.
Update the imx9-bootloader-prepare.sh script and Config.in accordingly
to ensure compatibility with this requirement.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Breno Lima <breno.lima@nxp.com>
Reviewed-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: remove empty line in hash file to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/common/imx/imx9-bootloader-prepare.sh   | 2 +-
 board/freescale/imx93evk/patches/optee-os/optee-os.hash | 2 ++
 boot/optee-os/Config.in                                 | 2 +-
 configs/freescale_imx93evk_defconfig                    | 7 +++++++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index 2db887a785..a267114d43 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -20,7 +20,7 @@ main ()
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
 			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
 			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
-			-ap "${BINARIES_DIR}/tee.bin" a55 0x96000000 \
+			-ap "${BINARIES_DIR}/tee-raw.bin" a55 0x96000000 \
 			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	else
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
diff --git a/board/freescale/imx93evk/patches/optee-os/optee-os.hash b/board/freescale/imx93evk/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..6ab7c41aa1
--- /dev/null
+++ b/board/freescale/imx93evk/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4b685080a094cb0f0489b8114ae8b73c37ec13eda9f5618c8b6311ff1f472f57  imx-optee-os-lf-6.12.3-1.0.0.tar.gz
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 433dae90d8..e737d2a0ac 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -167,7 +167,7 @@ config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 
 config BR2_TARGET_OPTEE_OS_CORE_IMAGES
 	string "Binary boot images"
-	default "tee.bin tee-*_v2.bin"
+	default "tee.bin tee-raw.bin tee-*_v2.bin"
 	help
 	  Names of generated image files that are installed in the
 	  output images/ directory.
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index 1140747825..0a39859342 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -25,6 +25,13 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-optee-os,lf-6.12.3-1.0.0)/imx-optee-os-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="imx"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="mx93evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y

--===============4119963705421079791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4119963705421079791==--
