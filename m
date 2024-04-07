Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5268CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B89540B7D;
	Sun,  7 Apr 2024 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHh_7OBtD9En; Sun,  7 Apr 2024 19:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA1A940B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA1A940B8B;
	Sun,  7 Apr 2024 19:39:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D7F91BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C12F7406FC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqbKUnWNGF-9 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD88F406FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD88F406FD
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95F8B85C13; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:35:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfa4dd299f1346d5e246a552c491b630c64a6a97
X-Git-Newrev: ab6451ae660a5ec93afc212e224c92440c54dca7
X-Patchwork-Hint: ignore
Message-Id: <20240407193903.95F8B85C13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: fix build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab6451ae660a5ec93afc212e224c92440c54dca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.3.27 in
commit 59b48b5cff057f2429b1143d6f50c39d93ca8ef3:

/bin/sh: ./xccblat3_3m: No such file or directory

Fixes: 59b48b5cff057f2429b1143d6f50c39d93ca8ef3
 - http://autobuild.buildroot.org/results/52acc2d95bbc07155b9d446ab8625f9c9eb81b52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...tests-should-not-be-run-in-cross-compiles.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch b/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
new file mode 100644
index 0000000000..44883b2c26
--- /dev/null
+++ b/package/openblas/0002-fix-position-of-endif-gemm3m-tests-should-not-be-run-in-cross-compiles.patch
@@ -0,0 +1,33 @@
+From 48e017de095018c60d83355804a3075658b4970c Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Fri, 5 Apr 2024 22:54:34 +0200
+Subject: [PATCH] fix position of endif - gemm3m tests should not be run in
+ cross-compiles
+
+Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/48e017de095018c60d83355804a3075658b4970c
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ctest/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/ctest/Makefile b/ctest/Makefile
+index bbaf96f8ed..6c7cc1ed56 100644
+--- a/ctest/Makefile
++++ b/ctest/Makefile
+@@ -203,7 +203,6 @@ ifeq ($(BUILD_COMPLEX16),1)
+ 	OPENBLAS_NUM_THREADS=2 ./xzcblat3 < zin3
+ endif
+ endif
+-endif
+ 
+ ifeq ($(SUPPORT_GEMM3M),1)
+ ifeq ($(USE_OPENMP), 1)
+@@ -222,7 +221,7 @@ ifeq ($(BUILD_COMPLEX16),1)
+ endif
+ endif
+ endif
+-
++endif
+ 
+ 
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
