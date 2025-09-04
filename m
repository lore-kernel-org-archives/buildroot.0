Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8101CCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A9A40490;
	Thu,  4 Sep 2025 16:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diS5peNEcNDh; Thu,  4 Sep 2025 16:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8441F404B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8441F404B5;
	Thu,  4 Sep 2025 16:14:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14704AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 157208077C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVcE6Yo7VdyR for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C9380797
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64C9380797
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62BBF87F46; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 66af5b9914f3c81bba787c260771c3c7883ac8d2
X-Git-Newrev: 82ba9e3547dfec54f6b079daf080cec08e84c718
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.62BBF87F46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsvgtiny: add
 patch to fix GCC 15.x build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=82ba9e3547dfec54f6b079daf080cec08e84c718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add a small, easily backportable patch to fix GCC 15.x build
issue. The issue is also fixed upstream in later releases, but this
patch is a minimal fix that can be backported to LTS independently
from a version bump.

Fixes:

  https://autobuild.buildroot.org/results/c3d703663faabe40448d908afbdbb351a016aece/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6fdebc54b301ca4729789849c602aa4203bcfbe6)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ..._gradient-svgtiny_list-.c-add-missing-std.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
new file mode 100644
index 0000000000..17e63ba541
--- /dev/null
+++ b/package/libsvgtiny/0005-src-svgtiny_gradient-svgtiny_list-.c-add-missing-std.patch
@@ -0,0 +1,42 @@
+From 1d86ce7e6ea9fae8285eed23d838f87ab3ac083c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 19 Aug 2025 23:28:35 +0200
+Subject: [PATCH] src/{svgtiny_gradient,svgtiny_list}.c: add missing <stdlib.h>
+
+Needed to get the prototype for malloc()/free().
+
+Upstream: N/A, already fixed upstream in a later release (but as part
+of a larger commit)
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/svgtiny_gradient.c | 1 +
+ src/svgtiny_list.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/svgtiny_gradient.c b/src/svgtiny_gradient.c
+index 3a8db73..5172223 100644
+--- a/src/svgtiny_gradient.c
++++ b/src/svgtiny_gradient.c
+@@ -8,6 +8,7 @@
+ #include <assert.h>
+ #include <math.h>
+ #include <string.h>
++#include <stdlib.h>
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
+diff --git a/src/svgtiny_list.c b/src/svgtiny_list.c
+index 53cfb34..91e2c98 100644
+--- a/src/svgtiny_list.c
++++ b/src/svgtiny_list.c
+@@ -11,6 +11,7 @@
+  */
+ 
+ #include <assert.h>
++#include <stdlib.h>
+ #include "svgtiny.h"
+ #include "svgtiny_internal.h"
+ 
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
