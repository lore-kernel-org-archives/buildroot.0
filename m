Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B429CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 11:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 602BF84445;
	Fri, 10 Oct 2025 11:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l77q5pXA39bC; Fri, 10 Oct 2025 11:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A967837C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A967837C9;
	Fri, 10 Oct 2025 11:42:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7309014B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6380C614B5
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qYy1VGxvGxE for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 11:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E32860D77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E32860D77
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:42:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B4E986EAF; Fri, 10 Oct 2025 11:42:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 13:40:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15df9ec173f0c25df7f14f65719107f744248d4d
X-Git-Newrev: b5edd3d1051c1eee29b468858af9b1c933dda072
X-Patchwork-Hint: ignore
Message-Id: <20251010114200.7B4E986EAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdisplay-info: include
 sys/types.h to fix build error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5edd3d1051c1eee29b468858af9b1c933dda072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update patch Upstream link with commit ID]
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
