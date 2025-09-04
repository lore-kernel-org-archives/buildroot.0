Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F29FCAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE41360743;
	Mon,  8 Sep 2025 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNWUFcPQgg4V; Mon,  8 Sep 2025 14:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC47960677
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC47960677;
	Mon,  8 Sep 2025 14:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27A71186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05FE340065
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoHiiAa43Udb for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4689740054
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4689740054
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4375480DA7; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 20:43:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d652b20128b8498777db4788ae14049bcac3d58d
X-Git-Newrev: 859d41d7e5e768a64cdc31d976f5e7008d1a77f8
X-Patchwork-Hint: ignore
Message-Id: <20250908141631.4375480DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed-*: bump Linux to 6.16.4
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
Content-Type: multipart/mixed; boundary="===============7361229116654767608=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7361229116654767608==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=859d41d7e5e768a64cdc31d976f5e7008d1a77f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Linux 6.5 moved .dts files to vendor sub-directories, adjust the
post-image.sh script to take into account the 'aspeed/' prefix in .dts
file names.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aspeed/common/post-image.sh   | 4 ++--
 configs/aspeed_ast2500evb_defconfig | 6 +++---
 configs/aspeed_ast2600evb_defconfig | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/aspeed/common/post-image.sh b/board/aspeed/common/post-image.sh
index ea65a49aff..8c953e038c 100755
--- a/board/aspeed/common/post-image.sh
+++ b/board/aspeed/common/post-image.sh
@@ -3,8 +3,8 @@
 BOARD_DIR="$(dirname $0)"
 mkimage=$HOST_DIR/bin/mkimage
 
-BOARD_DT=$(sed -n \
-           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
+BOARD_DT=$(sed -nr \
+           -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(aspeed/)?([a-z0-9\-]*).*"$|\2|p' \
            ${BR2_CONFIG})
 
 sed -e "s/%BOARD_DTB%/${BOARD_DT}.dtb/" \
diff --git a/configs/aspeed_ast2500evb_defconfig b/configs/aspeed_ast2500evb_defconfig
index 2312242e64..ffc0ec8d52 100644
--- a/configs/aspeed_ast2500evb_defconfig
+++ b/configs/aspeed_ast2500evb_defconfig
@@ -1,17 +1,17 @@
 BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16=y
 BR2_TARGET_GENERIC_HOSTNAME="aspeed-evb"
 BR2_TARGET_GENERIC_ISSUE="Aspeed EVB"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aspeed/common/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.16.4"
 BR2_LINUX_KERNEL_DEFCONFIG="aspeed_g5"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/aspeed/ast2500-evb/linux.fragment"
 BR2_LINUX_KERNEL_XZ=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="aspeed-ast2500-evb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="aspeed/aspeed-ast2500-evb"
 BR2_PACKAGE_MTD=y
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_XZ=y
diff --git a/configs/aspeed_ast2600evb_defconfig b/configs/aspeed_ast2600evb_defconfig
index 104f685200..4e49c4acbe 100644
--- a/configs/aspeed_ast2600evb_defconfig
+++ b/configs/aspeed_ast2600evb_defconfig
@@ -1,16 +1,16 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16=y
 BR2_TARGET_GENERIC_HOSTNAME="aspeed-evb"
 BR2_TARGET_GENERIC_ISSUE="Aspeed EVB"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aspeed/common/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.16.4"
 BR2_LINUX_KERNEL_DEFCONFIG="aspeed_g5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="aspeed-ast2600-evb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="aspeed/aspeed-ast2600-evb"
 BR2_PACKAGE_MTD=y
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_XZ=y

--===============7361229116654767608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7361229116654767608==--
