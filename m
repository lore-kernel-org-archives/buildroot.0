Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A89C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A0B60B51;
	Mon, 24 Jun 2024 20:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKUvBUhJYr8f; Mon, 24 Jun 2024 20:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70F3460ED5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F3460ED5;
	Mon, 24 Jun 2024 20:03:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA15A1BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A20B8400C1
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTYdcolKnYMu for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 950E140AD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 950E140AD8
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91CC982B60; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:55:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb8606348fe338cd8cef7538b1440e8a67887845
X-Git-Newrev: 93a75717dcee3b095de57d12dff83789298c255e
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.91CC982B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vboot-utils: update the patches to
 be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=93a75717dcee3b095de57d12dff83789298c255e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../vboot-utils/0005-include-sys-sysmacros.h-for-major.patch | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch b/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
index 5d76428eb6..3ab201fc3a 100644
--- a/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
+++ b/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
@@ -1,4 +1,4 @@
-From 435fbcee218b37a87368e2b22fa33366875d458c Mon Sep 17 00:00:00 2001
+From 0495287f062a0cef989e02e0aee4f4329ab155b0 Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@chromium.org>
 Date: Tue, 19 Apr 2016 13:58:49 -0400
 Subject: [PATCH] include sys/sysmacros.h for major()
@@ -17,13 +17,15 @@ Commit-Ready: Mike Frysinger <vapier@chromium.org>
 Tested-by: Mike Frysinger <vapier@chromium.org>
 Reviewed-by: Bill Richardson <wfrichar@google.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  cgpt/cgpt_wrapper.c               | 1 +
  futility/dump_kernel_config_lib.c | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
-index dcfaab9c..1716cdde 100644
+index 4d07aadac72d..6fbfb235ba7b 100644
 --- a/cgpt/cgpt_wrapper.c
 +++ b/cgpt/cgpt_wrapper.c
 @@ -18,6 +18,7 @@
@@ -35,17 +37,17 @@ index dcfaab9c..1716cdde 100644
  #include <unistd.h>
  
 diff --git a/futility/dump_kernel_config_lib.c b/futility/dump_kernel_config_lib.c
-index 4fe990c3..abf37ae1 100644
+index c2d59433ba71..448a2f6a831f 100644
 --- a/futility/dump_kernel_config_lib.c
 +++ b/futility/dump_kernel_config_lib.c
 @@ -10,6 +10,7 @@
- #include <string.h>
  #include <sys/mman.h>
+ #include <sys/fcntl.h>
  #include <sys/stat.h>
 +#include <sys/sysmacros.h>
  #include <sys/types.h>
  #include <unistd.h>
  
 -- 
-2.17.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
