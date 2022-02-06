Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 15:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9B6581763;
	Sun,  6 Feb 2022 15:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRuc9VQmXeFY; Sun,  6 Feb 2022 15:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377CB8175B;
	Sun,  6 Feb 2022 15:28:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 415C91BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FDDF60B12
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-B0_7tghiGR for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 15:28:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71FBD608A6
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 15:28:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C8C9A8267F; Sun,  6 Feb 2022 15:20:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 16:27:36 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b7dadab3e1c602fc98ad112ea622a3152862aead
X-Git-Newrev: afcbd7abc4354d9aa3e312a723fc4374bbce919b
X-Patchwork-Hint: ignore
Message-Id: <20220206152053.C8C9A8267F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pistache: disable
 package if BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=afcbd7abc4354d9aa3e312a723fc4374bbce919b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Package pistache is affected by binutils bug 27597 (Nios II), so let's
disable it when BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y. Let's also
indent the comment dependencies.

Fixes:

  http://autobuild.buildroot.net/results/0e7b74c5a07ced2bbae1a0a8c7d7ba26dfa04031/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d5b08f37a4c3fb4f56f2ca440bafc865bdf04bfe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pistache/Config.in | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 64d6340827..96aed5210a 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
 	  for C++. It is entirely written in pure C++14 and provides
@@ -12,9 +13,10 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a glibc toolchain w/ C++, gcc >= 4.9, threads, wchar"
+comment "pistache needs a glibc toolchain w/ C++, gcc >= 4.9, threads, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-	BR2_TOOLCHAIN_USES_UCLIBC || \
-	!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-	!BR2_TOOLCHAIN_HAS_THREADS || \
-	!BR2_USE_WCHAR
+		   BR2_TOOLCHAIN_USES_UCLIBC || \
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		   !BR2_TOOLCHAIN_HAS_THREADS || \
+		   !BR2_USE_WCHAR || \
+		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
