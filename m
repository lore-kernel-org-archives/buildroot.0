Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF7FC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91185606AE;
	Thu,  7 Aug 2025 17:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzms2rRWMtea; Thu,  7 Aug 2025 17:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E936067E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E936067E;
	Thu,  7 Aug 2025 17:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2EB4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6196740463
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBzQ28DAi_Va for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C34D40498
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C34D40498
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A72985C8D; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:57 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 9e9f3b9a1534c332706d07046c80fcad79d4c356
X-Git-Newrev: b15d605d0dbc1f3352ea72f704cfd4b6a0220a01
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.9A72985C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/lrzsz: fix build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3582115667625159971=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3582115667625159971==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b15d605d0dbc1f3352ea72f704cfd4b6a0220a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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

--===============3582115667625159971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3582115667625159971==--
