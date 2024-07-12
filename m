Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD22C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE24641A51;
	Fri, 12 Jul 2024 14:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdmlT0d2b5hD; Fri, 12 Jul 2024 14:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 707E0419EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 707E0419EC;
	Fri, 12 Jul 2024 14:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4901BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7511984684
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dko1AKQnqWuM for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF07680AA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF07680AA5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:53:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8E3A86023; Fri, 12 Jul 2024 14:53:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:51:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 758fc7e06be7de42b16ffe9933f1630747d00193
X-Git-Newrev: 57d7b12008a7f0998b8259a94621c35083531b84
X-Patchwork-Hint: ignore
Message-Id: <20240712145300.B8E3A86023@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oatpp: update the patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=57d7b12008a7f0998b8259a94621c35083531b84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, oatpp fails to build with output:

    Applying 0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch using patch:
    patching file src/oatpp/core/base/Environment.hpp
    Hunk #1 FAILED at 29.
    1 out of 1 hunk FAILED -- saving rejects to file src/oatpp/core/base/Environment.hpp.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oatpp-core-base-Environment.hpp-include-cstdarg.patch | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
index e9b7832837..33fa04a2f2 100644
--- a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
+++ b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
@@ -1,4 +1,4 @@
-From b3e8930ccbaeeb77a4cd8b0fffbe52a208aa9a29 Mon Sep 17 00:00:00 2001
+From 6ac376cec5c9573abf3ee3b82e71bd2b7e410dad Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 23 Nov 2023 22:45:56 +0100
 Subject: [PATCH] src/oatpp/core/base/Environment.hpp: include cstdarg
@@ -16,22 +16,24 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/oatpp/oatpp/commit/1d11558e2cbbabc0db02a233bf00d651ce5ea758
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/oatpp/core/base/Environment.hpp | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/oatpp/core/base/Environment.hpp b/src/oatpp/core/base/Environment.hpp
-index fd77a5c6..05d5c949 100644
+index 984afdf2a7f5..2eb18be3e196 100644
 --- a/src/oatpp/core/base/Environment.hpp
 +++ b/src/oatpp/core/base/Environment.hpp
-@@ -29,6 +29,7 @@
- #include "./Compiler.hpp"
+@@ -28,6 +28,7 @@
+ 
  #include "./Config.hpp"
-
+ 
 +#include <cstdarg>
  #include <cstdio>
  #include <atomic>
  #include <mutex>
---
-2.42.0
+-- 
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
