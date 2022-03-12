Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450B3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF72082486;
	Sat, 12 Mar 2022 17:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FqvMe4_7GOsH; Sat, 12 Mar 2022 17:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4521082457;
	Sat, 12 Mar 2022 17:10:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11EE91BF966
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D40401D5
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEk6ct6X_cOa for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1BFB4023D
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 35D1C82AA4; Sat, 12 Mar 2022 17:01:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e27390f85467f04e62a55748fd60fb304803f6a
X-Git-Newrev: 16ffc6549465cb5d68b751f10603e8b0363bf9b0
X-Patchwork-Hint: ignore
Message-Id: <20220312170118.35D1C82AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5: enable for ARC
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

commit: https://git.buildroot.net/buildroot/commit/?id=16ffc6549465cb5d68b751f10603e8b0363bf9b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Double-conversion got pulled-in Qt's sources from the upstream project
quite some time ago [1], so now Qt5 is buildable for ARC perfectly fine.

This reverts the last part of [2],
commit e453fb9e3280 (qt5: disable qt-5.8.0 support for arc, nios2 and xtensa).

[1] https://invent.kde.org/qt/qt/qtbase/-/commit/425df43d7fed19866fc7ceb3d26b6cc4190523f5
[2] https://git.buildroot.net/buildroot/commit/?id=e453fb9e3280a1a1ce6180e165aab9c4f1642555

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 5751d6cb70..f2b1ff4a19 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
