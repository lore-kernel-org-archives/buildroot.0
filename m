Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ABECAC593
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 09:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EED676074D;
	Sun, 14 Sep 2025 09:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyIgRioo7T56; Sun, 14 Sep 2025 09:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A716612DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A716612DB;
	Sun, 14 Sep 2025 09:04:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A6A3255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 09:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00D73612DB
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 09:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NobbfJmpy79o for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 09:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA47060729
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA47060729
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 09:03:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E410584629; Sun, 14 Sep 2025 09:03:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 10:59:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32c4c926dbd330fcb02c17ac8078429e10df595a
X-Git-Newrev: 2a5cba5b9dfab20b7068bd7b8557a067c64ebbed
X-Patchwork-Hint: ignore
Message-Id: <20250914090359.E410584629@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-utf8: remove upstream patch
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5295613195046925499=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5295613195046925499==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2a5cba5b9dfab20b7068bd7b8557a067c64ebbed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running the following command when the package is selected:

    make lua-utf8-patch

fails with error message:

    Applying 0001-Explicitly-include-limits.h-instead-of-transitively-.patch using patch:
    can't find file to patch at input line 48

The package patch has been introduced in commit [1], while Buildroot
was in RC cycle. This patch was useful against version 0.1.5. The
package version was bumped to version 0.1.6 in commit [2] in the
branch next, which includes this patch.

Fixes:
https://autobuild.buildroot.org/results/3bffe55275a9434682af1bf3390d0830a4859c5c

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f255b90afcc0e9c163a711bfe483cdf39e45e672
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f1359db9c54bf815e142ea50821f5168da474500

Fixes:
https://autobuild.buildroot.org/results/3bffe55275a9434682af1bf3390d0830a4859c5c

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...include-limits.h-instead-of-transitively-.patch | 58 ----------------------
 1 file changed, 58 deletions(-)

diff --git a/package/lua-utf8/0001-Explicitly-include-limits.h-instead-of-transitively-.patch b/package/lua-utf8/0001-Explicitly-include-limits.h-instead-of-transitively-.patch
deleted file mode 100644
index f87930e6a9..0000000000
--- a/package/lua-utf8/0001-Explicitly-include-limits.h-instead-of-transitively-.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From feda38c6b7ef4c564f77213037dc20768c638d9c Mon Sep 17 00:00:00 2001
-From: Caleb Maclennan <caleb@alerque.com>
-Date: Thu, 2 Jan 2025 15:42:05 +0300
-Subject: [PATCH] Explicitly include limits.h instead of transitively assuming
- it
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Recent upstream releases of LuaJIT have broken building this Lua Rock
-entirely. PUC Lua and LuaJIT builds up to a certain point included this
-header in lua.h, which meant that it was always around as a transitive
-dependency. Recent upstream LuaJIT builds no longer include the header
-since they aren't using it directly any more, but that means things that
-include lua.h don't get it for free any more. It should never have been
-assumed anyway, but that's been the status quo for a while.
-
-This fixes build errors when using LuaJIT headers instead of PUC Lua:
-
-```
-lutf8lib.c: In function ‘Lutf8_codepoint’:
-lutf8lib.c:398:22: error: ‘INT_MAX’ undeclared (first use in this function)
-  398 |   if (pose - posi >= INT_MAX)  /* (lua_Integer -> int) overflow? */
-      |                      ^~~~~~~
-lutf8lib.c:12:1: note: ‘INT_MAX’ is defined in header ‘<limits.h>’; did you forget to ‘#include <limits.h>’?
-   11 | #include "unidata.h"
-  +++ |+#include <limits.h>
-   12 |
-lutf8lib.c:398:22: note: each undeclared identifier is reported only once for each function it appears in
-  398 |   if (pose - posi >= INT_MAX)  /* (lua_Integer -> int) overflow? */
-      |                      ^~~~~~~
-```
-
-This is because `INT_MAX` is defined appropriately for a given platfrom
-in in limits.h.
-
-Upstream: 1bb70d45208d4033dcc75efee968be70534dd3ab
-[Romain: rebase on 0.1.5]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- luautf8-0.1.5/lutf8lib.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/luautf8-0.1.5/lutf8lib.c b/luautf8-0.1.5/lutf8lib.c
-index 522599e..71f2f42 100644
---- a/luautf8-0.1.5/lutf8lib.c
-+++ b/luautf8-0.1.5/lutf8lib.c
-@@ -7,6 +7,7 @@
- #include <assert.h>
- #include <string.h>
- #include <stdint.h>
-+#include <limits.h>
- 
- #include "unidata.h"
- 
--- 
-2.51.0
-

--===============5295613195046925499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5295613195046925499==--
