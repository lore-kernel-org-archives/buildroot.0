Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD51C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D64D4811B6;
	Sat, 17 May 2025 15:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puTyohl2ScSc; Sat, 17 May 2025 15:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C06280F34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C06280F34;
	Sat, 17 May 2025 15:47:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6812F1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5980240FC7
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgfI_lEI16vS for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A2C540FB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A2C540FB8
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:47:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95FBC86F70; Sat, 17 May 2025 15:47:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:47:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 236167347591fa1f464c594677a36395e9fe67a1
X-Git-Newrev: fe9817b215ee17d44a17c490672ab591d8c31353
X-Patchwork-Hint: ignore
Message-Id: <20250517154748.95FBC86F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: fix
 build with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe9817b215ee17d44a17c490672ab591d8c31353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-with-gcc-15.patch               | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch b/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..79daea00bc
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
@@ -0,0 +1,31 @@
+From 8ee42c56f1f5f959ce1c66ad4b33235a0b69c774 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 17 May 2025 12:19:09 +0200
+Subject: [PATCH] Fix build with gcc-15
+
+Upstream: not applicable
+
+The code which included uint16_t was removed in the to-be-released
+Piers branch:
+https://github.com/xbmc/inputstream.adaptive/commit/2afe7b8801d2da3059bfb2df0e5a6981fb9e46e9#diff-3dcaf13e4dbb2a79fa703382b7469e3c4ab1f0994928a5c0fca2627b8a9c8eac
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/common/AdaptiveUtils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/AdaptiveUtils.h b/src/common/AdaptiveUtils.h
+index 7563cb86..89812532 100644
+--- a/src/common/AdaptiveUtils.h
++++ b/src/common/AdaptiveUtils.h
+@@ -13,6 +13,7 @@
+ #include <memory>
+ #include <string_view>
+ #include <vector>
++#include <cstdint>
+ 
+ // forwards
+ class AP4_Movie;
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
