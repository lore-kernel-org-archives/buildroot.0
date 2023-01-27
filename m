Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE2FC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 10:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F6041C8B;
	Fri, 27 Jan 2023 10:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F6041C8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsq_B0m3d6ta; Fri, 27 Jan 2023 10:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9607441CE4;
	Fri, 27 Jan 2023 10:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9607441CE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E93B1BF306
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24F56826C7
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 10:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F56826C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtROO2DcmKVP for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 10:39:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5DC982566
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 10:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DC982566
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE57487E48; Fri, 27 Jan 2023 10:39:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 11:22:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58cc22a6d095b9b589e5b001e005032589749084
X-Git-Newrev: fa341f029832a658865ed4b5849efc4b765452f9
X-Patchwork-Hint: ignore
Message-Id: <20230127103914.AE57487E48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa341f029832a658865ed4b5849efc4b765452f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reduce the configs in the kria/uboot.fragment to only what is necessary.
These 4 configs are already included in the xilinx_zynqmp_virt_defconfig, so
it is redundant to include them in the kria/uboot.fragment file.  Applying
this patch has zero impact on the u-boot binaries that are built.

This patch has been build and run tested on a kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/uboot.fragment | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 40709549dc..d8efc230a0 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -7,9 +7,5 @@ CONFIG_PHY=y
 CONFIG_PHY_XILINX_ZYNQMP=y
 CONFIG_PINCTRL=y
 CONFIG_PINCONF=y
-CONFIG_POWER_DOMAIN=y
-CONFIG_ZYNQMP_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
-CONFIG_RESET_ZYNQMP=y
 CONFIG_VIDEO_ZYNQMP_DPSUB=y
 CONFIG_SF_DEFAULT_SPEED=40000000
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
