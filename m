Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B6EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 15:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863D741965;
	Wed, 12 Oct 2022 15:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863D741965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qXiaqDiABgm; Wed, 12 Oct 2022 15:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B7841937;
	Wed, 12 Oct 2022 15:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B7841937
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E72B1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 15:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A23640587
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 15:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A23640587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-ocF1C6aE9J for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 15:41:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58A9040579
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 15:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A9040579
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 423B186BE5; Wed, 12 Oct 2022 15:41:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 17:40:21 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: e665d20f7afaf531d9de1334884879caaa84a76b
X-Git-Newrev: 23fbc414296c27f5200d21ce5a9ff53f80e5af0c
X-Patchwork-Hint: ignore
Message-Id: <20221012154141.423B186BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 configs/aspeed_ast2600evb: set BR2_ARM_FPU_VFPV4D16
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
Content-Type: multipart/mixed; boundary="===============2405166552729678727=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2405166552729678727==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=23fbc414296c27f5200d21ce5a9ff53f80e5af0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt lpae evtstrm

the vfpv3d16 feature bit is common to both vfpv3 and vfpv4.

Drop BR2_ARM_FPU_VFPV4 which activates the use of vpfd32 (and breaks
user space). Set BR2_ARM_FPU_VFPV4D16 instead.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ccb318d80f0d09e22f944ac9fc618f9abedbe43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============2405166552729678727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2405166552729678727==--
