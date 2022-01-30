Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5D7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AA98402C3;
	Sun, 30 Jan 2022 21:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gyrVfuWBGSN; Sun, 30 Jan 2022 21:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6641B40108;
	Sun, 30 Jan 2022 21:59:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EED901BF20B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB135409B3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlrOQ9sn4V5O for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:59:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34E7040922
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:59:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 700B8817E3; Sun, 30 Jan 2022 21:52:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 22:58:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40deb82a0dcf3a2a67a007f0f89dcf6bbe4c9a49
X-Git-Newrev: d5b08f37a4c3fb4f56f2ca440bafc865bdf04bfe
X-Patchwork-Hint: ignore
Message-Id: <20220130215213.700B8817E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: disable package if
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5b08f37a4c3fb4f56f2ca440bafc865bdf04bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package pistache is affected by binutils bug 27597 (Nios II), so let's
disable it when BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y. Let's also
indent the comment dependencies.

Fixes:

  http://autobuild.buildroot.net/results/0e7b74c5a07ced2bbae1a0a8c7d7ba26dfa04031/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
