Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FB2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 04:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC4914061F;
	Tue, 11 Jan 2022 04:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDH2KfG9uRJa; Tue, 11 Jan 2022 04:17:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF52B405D0;
	Tue, 11 Jan 2022 04:17:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA3381BF3A1
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 04:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A927C82F57
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 04:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPYqIVn5W8Ls for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 04:17:37 +0000 (UTC)
X-Greylist: delayed 00:18:07 by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94F2882F20
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 04:17:37 +0000 (UTC)
Received: from ATCSQR.andestech.com (localhost [127.0.0.2] (may be forged))
 by ATCSQR.andestech.com with ESMTP id 20B3xpaV080113
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 11:59:51 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 20B3x8mT080041
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 11:59:08 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Tue, 11 Jan 2022 11:59:05 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Tue, 11 Jan 2022 11:58:58 +0800
Message-ID: <20220111035859.12895-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 20B3xpaV080113
Subject: [Buildroot] [PATCH 1/2] board/andes: rearrange nds32 folder
 structure
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,
 Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
---
 .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
 board/andes/{ => ae3xx}/readme.txt                              | 0
 configs/andes_ae3xx_defconfig                                   | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
 rename board/andes/{ => ae3xx}/readme.txt (100%)

diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
similarity index 100%
rename from board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
rename to board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
diff --git a/board/andes/readme.txt b/board/andes/ae3xx/readme.txt
similarity index 100%
rename from board/andes/readme.txt
rename to board/andes/ae3xx/readme.txt
diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae3xx_defconfig
index 52634caa50..18051115c3 100644
--- a/configs/andes_ae3xx_defconfig
+++ b/configs/andes_ae3xx_defconfig
@@ -1,5 +1,5 @@
 BR2_nds32=y
-BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
+BR2_GLOBAL_PATCH_DIR="board/andes/ae3xx/patches"
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
 BR2_LINUX_KERNEL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
