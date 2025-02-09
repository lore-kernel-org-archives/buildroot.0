Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E284C0219E
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 08:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CC880BCB;
	Sun,  9 Feb 2025 08:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUz0vF8iATZt; Sun,  9 Feb 2025 08:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B06A82542
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B06A82542;
	Sun,  9 Feb 2025 08:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F41C8C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D503C400DD
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syT7uE2tr311 for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 08:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDC8C400DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDC8C400DA
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 08:51:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B12FB873AA; Sun,  9 Feb 2025 08:51:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 09:43:52 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: db19aa29a8a092f9a87f2549438f9cce23a5700c
X-Git-Newrev: 945968d41010854314a90faea51a83f315c7e06b
X-Patchwork-Hint: ignore
Message-Id: <20250209085107.B12FB873AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/sdbus-cpp: fix
 build failure on gcc14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=945968d41010854314a90faea51a83f315c7e06b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The original commit [1] was merged [2] in sdbus-cpp v1.5.0.

Fixes:
https://autobuild.buildroot.org/results/bd0a9fe123956f01336462a31c3375a036744234/

[1]
https://github.com/Kistler-Group/sdbus-cpp/commit/f50e4676fe9289eec0744efae2216aa8795fa461
[2] https://github.com/Kistler-Group/sdbus-cpp/pull/380

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
[Peter: add upstream tag to patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-add-missing-algorithm-header-include-380.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch b/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch
new file mode 100644
index 0000000000..7778408d63
--- /dev/null
+++ b/package/sdbus-cpp/0001-fix-add-missing-algorithm-header-include-380.patch
@@ -0,0 +1,30 @@
+From f50e4676fe9289eec0744efae2216aa8795fa461 Mon Sep 17 00:00:00 2001
+From: Alfred Wingate <parona@protonmail.com>
+Date: Thu, 16 Nov 2023 21:26:42 +0000
+Subject: [PATCH] fix: add missing algorithm header include (#380)
+
+* https://gcc.gnu.org/gcc-14/porting_to.html
+
+Using gcc 14 uncovers a missing include in Message.h
+
+Signed-off-by: Alfred Wingate <parona@protonmail.com>
+Upstream: https://github.com/Kistler-Group/sdbus-cpp/commit/f50e4676fe9289eec0744efae2216aa8795fa461
+---
+ include/sdbus-c++/Message.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/sdbus-c++/Message.h b/include/sdbus-c++/Message.h
+index 915a071..9c85c01 100644
+--- a/include/sdbus-c++/Message.h
++++ b/include/sdbus-c++/Message.h
+@@ -42,6 +42,7 @@
+ #include <cassert>
+ #include <functional>
+ #include <sys/types.h>
++#include <algorithm>
+ 
+ // Forward declarations
+ namespace sdbus {
+-- 
+2.48.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
