Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1163DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:20:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BDCA6105A
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BDCA6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2959B82400;
	Thu, 14 Oct 2021 20:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwb2LovulLdG; Thu, 14 Oct 2021 20:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9402781D72;
	Thu, 14 Oct 2021 20:20:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 089DF1BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD2681D72
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id awVoQXrrjkNZ for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:20:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56B3881D70
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:20:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3DFA58B46D; Thu, 14 Oct 2021 20:17:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 21:33:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d538f3c7a7af876c48315f46a868852bd364a7b1
X-Git-Newrev: 2a5ad252f0354dbe342b814bb4d72336be109bbb
X-Patchwork-Hint: ignore
Message-Id: <20211014201744.3DFA58B46D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro-vc:
 wrap Config.in help
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a5ad252f0354dbe342b814bb4d72336be109bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freescale-imx/imx-vpu-hantro-vc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/Config.in b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
index 9ae139550a..9a0f448bc9 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/Config.in
+++ b/package/freescale-imx/imx-vpu-hantro-vc/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_IMX_VPU_HANTRO_VC
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 	help
-	  i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus processor.
+	  i.MX VC8000E Encoder library. Intended for the i.MX 8M Plus
+	  processor.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
