Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E98C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7745D8133C;
	Sat, 27 Jan 2024 18:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7745D8133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ludk52185zbt; Sat, 27 Jan 2024 18:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8026812EA;
	Sat, 27 Jan 2024 18:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8026812EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 271D41BF2E3
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9FBC4051A
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9FBC4051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tjHZ0Q8JMsH for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:03:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB76B4012E
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB76B4012E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 947DA8653A; Sat, 27 Jan 2024 18:03:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 18:58:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 611c0cb198041f518f2be3e0f5236d5c6ef93f58
X-Git-Newrev: 1dd1a21d4d85146d2593e3db205c458c44dc8c6a
X-Patchwork-Hint: ignore
Message-Id: <20240127180339.947DA8653A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/uuu: fix build failure
 with host gcc 13.x"
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dd1a21d4d85146d2593e3db205c458c44dc8c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2 as it
raises the following build failure because patch has been merged since
version 1.5.104:

Applying 0001-Fix-missing-references.patch using patch:
patching file libuuu/libcomm.h
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file libuuu/libcomm.h.rej
patching file uuu/buildincmd.h
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file uuu/buildincmd.h.rej

Fixes:
 - http://autobuild.buildroot.org/results/bf7b2206261e3385c567ae4359b0379b03161e3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uuu/0001-Fix-missing-references.patch | 40 ---------------------------
 1 file changed, 40 deletions(-)

diff --git a/package/uuu/0001-Fix-missing-references.patch b/package/uuu/0001-Fix-missing-references.patch
deleted file mode 100644
index 140c9755c7..0000000000
--- a/package/uuu/0001-Fix-missing-references.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 24fd043225903247f71ac10666d820277c0b10b1 Mon Sep 17 00:00:00 2001
-From: nixgnauhcuy <nixgnauhcuy@gmail.com>
-Date: Tue, 9 May 2023 14:32:33 +0800
-Subject: [PATCH] Fix missing references
-
-Upstream: https://github.com/nxp-imx/mfgtools/commit/24fd043225903247f71ac10666d820277c0b10b1
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- libuuu/libcomm.h | 1 +
- uuu/buildincmd.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libuuu/libcomm.h b/libuuu/libcomm.h
-index 0afdfa3..38d622d 100644
---- a/libuuu/libcomm.h
-+++ b/libuuu/libcomm.h
-@@ -28,6 +28,7 @@
- * POSSIBILITY OF SUCH DAMAGE.
- *
- */
-+#include <stdint.h>
- #include <string>
- #include <stdarg.h>
- #include <locale>
-diff --git a/uuu/buildincmd.h b/uuu/buildincmd.h
-index 9415117..46286cc 100644
---- a/uuu/buildincmd.h
-+++ b/uuu/buildincmd.h
-@@ -31,6 +31,7 @@
- 
- #pragma once
- 
-+#include <stdint.h>
- #include <map>
- #include <string>
- #include <vector>
--- 
-2.34.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
