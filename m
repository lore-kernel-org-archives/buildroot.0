Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4869AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2FD940338;
	Sun, 29 May 2022 08:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bSTH-DSVMYL; Sun, 29 May 2022 08:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F71140528;
	Sun, 29 May 2022 08:55:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4F1E1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66A4C4264B
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-CPq3WQoUaN for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89B70419C4
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0A2EE86316; Sun, 29 May 2022 08:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:41:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 25296268c6ff7df30974132f209ba95a6cc5f718
X-Git-Newrev: 88a86922b061b1da0348dbcb3cb0bf14ec5e0b09
X-Patchwork-Hint: ignore
Message-Id: <20220529084303.0A2EE86316@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pinentry: add
 missing !BR2_ARM_CPU_ARMV4 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=88a86922b061b1da0348dbcb3cb0bf14ec5e0b09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Propagate this missing BR2_PACKAGE_QT5 dependency.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_ARM_CPU_ARMV4 [=y] && !BR2_STATIC_LIBS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PINENTRY_QT5 [=y] && BR2_PACKAGE_PINENTRY [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_arc [=n] && !BR2_STATIC_LIBS [=n]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ec4cb24717c59d17fd4965c546ecf762e1be890)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 3f005f8c58..bd5e3af5a1 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -74,6 +74,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5
@@ -84,6 +85,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 
 comment "pinentry-qt5 needs a host gcc >= 5.0, and a toolchain w/ wchar, NPTL, gcc >= 5.0, C++, dynamic library"
 	depends on !BR2_arc
+	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
