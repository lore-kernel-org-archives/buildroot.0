Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8A7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 14:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79FB681A6A;
	Mon, 21 Feb 2022 14:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgD6gKA5I5mt; Mon, 21 Feb 2022 14:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE8581A12;
	Mon, 21 Feb 2022 14:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECDC51BF331
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 14:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEEFC8188A
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 14:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peSpt7tArJx4 for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 14:06:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 843A4817AD
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 14:06:38 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E8EC42012;
 Mon, 21 Feb 2022 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1645452397; bh=eEQM+FEGqCRLXCICi6o8fP4/za32xoCeZv+skKJWXNM=;
 h=From:To:Cc:Subject:Date:From;
 b=XCAAJFOEL76Q9QNnB8F/23dWdeclWr3Dzv4yhbTvP92/8Kbp+RCPJ6bqFvdd7NfPh
 SqtU5iwsXBJYmTHUOS8xhZoAqbT46VY17pRo9k+ff1KtAAZxv9054hZNsv2AYudFbh
 BGqbL6y34icjhXNyVsd/9q6200C7dUwVTu24j5KCQsLgRLY6Ql+X94L1SrYYCEIdKJ
 sgg1Ubn2rhmCpPabsRuixVMly29uJ2135n+U04NY4wjZ7P9ccpKeltY7dEuXbVBHRq
 UvoCPP7CI4N27t6Zh8NK0h9dgs+05cwtyvF8OSfCIxvIW9st2M4QDINbi1PJzhKzK8
 2FJSgNP1ECX7w==
Received: from abrodkin-5550.internal.synopsys.com
 (abrodkin-5550.internal.synopsys.com [10.121.8.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 5240FA005D;
 Mon, 21 Feb 2022 14:06:33 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 17:06:28 +0300
Message-Id: <20220221140628.2295-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt5: enable for ARC
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Peter Seiderer <ps.report@gmx.net>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Double-conversion got pulled-in Qt's sources from the upstream project
quite some time ago [1], so now Qt5 is buildable for ARC perfectly fine.

This reverts the last part of [2],
commit e453fb9e3280 (qt5: disable qt-5.8.0 support for arc, nios2 and xtensa).

[1] https://invent.kde.org/qt/qt/qtbase/-/commit/425df43d7fed19866fc7ceb3d26b6cc4190523f5
[2] https://git.buildroot.net/buildroot/commit/?id=e453fb9e3280a1a1ce6180e165aab9c4f1642555

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 8557fd1000..cbb2e06a21 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -13,7 +13,6 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 
 comment "Qt5 needs host g++ >= 5.0, and a toolchain w/ gcc >= 5.0, wchar, NPTL, C++, dynamic library"
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_HOST_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
@@ -26,8 +25,6 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # Full C++11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, GCC_BUG_57694
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
-	# no built-in double-conversion support
-	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5BASE
 	help
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
