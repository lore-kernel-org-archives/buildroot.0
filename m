Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDACECAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A026A41BDB;
	Thu, 11 Sep 2025 19:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdThdfaOVYA0; Thu, 11 Sep 2025 19:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E3B41B7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E3B41B7D;
	Thu, 11 Sep 2025 19:01:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4E53E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84836400F9
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqWxp8vjjG7O for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 585B141EF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 585B141EF4
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54EBA842A4; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:01:13 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 5196ff7564fd48a5e55c437694a32d33aebc3edb
X-Git-Newrev: dfe009868bce02b9cf4fc8d37f511706422eface
X-Patchwork-Hint: ignore
Message-Id: <20250911190109.54EBA842A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/lua-utf8: fix
 missing header
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
Content-Type: multipart/mixed; boundary="===============3139102989042188448=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3139102989042188448==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dfe009868bce02b9cf4fc8d37f511706422eface
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Backport an upstream patch adding missing limits.h.

https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774630 (TestLuajitUtf8)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f255b90afcc0e9c163a711bfe483cdf39e45e672)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...include-limits.h-instead-of-transitively-.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/lua-utf8/0001-Explicitly-include-limits.h-instead-of-transitively-.patch b/package/lua-utf8/0001-Explicitly-include-limits.h-instead-of-transitively-.patch
new file mode 100644
index 0000000000..f87930e6a9
--- /dev/null
+++ b/package/lua-utf8/0001-Explicitly-include-limits.h-instead-of-transitively-.patch
@@ -0,0 +1,58 @@
+From feda38c6b7ef4c564f77213037dc20768c638d9c Mon Sep 17 00:00:00 2001
+From: Caleb Maclennan <caleb@alerque.com>
+Date: Thu, 2 Jan 2025 15:42:05 +0300
+Subject: [PATCH] Explicitly include limits.h instead of transitively assuming
+ it
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Recent upstream releases of LuaJIT have broken building this Lua Rock
+entirely. PUC Lua and LuaJIT builds up to a certain point included this
+header in lua.h, which meant that it was always around as a transitive
+dependency. Recent upstream LuaJIT builds no longer include the header
+since they aren't using it directly any more, but that means things that
+include lua.h don't get it for free any more. It should never have been
+assumed anyway, but that's been the status quo for a while.
+
+This fixes build errors when using LuaJIT headers instead of PUC Lua:
+
+```
+lutf8lib.c: In function ‘Lutf8_codepoint’:
+lutf8lib.c:398:22: error: ‘INT_MAX’ undeclared (first use in this function)
+  398 |   if (pose - posi >= INT_MAX)  /* (lua_Integer -> int) overflow? */
+      |                      ^~~~~~~
+lutf8lib.c:12:1: note: ‘INT_MAX’ is defined in header ‘<limits.h>’; did you forget to ‘#include <limits.h>’?
+   11 | #include "unidata.h"
+  +++ |+#include <limits.h>
+   12 |
+lutf8lib.c:398:22: note: each undeclared identifier is reported only once for each function it appears in
+  398 |   if (pose - posi >= INT_MAX)  /* (lua_Integer -> int) overflow? */
+      |                      ^~~~~~~
+```
+
+This is because `INT_MAX` is defined appropriately for a given platfrom
+in in limits.h.
+
+Upstream: 1bb70d45208d4033dcc75efee968be70534dd3ab
+[Romain: rebase on 0.1.5]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ luautf8-0.1.5/lutf8lib.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/luautf8-0.1.5/lutf8lib.c b/luautf8-0.1.5/lutf8lib.c
+index 522599e..71f2f42 100644
+--- a/luautf8-0.1.5/lutf8lib.c
++++ b/luautf8-0.1.5/lutf8lib.c
+@@ -7,6 +7,7 @@
+ #include <assert.h>
+ #include <string.h>
+ #include <stdint.h>
++#include <limits.h>
+ 
+ #include "unidata.h"
+ 
+-- 
+2.51.0
+

--===============3139102989042188448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3139102989042188448==--
