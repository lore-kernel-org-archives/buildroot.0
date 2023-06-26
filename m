Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E376EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10F5141691;
	Mon, 26 Jun 2023 17:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10F5141691
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ecrZO8z09Xo; Mon, 26 Jun 2023 17:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31069415B1;
	Mon, 26 Jun 2023 17:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31069415B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F26441BF95D
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB2B6415BB
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB2B6415BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EG5r8GmIIncQ for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8EC8415B9
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8EC8415B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF73A84003; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 19:01:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37d0e147cdda10c84d00031999b8a3cf830c54cd
X-Git-Newrev: 311f04cee483fbb967ca132476094ed0e7903ee3
X-Patchwork-Hint: ignore
Message-Id: <20230626170444.AF73A84003@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unleashed: Enable
 BR2_RISCV_ISA_CUSTOM_RVA explicitly
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

commit: https://git.buildroot.net/buildroot/commit/?id=311f04cee483fbb967ca132476094ed0e7903ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_RISCV_ISA_CUSTOM_RVA is currently not explicitly listed as it is
selected by BR2_riscv_custom. This looks confusing. Let's enable it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/hifive_unleashed_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 35cb3558f9..80c5e48f96 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -2,6 +2,7 @@
 BR2_riscv=y
 BR2_riscv_custom=y
 BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVA=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
