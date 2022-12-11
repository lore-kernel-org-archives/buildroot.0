Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A1FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5803442D11;
	Mon, 20 Feb 2023 22:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5803442D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V7mUWG14W4eF; Mon, 20 Feb 2023 22:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377A84F2CC;
	Mon, 20 Feb 2023 22:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377A84F2CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52E191BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75F9E61263
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75F9E61263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5gOO060mj1o for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A992A611EE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A992A611EE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C592828C8; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:49:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 22bdfbdfc72681f552ae346a110d81b98ec477e3
X-Git-Newrev: f2da02b9e38a72ec3d18171e482a0791b5dd24b9
X-Patchwork-Hint: ignore
Message-Id: <20230220205207.8C592828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/zynqmp/kria/kv260/uboot.fragment: move to board/zynqmp/kria
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2da02b9e38a72ec3d18171e482a0791b5dd24b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch moves the board/zynqmp/kria/kv260/uboot.fragment file
to the board/zynqmp/kria directory.  The reason is that this file
is the same for any kria starter kit and is not specific to the kv260.
By moving the file, it can be logically re-used with the kr260 when
support for this starter kit is added to buildroot.

KR260 Starter Kit:
https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynqmp/kria/{kv260 => }/uboot.fragment | 0
 configs/zynqmp_kria_kv260_defconfig          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/uboot.fragment
similarity index 100%
rename from board/zynqmp/kria/kv260/uboot.fragment
rename to board/zynqmp/kria/uboot.fragment
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index df01ad30b8..3214d45fa9 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/kv260/uboot.fragment"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
