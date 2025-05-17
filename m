Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9304BC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E458135B;
	Sat, 17 May 2025 15:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4lrYlqC7X0o; Sat, 17 May 2025 15:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ABC8811E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ABC8811E7;
	Sat, 17 May 2025 15:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D2DB223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5318340FC3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEA3onMkkXTq for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F95040FC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F95040FC2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:47:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CD1B86F6D; Sat, 17 May 2025 15:47:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:47:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2356a9e0a1a6d24c11bb74dd8ca3136c5c1c6cb
X-Git-Newrev: 236167347591fa1f464c594677a36395e9fe67a1
X-Patchwork-Hint: ignore
Message-Id: <20250517154748.8CD1B86F6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-hts: fix build with
 gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=236167347591fa1f464c594677a36395e9fe67a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-hts/0001-gcc15.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/kodi-pvr-hts/0001-gcc15.patch b/package/kodi-pvr-hts/0001-gcc15.patch
new file mode 100644
index 0000000000..a62c5f836b
--- /dev/null
+++ b/package/kodi-pvr-hts/0001-gcc15.patch
@@ -0,0 +1,26 @@
+From b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 00:19:15 +1100
+Subject: [PATCH] Fix build with gcc-15
+
+Backport upstream commit to fix build error with gcc-15.
+
+Upstream: https://github.com/kodi-pvr/pvr.hts/commit/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tvheadend/HTSPVFS.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/tvheadend/HTSPVFS.h b/src/tvheadend/HTSPVFS.h
+index 1fbf9d18..80f9fea3 100644
+--- a/src/tvheadend/HTSPVFS.h
++++ b/src/tvheadend/HTSPVFS.h
+@@ -9,6 +9,7 @@
+ 
+ #include <memory>
+ #include <string>
++#include <cstdint>
+ 
+ namespace kodi
+ {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
