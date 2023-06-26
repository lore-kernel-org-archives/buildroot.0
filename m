Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144AAEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EEA6415BA;
	Mon, 26 Jun 2023 17:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EEA6415BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wU9NAK_lEAUB; Mon, 26 Jun 2023 17:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8F46415B8;
	Mon, 26 Jun 2023 17:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8F46415B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E66481BF37B
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CADF860E4C
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CADF860E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehOfWpPYAi2s for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7F1960B16
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F1960B16
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B053A84AD2; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 19:02:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 311f04cee483fbb967ca132476094ed0e7903ee3
X-Git-Newrev: 3a4ce27f562b1d8f56e3ed256f035c1ee60301ec
X-Patchwork-Hint: ignore
Message-Id: <20230626170444.B053A84AD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglev_defconfig: Enable
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a4ce27f562b1d8f56e3ed256f035c1ee60301ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_RISCV_ISA_CUSTOM_RVA is currently not explicitly listed as it is
selected by BR2_riscv_custom. This looks confusing. Let's enable it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/beaglev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 79af8c2ece..42c732b973 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -1,6 +1,7 @@
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
