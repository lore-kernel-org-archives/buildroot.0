Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8B9EC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3548183CB5;
	Thu,  7 Sep 2023 15:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3548183CB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ss90t_siiTcj; Thu,  7 Sep 2023 15:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47CE283280;
	Thu,  7 Sep 2023 15:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47CE283280
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43C351BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 791C241D6B
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 791C241D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m49GmqrruYnx for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E93FB41E06
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E93FB41E06
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E367B869E0; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 21:12:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be5e4a170823c94ebe3930b1a8069521d7fa96e7
X-Git-Newrev: f5573b8a04a58ffd8154fc61632bd28641fc14e8
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.E367B869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae350_45: enable RISC-V
 atomic extension
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5573b8a04a58ffd8154fc61632bd28641fc14e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's select the RVA option as Andes 45-series CPUs support IMAFDC
extensions.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/andes_ae350_45_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 21b2d01a9a..a60c4b25a0 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -1,6 +1,7 @@
 BR2_riscv=y
 BR2_riscv_custom=y
 BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
 BR2_RISCV_ISA_RVF=y
 BR2_RISCV_ISA_RVD=y
 BR2_RISCV_ISA_RVC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
