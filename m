Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028DEC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 20:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D2341721;
	Sun, 15 Jan 2023 20:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D2341721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id btxQvNXfw_8t; Sun, 15 Jan 2023 20:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 822044067F;
	Sun, 15 Jan 2023 20:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822044067F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F20031BF25F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C47AA60FC7
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47AA60FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrBTDQV2eozq for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 20:28:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E26E160F9B
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 20:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E26E160F9B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0DF987B32; Sun, 15 Jan 2023 20:28:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 21:10:50 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: e806e443f90c2c5778f6c3acd73b2e3fae190aef
X-Git-Newrev: b84aa71ee13347ea4163079e5649c0d7c819ccb2
X-Patchwork-Hint: ignore
Message-Id: <20230115202805.D0DF987B32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 configs/zynqmp_kria_kv260_defconfig: fix linux dts name
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

commit: https://git.buildroot.net/buildroot/commit/?id=b84aa71ee13347ea4163079e5649c0d7c819ccb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The Linux DTS name has changed for the zynqmp_kria_kv260 with Xilinx 2022.2.
smk-k26-revA-sck-kv-g-revB has become zynqmp-smk-k26-revA-sck-kv-g-revB.

This DTS corresponds to generating the zynqmp-smk-k26-revA.dtb for the k26 som
and applying the zynqmp-sck-kv-g-revB.dtbo for the kv260 carrier board.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506541

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b3f5c5cb87b2f5d0e24b291697d959b8773e8b86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 7afc7748b0..0fcfce7c7d 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/smk-k26-revA-sck-kv-g-revB"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
