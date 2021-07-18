Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AF5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:41:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D2060C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66D2060C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41F7E83E13;
	Tue,  3 Aug 2021 23:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nwBw2irpCFu; Tue,  3 Aug 2021 23:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B37C83DF8;
	Tue,  3 Aug 2021 23:41:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F14C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A69C240F22
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrGRWXL6lR7Y for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 498AC40EAE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A189D87059; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 14:06:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f0ae33afd371fa528d5872f62248d7b394794a0
X-Git-Newrev: 9a93dc18dcedfa3addd908eb96231d1c8688c9d2
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.A189D87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/stm32mp157a_dk1:
 remove uboot config fragment
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9a93dc18dcedfa3addd908eb96231d1c8688c9d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Running stm32mp1 watchdog is properly recognized and handled by kernel
watchdog framework since Linux v5.6.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config | 1 -
 configs/stm32mp157a_dk1_defconfig                              | 1 -
 2 files changed, 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config b/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config
deleted file mode 100644
index a278ce9e23..0000000000
--- a/board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_STM32MP_WATCHDOG is not set
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index bdb99c8663..86265d77f8 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -27,7 +27,6 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
