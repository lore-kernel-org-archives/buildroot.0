Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56C9CAC5A5
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 20:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A33840EF;
	Sat, 20 Sep 2025 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5s021TP_TmP; Sat, 20 Sep 2025 20:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F149840DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F149840DE;
	Sat, 20 Sep 2025 20:51:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E3AD3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED9CA40387
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU2gxgZZ2aX1 for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 20:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A94F4034A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A94F4034A
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A94F4034A
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 20:51:01 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 04Xqvw9kDtfOn04Xqv4ooj; Sat, 20 Sep 2025 22:50:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Date: Sat, 20 Sep 2025 22:50:55 +0200
Message-ID: <20250920205055.291492-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAuuuxVSlTsFLM9WkILIlJ8GzwvyMS76ASQtm8ReOR1rgm7qst5myB6UR3IMhsviu8WQG2uq1+qIO6pFz0kcKp6i1DHalkX7SMTmn1n4AOJFyiGA+nK8
 qbsUQfKdo+Z/92Ix/enSXX7j8r8ZaFffoXD9Xf8TnhvWgktgGQIBn6p7e/bFz4TPF0YCAOgEpHhhMELSxMr+CEBSIcY2W5t2pDxA27rGCLT+cwNaBb4VzeXq
 WRlhGaImTux+c2n4UK4RfJL8D/Zbgbmi/sq3sM992ompWKQA2IMZIJUKMbAMu8VVYF8iVR4hJnxqNmukiX9m9Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1758401458; bh=Ht4mKwO42nbfhnqa1ealcegAL+XM+tBVKVrenjHxZYU=;
 h=From:To:Subject:Date:MIME-Version;
 b=i/gxfCuOn4TwPbqFvfqG5ar+sisMyiZB4QnxiQz5HhTVnp5oV51AwKTUfuvVW/P6b
 4l5DD/vTIybx2FiF72uGPywPpQPX/e7/FQSD3UaufA0CLSbvMVDZvJNuS7EkLRIvFA
 z/lpPTwOjJdGRjjoeqYjrVXNSU66oopDMpEMEvk8PMfLXd0yhAWUJaK+sZp9mbV1DC
 05OXYMJD20n2050Z2Z1Nl4mrJzu6mOlZJSnSJyAoZ2AncPFpd1PYk07pS9g4oDE69R
 ASJVZB2T2HAqj0g7BbTlnTFlFX7OnsVq1Wi7SDPSHRfchRuePxMlGWgTHGSXSmkB9u
 HHntNlHRYJ94A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=i/gxfCuO
Subject: [Buildroot] [PATCH] configs/imxrt1050-evk: fix build failure due to
 wrong toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

i.MXRT1050 is based on a ARMv7M core and we can't build using ARMV7
toolchain, so let's switch toolchain to
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11393506762

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/imxrt1050-evk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 0574eae981..7a70c42afa 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imxrt1050evk/patches"
 BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
