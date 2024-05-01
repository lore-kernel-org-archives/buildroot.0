Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4B9C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5B582117;
	Wed,  1 May 2024 19:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ALgieXAXvFX; Wed,  1 May 2024 19:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A77518211A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A77518211A;
	Wed,  1 May 2024 19:58:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE871BF990
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 291D04170B
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyrYqj8cGMzC for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B87740132
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B87740132
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 457BE86484; Wed,  1 May 2024 19:58:24 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:57:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83339a69e4ce03fccbd4d6bebd6a606f3e330085
X-Git-Newrev: e983a6404814292092ab797d3983fa97aea76741
X-Patchwork-Hint: ignore
Message-Id: <20240501195824.457BE86484@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: drop nios2 binutils bug
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

commit: https://git.buildroot.net/buildroot/commit/?id=e983a6404814292092ab797d3983fa97aea76741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gdal/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 24a1f06af2..839a1bd7ea 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GDAL
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_GIFLIB
@@ -26,9 +25,8 @@ config BR2_PACKAGE_GDAL
 
 	  https://gdal.org/
 
-comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
