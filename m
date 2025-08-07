Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4940C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E5980CA5;
	Thu,  7 Aug 2025 17:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv8JiVk9xWdB; Thu,  7 Aug 2025 17:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B865380CA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B865380CA1;
	Thu,  7 Aug 2025 17:00:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03CA231
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CA6F80C36
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHpF8elDfAle for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8111D80C0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8111D80C0E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EE7186984; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 96df7f1b017284f32b348e513793f296269a5b40
X-Git-Newrev: e9ce3c7753c2596d5724f5b7f2dd0aaf7b4c9794
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.7EE7186984@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lrzsz: fix build
 with musl
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
Content-Type: multipart/mixed; boundary="===============6053576307053770048=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6053576307053770048==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e9ce3c7753c2596d5724f5b7f2dd0aaf7b4c9794
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

lib/long-options.c failed to compile with musl for the same reason
0002-lib-long-options.c-include-stdlib.h.patch was added to fix,
exit() being undefined. The fix is the same as well: include stdlib.h.

Fixes: b6784a1f1f ("package/lrzsz: fix build with GCC >= 14.x")
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 54240460dcdbb1df76a092ad0f9d30b5b9875973)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch b/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch
index 6229114e0a..f0532bd036 100644
--- a/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch
+++ b/package/lrzsz/0002-lib-long-options.c-include-stdlib.h.patch
@@ -15,6 +15,8 @@ long-options.c:70:11: error: implicit declaration of function ‘exit’
 
 Upstream: https://github.com/UweOhse/lrzsz/pull/4
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Fiona: remove conditional on __GNU_LIBRARY__ to fix build with musl]
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
 ---
  lib/long-options.c | 9 +++++++++
  1 file changed, 9 insertions(+)
@@ -23,18 +25,12 @@ diff --git a/lib/long-options.c b/lib/long-options.c
 index 76b9796..19c84e0 100644
 --- a/lib/long-options.c
 +++ b/lib/long-options.c
-@@ -22,6 +22,15 @@
+@@ -22,6 +22,9 @@
  #endif
  
  #include <stdio.h>
 +
-+/* This needs to come after some library #include
-+   to get __GNU_LIBRARY__ defined.  */
-+#ifdef	__GNU_LIBRARY__
-+/* Don't include stdlib.h for non-GNU C libraries because some of them
-+   contain conflicting prototypes for getopt.  */
 +#include <stdlib.h>
-+#endif	/* GNU C library.  */
 +
  #include <getopt.h>
  #include "long-options.h"

--===============6053576307053770048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6053576307053770048==--
