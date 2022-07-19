Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FE5C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1504F40C5E;
	Tue, 19 Jul 2022 15:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1504F40C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6dhTVtzr0sI; Tue, 19 Jul 2022 15:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1367740585;
	Tue, 19 Jul 2022 15:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1367740585
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFB2C1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BE52819BC
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BE52819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnPZhmMlVN_h for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A888826E5
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A888826E5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 75C5983D0A; Tue, 19 Jul 2022 14:59:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:05:26 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d5708c051a1647beb02423a64af3b118214f5799
X-Git-Newrev: c4eb3dd0a683a45bf946f3e60c68d358c9a05c90
X-Patchwork-Hint: ignore
Message-Id: <20220719145920.75C5983D0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libeastl: needs
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4eb3dd0a683a45bf946f3e60c68d358c9a05c90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libeastl needs threads since its addition in commit
ed9ddaafb2c4d3ac44e46390248f5c9af08076b1 and
https://github.com/electronicarts/EASTL/commit/800bc26659f834354e38ee3de4c7300e739ed255:

In file included from /home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/source/thread_support.cpp:7:
/home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/include/EASTL/internal/thread_support.h:37:18: fatal error: pthread.h: No such file or directory
   37 |         #include <pthread.h>
      |                  ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/54ff018467d157530bde4d35602fd1820d9eb348

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4c478bb0554e8cd8faf62fe2d3a6dc2e68fa7c7b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libeastl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
index 5abea8f810..738b293be4 100644
--- a/package/libeastl/Config.in
+++ b/package/libeastl/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBEASTL
 	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  EASTL stands for Electronic Arts Standard Template
 	  Library. It is a C++ template library of containers,
@@ -21,6 +22,7 @@ config BR2_PACKAGE_LIBEASTL
 
 	  https://github.com/electronicarts/EASTL
 
-comment "libeastl needs a toolchain w/ C++, gcc >= 4.9"
+comment "libeastl needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
