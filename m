Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F713C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7149D8121F;
	Wed,  1 May 2024 19:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Orsrb1ScyxAa; Wed,  1 May 2024 19:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE91381004
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE91381004;
	Wed,  1 May 2024 19:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B05A1BF98E
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4172440132
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Lvehwtokv1I for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8797640598
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8797640598
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83D1086485; Wed,  1 May 2024 19:58:24 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:57:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5f10b35fd2e46ca559c97d0389e9c37497a2cb7
X-Git-Newrev: 3b7a8ebefcccb6355f7c5b2d1958bfe408da7452
X-Patchwork-Hint: ignore
Message-Id: <20240501195824.83D1086485@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: drop nios2 binutils bug
 27597 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b7a8ebefcccb6355f7c5b2d1958bfe408da7452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pistache/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 3acf1f53f0..ca2d2833cd 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
@@ -13,9 +12,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
