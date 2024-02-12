Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DA0C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A26A60A71;
	Mon, 12 Feb 2024 21:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUCs3J1p7ZS8; Mon, 12 Feb 2024 21:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D16860A64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D16860A64;
	Mon, 12 Feb 2024 21:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1E1E1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A284781F5B
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FpcYp8QkbvPV for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20F9A81F5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20F9A81F5D
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08756878BF; Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 22:11:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69d127fe29dc8ca0321588ed19f14f644ff7e910
X-Git-Newrev: 202e35e4b68a6bb8e891b3ec068ca09f67963c59
X-Patchwork-Hint: ignore
Message-Id: <20240212214541.08756878BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/common/imx/post-image.sh:
 fix shellcheck errors
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=202e35e4b68a6bb8e891b3ec068ca09f67963c59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file has many shellcheck errors. Fix them as reported by
shellcheck.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                      |  1 -
 board/freescale/common/imx/post-image.sh | 61 +++++++++++++++++---------------
 2 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c2e107ce96..05a9241962 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -31,7 +31,6 @@ board/chromebook/snow/sign.sh Shellcheck
 board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch Upstream
 board/cubietech/cubieboard2/post-image.sh Shellcheck
 board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
-board/freescale/common/imx/post-image.sh Shellcheck
 board/freescale/common/mxs/post-image.sh Shellcheck
 board/freescale/imx6sabre/patches/uboot/0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch Upstream
 board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index c359ef6032..638da4b86c 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -7,10 +7,12 @@
 #
 dtb_list()
 {
-	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	local DTB_LIST
+
+	DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' "${BR2_CONFIG}")"
 
 	for dt in $DTB_LIST; do
-		echo -n "\"`basename $dt`.dtb\", "
+		echo -n "\"$(basename "${dt}").dtb\", "
 	done
 }
 
@@ -21,11 +23,11 @@ dtb_list()
 #
 linux_image()
 {
-	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" "${BR2_CONFIG}"; then
 		echo "\"uImage\""
-	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" "${BR2_CONFIG}"; then
 		echo "\"Image\""
-	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" "${BR2_CONFIG}"; then
 		echo "\"Image.gz\""
 	else
 		echo "\"zImage\""
@@ -34,27 +36,27 @@ linux_image()
 
 genimage_type()
 {
-	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
-	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
-	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
-	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
-	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
-	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
-	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
-	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
-		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" "${BR2_CONFIG}"; then
+		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" "${BR2_CONFIG}"; then
 		    echo "genimage.cfg.template_no_boot_part_spl"
 		else
 		    echo "genimage.cfg.template_no_boot_part"
 		fi
-	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_spl"
 	else
 		echo "genimage.cfg.template"
@@ -63,9 +65,9 @@ genimage_type()
 
 imx_offset()
 {
-	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" "${BR2_CONFIG}"; then
 		echo "33K"
-	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" "${BR2_CONFIG}"; then
 		echo "33K"
 	else
 		echo "32K"
@@ -74,29 +76,30 @@ imx_offset()
 
 uboot_image()
 {
-	if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
+	if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" "${BR2_CONFIG}"; then
 		echo "u-boot-dtb.imx"
-	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" "${BR2_CONFIG}"; then
 		echo "u-boot.imx"
-	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y$" "${BR2_CONFIG}"; then
 	    echo "u-boot-dtb.img"
-	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMG=y$" ${BR2_CONFIG}; then
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMG=y$" "${BR2_CONFIG}"; then
 	    echo "u-boot.img"
 	fi
 }
 
 main()
 {
-	local FILES="$(dtb_list) $(linux_image)"
-	local IMXOFFSET="$(imx_offset)"
-	local UBOOTBIN="$(uboot_image)"
-	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
-	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+	local FILES IMXOFFSET UBOOTBIN GENIMAGE_CFG GENIMAGE_TMP
+	FILES="$(dtb_list) $(linux_image)"
+	IMXOFFSET="$(imx_offset)"
+	UBOOTBIN="$(uboot_image)"
+	GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 	sed -e "s/%FILES%/${FILES}/" \
 		-e "s/%IMXOFFSET%/${IMXOFFSET}/" \
 		-e "s/%UBOOTBIN%/${UBOOTBIN}/" \
-		board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}
+		"board/freescale/common/imx/$(genimage_type)" > "${GENIMAGE_CFG}"
 
 	rm -rf "${GENIMAGE_TMP}"
 
@@ -107,9 +110,9 @@ main()
 		--outputpath "${BINARIES_DIR}" \
 		--config "${GENIMAGE_CFG}"
 
-	rm -f ${GENIMAGE_CFG}
+	rm -f "${GENIMAGE_CFG}"
 
 	exit $?
 }
 
-main $@
+main "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
