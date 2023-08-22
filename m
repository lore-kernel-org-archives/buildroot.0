Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAD1EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B134860F1C;
	Tue, 22 Aug 2023 19:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B134860F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1advAVYM-hO; Tue, 22 Aug 2023 19:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB4960BF7;
	Tue, 22 Aug 2023 19:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB4960BF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8101BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 845A14003D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 845A14003D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcmJ8SwMIMc5 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:13:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49D334049C
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D334049C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35AD686134; Tue, 22 Aug 2023 19:13:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 21:12:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: be5e4a170823c94ebe3930b1a8069521d7fa96e7
X-Git-Newrev: f5573b8a04a58ffd8154fc61632bd28641fc14e8
X-Patchwork-Hint: ignore
Message-Id: <20230822191304.35AD686134@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/andes_ae350_45: enable
 RISC-V atomic extension
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
