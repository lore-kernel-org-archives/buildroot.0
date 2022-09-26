Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389BEC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E345B40C4E;
	Mon, 26 Sep 2022 12:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E345B40C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DF2CwbRtPqbB; Mon, 26 Sep 2022 12:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2407E40BF5;
	Mon, 26 Sep 2022 12:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2407E40BF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D51001BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACAA681902
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACAA681902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXI-phwfQrAO for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:04:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8F7A827A1
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F7A827A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B879F860A4; Mon, 26 Sep 2022 12:04:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:03:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5195770cc8b46a9d51caab8d02bb086e4a0b249f
X-Git-Newrev: 7ccb318d80f0d09e22f944ac9fc618f9abedbe43
X-Patchwork-Hint: ignore
Message-Id: <20220926120409.B879F860A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2600evb: set
 BR2_ARM_FPU_VFPV4D16
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
Content-Type: multipart/mixed; boundary="===============0616031801003066359=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0616031801003066359==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7ccb318d80f0d09e22f944ac9fc618f9abedbe43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt lpae evtstrm

the vfpv3d16 feature bit is common to both vfpv3 and vfpv4.

Drop BR2_ARM_FPU_VFPV4 which activates the use of vpfd32 (and breaks
user space). Set BR2_ARM_FPU_VFPV4D16 instead.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/aspeed_ast2600evb_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/aspeed_ast2600evb_defconfig b/configs/aspeed_ast2600evb_defconfig
index cd058ad0ac..04239566c8 100644
--- a/configs/aspeed_ast2600evb_defconfig
+++ b/configs/aspeed_ast2600evb_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_VFPV4D16=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="aspeed-evb"

--===============0616031801003066359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0616031801003066359==--
