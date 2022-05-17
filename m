Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2963AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5BE384051;
	Tue, 17 May 2022 19:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LDeoZLlbCQ2; Tue, 17 May 2022 19:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D092884046;
	Tue, 17 May 2022 19:35:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9DC91BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9799F400F2
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kARQXQkvY7e for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:35:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1566400D6
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:35:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 961FD85F1A; Tue, 17 May 2022 19:24:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 21:35:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9c144d5f5ba270af9510ffd0c74a37c06b9aab9
X-Git-Newrev: 3ec4cb24717c59d17fd4965c546ecf762e1be890
X-Patchwork-Hint: ignore
Message-Id: <20220517192438.961FD85F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pinentry: add missing
 !BR2_ARM_CPU_ARMV4 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ec4cb24717c59d17fd4965c546ecf762e1be890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Propagate this missing BR2_PACKAGE_QT5 dependency.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_ARM_CPU_ARMV4 [=y] && !BR2_STATIC_LIBS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PINENTRY_QT5 [=y] && BR2_PACKAGE_PINENTRY [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_HOST_GCC_AT_LEAST_5 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_5 [=y] && !BR2_arc [=n] && !BR2_STATIC_LIBS [=n]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
