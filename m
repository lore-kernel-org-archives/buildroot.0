Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF9FCCD1BC
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08806135F;
	Wed, 22 Oct 2025 16:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NBNEyONFy8q; Wed, 22 Oct 2025 16:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4EF46134F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4EF46134F;
	Wed, 22 Oct 2025 16:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 111D0D8A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7FC940F98
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcTadNOdct4K for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E0A41130
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E0A41130
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFDEE866C6; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 284b177b60beebde90c6f4fb2ab8e48d63fbf703
X-Git-Newrev: ee767287ca25a9b2ec49ad3e228c143c9fb88c99
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.AFDEE866C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libdisplay-info:
 include sys/types.h to fix build error
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee767287ca25a9b2ec49ad3e228c143c9fb88c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes: https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update patch Upstream link with commit ID]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b5edd3d1051c1eee29b468858af9b1c933dda072)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-cta-include-sys-types.h.patch             | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libdisplay-info/0001-cta-include-sys-types.h.patch b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
new file mode 100644
index 0000000000..59049b0a94
--- /dev/null
+++ b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
@@ -0,0 +1,35 @@
+From e569a92539c96acd2a618729827c8fbf3659d803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 7 Oct 2025 22:44:01 +0200
+Subject: [PATCH] cta: include sys/types.h
+
+Fixes build error with uClibc-based toolchain and gcc 15.2.0 found by
+Buildroot autobuilders[1]:
+
+../cta.c: In function 'parse_vendor_hdmi_block':
+../cta.c:168:15: error: unknown type name 'ssize_t'; did you mean 'size_t'?
+
+[1] https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/
+
+Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/commit/84e8da3de9a89a95c4305abf6f578feae66dfa69
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cta.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cta.c b/cta.c
+index 12187cc..53edfca 100644
+--- a/cta.c
++++ b/cta.c
+@@ -4,6 +4,7 @@
+ #include <math.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/types.h>
+ 
+ #include "bits.h"
+ #include "cta.h"
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
