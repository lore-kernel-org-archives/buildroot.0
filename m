Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C99CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F1B84072;
	Thu, 30 Oct 2025 08:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBcWWJ6cyX4C; Thu, 30 Oct 2025 08:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBBF0840A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBBF0840A6;
	Thu, 30 Oct 2025 08:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CCBF160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F22F612E8
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W71vXbC_y9if for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C0A960E79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C0A960E79
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A7D786065; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:56:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 23591357b8cb63b68a251c9d2edb9f75a0412f61
X-Git-Newrev: 31addc53be40a38b61ced7fac075dfc99e81f5ff
X-Patchwork-Hint: ignore
Message-Id: <20251030081040.8A7D786065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libshout: fix
 build with gcc >= 14.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31addc53be40a38b61ced7fac075dfc99e81f5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/c53/c53b7b613269acddd3467865c11784f59062a943/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5c5a28e46116c4f0caedb35aa422b983aa86b0a5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-icy-include-stdlib.h-and-stdio.h.patch    | 31 ++++++++++++++++++++++
 .../libshout/0002-legacy-include-stdlib.h.patch    | 30 +++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
new file mode 100644
index 0000000000..cf3f02bae9
--- /dev/null
+++ b/package/libshout/0001-icy-include-stdlib.h-and-stdio.h.patch
@@ -0,0 +1,31 @@
+From 3ea67b511bdf4f12b3d5de4d7e133badf8c18d54 Mon Sep 17 00:00:00 2001
+From: Alexandre Janniaux <ajanni@videolabs.io>
+Date: Wed, 14 Sep 2022 16:29:22 +0200
+Subject: [PATCH] icy: include stdlib.h and stdio.h
+
+malloc, free, and snprintf had no valid previous declaration, making the
+build fail with clang.
+
+Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/icy.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/icy.c b/src/icy.c
+index 8e83552..4de3c14 100644
+--- a/src/icy.c
++++ b/src/icy.c
+@@ -24,6 +24,8 @@
+ #endif
+ 
+ #include <stdbool.h>
++#include <stdlib.h> /* for free() and malloc() */
++#include <stdio.h> /* for snprintf() */
+ #include <string.h>
+ 
+ #include <shout/shout.h>
+-- 
+2.47.3
+
diff --git a/package/libshout/0002-legacy-include-stdlib.h.patch b/package/libshout/0002-legacy-include-stdlib.h.patch
new file mode 100644
index 0000000000..863d8095c8
--- /dev/null
+++ b/package/libshout/0002-legacy-include-stdlib.h.patch
@@ -0,0 +1,30 @@
+From 1742df325b52eef5af32c40893d821f895dc9d88 Mon Sep 17 00:00:00 2001
+From: Alexandre Janniaux <ajanni@videolabs.io>
+Date: Wed, 14 Sep 2022 16:30:03 +0200
+Subject: [PATCH] legacy: include stdlib.h
+
+free() had no previous declaration, making the build fail with clang.
+
+Upstream: https://gitlab.xiph.org/xiph/icecast-libshout/-/merge_requests/4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/legacy.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/legacy.c b/src/legacy.c
+index 3e1d3d7..e0ed961 100644
+--- a/src/legacy.c
++++ b/src/legacy.c
+@@ -28,6 +28,8 @@
+ #include "shout_private.h"
+ #include "util.h"
+ 
++#include <stdlib.h> /* for free() */
++
+ int shout_set_format(shout_t *self, unsigned int format)
+ {
+     if (!self)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
