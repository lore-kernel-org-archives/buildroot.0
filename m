Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95360CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 16:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB046F57A;
	Sun,  2 Nov 2025 16:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxzBkKJucI9I; Sun,  2 Nov 2025 16:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E2B6F57B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E2B6F57B;
	Sun,  2 Nov 2025 16:05:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E63C222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 16:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 546DC426C7
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 16:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ1Q8OY9Pgd9 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 16:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B9D1426A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B9D1426A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 16:05:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 846B583A1D; Sun,  2 Nov 2025 16:05:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 16:57:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e68414dc61b84d0f69c1ed1bb30bcd3d67473eb4
X-Git-Newrev: 821c2ab16f42bed52baec3876c4156284186a44a
X-Patchwork-Hint: ignore
Message-Id: <20251102160505.846B583A1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: fix build with newer versions
 of live555
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

commit: https://git.buildroot.net/buildroot/commit/?id=821c2ab16f42bed52baec3876c4156284186a44a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to prevent build errors with upcoming bump of live555.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ive555-fix-build-with-versions-2024.11.28.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch b/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
new file mode 100644
index 0000000000..9708f680c9
--- /dev/null
+++ b/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
@@ -0,0 +1,47 @@
+From 8befcbfa834b809602db24c9ba7456d8cfc25cdb Mon Sep 17 00:00:00 2001
+From: Florian Albrechtskirchinger <falbrechtskirchinger@gmail.com>
+Date: Sun, 2 Mar 2025 08:30:43 +0100
+Subject: [PATCH] live555: fix build with versions >= 2024.11.28
+
+In the 2024.11.28 release (version 1732752000), live555 introduced
+`EventLoopWatchVariable` as a typedef for `std::atomic<char>`, replacing
+direct use of `char` in earlier versions. Add a conditional typedef to
+define it as `char` for older versions, and update `event_rtsp` and
+`event_data` to use `EventLoopWatchVariable`.
+
+Upstream: https://code.videolan.org/videolan/vlc/-/commit/8befcbfa834b809602db24c9ba7456d8cfc25cdb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/access/live555.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
+index 461766661e49..cacea3c46952 100644
+--- a/modules/access/live555.cpp
++++ b/modules/access/live555.cpp
+@@ -194,6 +194,10 @@ class RTSPClientVlc;
+ #define CAP_SUBSESSION_PAUSE    (1 << 3)
+ #define CAPS_DEFAULT            CAP_RATE_CONTROL
+ 
++#if LIVEMEDIA_LIBRARY_VERSION_INT < 1732752000 // 2024.11.28
++typedef char EventLoopWatchVariable;
++#endif
++
+ struct demux_sys_t
+ {
+     char            *p_sdp;    /* XXX mallocated */
+@@ -232,8 +236,8 @@ struct demux_sys_t
+     bool             b_no_data;     /* if we never received any data */
+     int              i_no_data_ti;  /* consecutive number of TaskInterrupt */
+ 
+-    char             event_rtsp;
+-    char             event_data;
++    EventLoopWatchVariable event_rtsp;
++    EventLoopWatchVariable event_data;
+ 
+     bool             b_get_param;   /* Does the server support GET_PARAMETER */
+     bool             b_paused;      /* Are we paused? */
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
