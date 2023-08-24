Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE962C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 20:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42689415ED;
	Thu, 24 Aug 2023 20:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42689415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifXm8iipqTtz; Thu, 24 Aug 2023 20:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A21284159D;
	Thu, 24 Aug 2023 20:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A21284159D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 696291BF27E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 504064159D
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504064159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWWPRoveOIXE for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 20:32:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E3C340AB1
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 20:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3C340AB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76F4486250; Thu, 24 Aug 2023 20:32:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 22:31:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0389e298a65ae8d1bb96d55961a99d0cf1b4ee2a
X-Git-Newrev: 3cf1f2e6cb11a016bc8a569b001c535d351e7302
X-Patchwork-Hint: ignore
Message-Id: <20230824203212.76F4486250@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/andes_ae350_45: use
 BR2_riscv_g
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cf1f2e6cb11a016bc8a569b001c535d351e7302
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As of upstream commit cbd91e89e43d600172c62fd1cbd33aa74d0a851a
we can use the default BR2_riscv_g to select IMAFD extensions and
still be able to enable additional extensions, such as the C extension
in our cse.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/andes_ae350_45_defconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index a60c4b25a0..fd8b7db0e7 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -1,9 +1,4 @@
 BR2_riscv=y
-BR2_riscv_custom=y
-BR2_RISCV_ISA_RVM=y
-BR2_RISCV_ISA_RVA=y
-BR2_RISCV_ISA_RVF=y
-BR2_RISCV_ISA_RVD=y
 BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
 BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
