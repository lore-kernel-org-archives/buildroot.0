Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F35FCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D8CA846AB;
	Thu, 21 Aug 2025 19:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiwtEPoWg_mx; Thu, 21 Aug 2025 19:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278138462E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278138462E;
	Thu, 21 Aug 2025 19:20:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1650B1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E90DD616FA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2Yp5mL2Mop7 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A2D616F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A2D616F1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64BAA8403C; Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:53:13 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 66c5fbb64ac91a6a43ec84d55abc1c88397a5590
X-Git-Newrev: 11e629db03a520c5f968a603eb89fc36e6cae15b
X-Patchwork-Hint: ignore
Message-Id: <20250821192011.64BAA8403C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/tinyssh: fix
 build issues with GCC 14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11e629db03a520c5f968a603eb89fc36e6cae15b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

tinyssh 20240101 fails to build on GCC 14 because of a missing include
for a forward declaration. Import the upstream patch that fixes it.

Fixes: https://autobuild.buildroot.org/results/e45/e4563317371c90669f6417ee3d1c48a41cb59cb2/
Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd0ce33b62d5c863470d839c4c1a0dded3ead15c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Add-missing-bug.h-include-for-global_die-.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch b/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch
new file mode 100644
index 0000000000..99649d4690
--- /dev/null
+++ b/package/tinyssh/0001-packet_put-Add-missing-bug.h-include-for-global_die-.patch
@@ -0,0 +1,33 @@
+From f863e60d93006019855a0431ea5cd71c8f1fc173 Mon Sep 17 00:00:00 2001
+From: Haelwenn Monnier <contact+github.com@hacktivis.me>
+Date: Tue, 9 Jan 2024 20:15:29 +0100
+Subject: [PATCH] packet_put: Add missing bug.h include for global_die (#84)
+
+```
+packet_put.c:53:9: error: call to undeclared function 'global_die'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+        global_die(111);
+        ^
+1 error generated.
+```
+
+Upstream: https://github.com/janmojzis/tinyssh/commit/f863e60d93006019855a0431ea5cd71c8f1fc173
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ tinyssh/packet_put.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tinyssh/packet_put.c b/tinyssh/packet_put.c
+index 17e8d84..7f46ff6 100644
+--- a/tinyssh/packet_put.c
++++ b/tinyssh/packet_put.c
+@@ -6,6 +6,7 @@ Public domain.
+ 
+ #include "uint32_pack_big.h"
+ #include "buf.h"
++#include "bug.h"
+ #include "sshcrypto.h"
+ #include "ssh.h"
+ #include "log.h"
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
