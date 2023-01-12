Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07484C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E8C4F414;
	Tue, 21 Feb 2023 00:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7E8C4F414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNgjL6mnRkR1; Tue, 21 Feb 2023 00:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D6214F408;
	Tue, 21 Feb 2023 00:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D6214F408
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20F731BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B8FC6FB59
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B8FC6FB59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LTRhyzdTYrpD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 863F36FB10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 863F36FB10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81107828C8; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 17:29:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 250d7df53acdccdb3c65c941ad426f6cc0502996
X-Git-Newrev: b3f5c5cb87b2f5d0e24b291697d959b8773e8b86
X-Patchwork-Hint: ignore
Message-Id: <20230220205229.81107828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3f5c5cb87b2f5d0e24b291697d959b8773e8b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 3214d45fa9..94631da034 100644
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
