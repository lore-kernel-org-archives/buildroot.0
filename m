Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62F1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 17:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1167B40533;
	Sun, 27 Feb 2022 17:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3f032wa5vnd; Sun, 27 Feb 2022 17:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F050C4052B;
	Sun, 27 Feb 2022 17:29:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4DE71BF285
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADB21607FF
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffEB62w9bnTA for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 17:29:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CC4B607EC
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 17:29:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3F81382DF0; Sun, 27 Feb 2022 17:20:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 18:28:42 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 2521b5bbb9e0e07ef0ae906f710af5044ae13df6
X-Git-Newrev: beb91a11f70421218930c31cffb801d25a9a266a
X-Patchwork-Hint: ignore
Message-Id: <20220227172057.3F81382DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/go: security bump
 to 1.17.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=beb91a11f70421218930c31cffb801d25a9a266a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

go1.17.7 includes security fixes to the crypto/elliptic, math/big packages and
to the go command, as well as bug fixes to the compiler, linker, runtime, the go
command, and the debug/macho, debug/pe, and net/http/httptest packages.

https://github.com/golang/go/issues?q=milestone%3AGo1.17.7+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 362b2822eea66b0775d9eba94d22c85939d2c8c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9111c8c9aa..fdf342e602 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8  go1.17.6.src.tar.gz
+sha256  c108cd33b73b1911a02b697741df3dea43e01a5c4e08e409e8b3a0e3745d2b4d  go1.17.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 062bec378c..56a21dfe55 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.6
+GO_VERSION = 1.17.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
