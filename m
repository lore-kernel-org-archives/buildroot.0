Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59635C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F42D813F6;
	Wed, 23 Feb 2022 20:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3MgHbgpajSx; Wed, 23 Feb 2022 20:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A20D8131B;
	Wed, 23 Feb 2022 20:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3EA71BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F61160FA0
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfzdOQ5VyFIe for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:08:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB59C60F76
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:08:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 63F7383888; Wed, 23 Feb 2022 20:01:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 21:07:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72021742574acd4d43ee1977cd2af3133245787a
X-Git-Newrev: 14b9a100eff6ee58d57b9b7b4c0da9a648a7e1bf
X-Patchwork-Hint: ignore
Message-Id: <20220223200101.63F7383888@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_zcu10x: fix U-Boot dts
 config
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

commit: https://git.buildroot.net/buildroot/commit/?id=14b9a100eff6ee58d57b9b7b4c0da9a648a7e1bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a U-Boot config fragment to set the correct control device tree file for
each board, rather than using the default (zcu100).

Signed-off-by: Neal Frager <neal.frager@xilinx.com>
Tested-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: reword commit message, rename fragment files]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/zcu102/uboot.fragment | 1 +
 board/zynqmp/zcu106/uboot.fragment | 1 +
 configs/zynqmp_zcu102_defconfig    | 1 +
 configs/zynqmp_zcu106_defconfig    | 1 +
 4 files changed, 4 insertions(+)

diff --git a/board/zynqmp/zcu102/uboot.fragment b/board/zynqmp/zcu102/uboot.fragment
new file mode 100644
index 0000000000..52d6d9dff8
--- /dev/null
+++ b/board/zynqmp/zcu102/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-rev1.0"
diff --git a/board/zynqmp/zcu106/uboot.fragment b/board/zynqmp/zcu106/uboot.fragment
new file mode 100644
index 0000000000..cd571171ac
--- /dev/null
+++ b/board/zynqmp/zcu106/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 298ce2388c..4e96489179 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3e51cbfaab..0a97975aa0 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2022.01-165-g667001319cbe511ce6353195fb4910ae5cb041ce"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
