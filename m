Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071CCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 05:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92540410D5;
	Tue, 15 Feb 2022 05:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttYkPHsDetjz; Tue, 15 Feb 2022 05:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA525408A9;
	Tue, 15 Feb 2022 05:33:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFC51BF2A9
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 05:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C64A60E55
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 05:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cp355-TWo8gJ for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 05:33:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC53660E52
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 05:33:56 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 21F5XXIG050875;
 Tue, 15 Feb 2022 13:33:33 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Tue, 15 Feb 2022 13:33:32 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Tue, 15 Feb 2022 13:33:25 +0800
Message-ID: <20220215053327.4046-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 21F5XXIG050875
Subject: [Buildroot] [PATCH v3 1/3] board/andes: rearrange nds32 folder
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
Cc: giulio.benetti@benettiengineering.com, Yu
 Chien Peter Lin <peterlin@andestech.com>, alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rearrange nds32 folder structure to add AE350 platform.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Alan Kao <alankao@andestech.com>
---
 .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
 ...2-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch | 0
 board/andes/{ => ae3xx}/readme.txt                              | 0
 configs/andes_ae3xx_defconfig                                   | 2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
 rename board/andes/{ => ae3xx}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
 rename board/andes/{ => ae3xx}/readme.txt (100%)

diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
similarity index 100%
rename from board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
rename to board/andes/ae3xx/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
diff --git a/board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/andes/ae3xx/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
similarity index 100%
rename from board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
rename to board/andes/ae3xx/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
