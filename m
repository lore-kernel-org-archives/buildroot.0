Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CBBCD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D354026A;
	Tue,  3 Sep 2024 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdZSNp4p6zMW; Tue,  3 Sep 2024 20:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EA7D40308
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA7D40308;
	Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8961BF95C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6993060687
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kntYm0N4Xt1 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94FEB60679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94FEB60679
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:40:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8359E86C9A; Tue,  3 Sep 2024 20:40:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:39:08 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 1fcb43692cd63d999b22bc6426441df6daea4cb1
X-Git-Newrev: 5f8758451a079bae9b9bd045ecedf78469686e1b
X-Patchwork-Hint: ignore
Message-Id: <20240903204043.8359E86C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/mjpg-streamer:
 fix undefined symbol error
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f8758451a079bae9b9bd045ecedf78469686e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fixes runtime error:

    dlopen: /usr/lib/mjpg-streamer/input_uvc.so: undefined symbol: resolutions_help

Patch was suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2024-August/759732.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fdbc8d97cb166ce721df96acda6d291f6f2c4aa9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...xport-all-symbols-of-mjpg_streamer-binary.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch b/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch
new file mode 100644
index 0000000000..771ee83832
--- /dev/null
+++ b/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch
@@ -0,0 +1,33 @@
+From fbde1593948ae95f287b2167d0bec5b27948cc01 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Aug 2024 17:04:55 +0200
+Subject: [PATCH] Export all symbols of mjpg_streamer binary
+
+Fixes runtime error with stripped binary
+
+    dlopen: /usr/lib/mjpg-streamer/input_uvc.so: undefined symbol: resolutions_help
+
+Source: http://lists.busybox.net/pipermail/buildroot/2024-August/759732.html
+
+Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/401
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mjpg-streamer-experimental/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mjpg-streamer-experimental/CMakeLists.txt b/mjpg-streamer-experimental/CMakeLists.txt
+index cf26620..3ff12cd 100644
+--- a/mjpg-streamer-experimental/CMakeLists.txt
++++ b/mjpg-streamer-experimental/CMakeLists.txt
+@@ -92,6 +92,7 @@ set (CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
+ add_executable(mjpg_streamer mjpg_streamer.c
+                              utils.c)
+ 
++set_property(TARGET mjpg_streamer PROPERTY ENABLE_EXPORTS ON)
+ target_link_libraries(mjpg_streamer pthread dl)
+ install(TARGETS mjpg_streamer DESTINATION bin)
+ 
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
