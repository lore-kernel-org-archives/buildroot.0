Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3B6CA0FE5
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CBC341180;
	Fri, 30 Aug 2024 12:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LyQJ1qoM-LEu; Fri, 30 Aug 2024 12:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 085EC4118F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 085EC4118F;
	Fri, 30 Aug 2024 12:26:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98FF61BF410
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9434840460
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKvQc6g2nPvc for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 814E54045A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 814E54045A
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E9298671B; Fri, 30 Aug 2024 12:25:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 14:21:22 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 645d271e451b83e3c58998999fbea380e7139dd0
X-Git-Newrev: 22b3ef2e30883f91baa49693648c62e1e8f13c31
X-Patchwork-Hint: ignore
Message-Id: <20240830122554.6E9298671B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/vorbis-tools: fix
 build with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=22b3ef2e30883f91baa49693648c62e1e8f13c31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with gcc >= 14:

codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
  119 |     if (utf8_decode(header, &decoded) < 0) {
      |         ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit a1bd5b31f255a8864a53a54de22a3b07fe799931)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../vorbis-tools/0001-fix-build-with-gcc-14.patch  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..a05ce8a584
--- /dev/null
+++ b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
@@ -0,0 +1,51 @@
+From f4a31fe975ea37537f39ace4420aee893b7e0b1a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 21:57:38 +0200
+Subject: [PATCH] fix build with gcc >= 14
+
+Add missing includes to avoid the following build failure with gcc >=
+14:
+
+codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
+codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
+  119 |     if (utf8_decode(header, &decoded) < 0) {
+      |         ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/xiph/vorbis-tools/pull/48
+---
+ ogginfo/codec_skeleton.c | 2 ++
+ share/utf8.c             | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
+index a27f8da..f906f8c 100644
+--- a/ogginfo/codec_skeleton.c
++++ b/ogginfo/codec_skeleton.c
+@@ -28,6 +28,8 @@
+ 
+ #include "private.h"
+ 
++#include "utf8.h"
++
+ typedef struct {
+     bool supported;
+     uint16_t version_major;
+diff --git a/share/utf8.c b/share/utf8.c
+index be378d1..e819b67 100644
+--- a/share/utf8.c
++++ b/share/utf8.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "charset.h"
+ #include "utf8.h"
+ 
+ 
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
