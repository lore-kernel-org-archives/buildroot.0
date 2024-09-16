Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12803C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4ED260A54;
	Mon, 16 Sep 2024 10:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkeeM9sy-lzz; Mon, 16 Sep 2024 10:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3EA360A88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3EA360A88;
	Mon, 16 Sep 2024 10:24:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E21B81BF95A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F5C2403F1
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXcj-22PRC8h for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F6E2403B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F6E2403B4
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 745A981364; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:10:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8f32aa2c15eceeb84594072acb7d80e56e6349c9
X-Git-Newrev: 56aeb15a87a7efc30eb0071a7cf611c49fe43f46
X-Patchwork-Hint: ignore
Message-Id: <20240916102405.745A981364@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wpebackend-fdo:
 add patch with missing EGL cast
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

commit: https://git.buildroot.net/buildroot/commit/?id=56aeb15a87a7efc30eb0071a7cf611c49fe43f46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Import a patch that has been accepted upstream and fixes build failures
caused by a missing explicit cast to EGLNativeWindowType.

Fixes: http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0904d3a2ee4132b2611a86d14da60285080d1adb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Cast-to-EGLNativeWindowType-explicitly.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch b/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
new file mode 100644
index 0000000000..eae0d22e30
--- /dev/null
+++ b/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
@@ -0,0 +1,36 @@
+From e56a2597eb66c2221b004aa3356b06c1b071b5b5 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 14 Aug 2024 00:51:26 +0300
+Subject: [PATCH] Cast to EGLNativeWindowType explicitly
+
+In order to avoid off build failures due to mismatching (but
+compatible) declarations of wl_egl_window and EGLNativeWindowType,
+add an explicit cast to EGLNativeWindowType inside the
+TargetWayland::nativeWindow() function.
+
+Solves the following build issue found by the Buildroot autobuilders:
+
+  http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/Igalia/WPEBackend-fdo/commit/e56a2597eb66c2221b004aa3356b06c1b071b5b5
+---
+ src/egl-client-wayland.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/egl-client-wayland.cpp b/src/egl-client-wayland.cpp
+index 10e02f0..22bb212 100644
+--- a/src/egl-client-wayland.cpp
++++ b/src/egl-client-wayland.cpp
+@@ -63,7 +63,7 @@ TargetWayland::~TargetWayland()
+ 
+ EGLNativeWindowType TargetWayland::nativeWindow() const
+ {
+-    return m_egl.window;
++    return (EGLNativeWindowType) m_egl.window;
+ }
+ 
+ void TargetWayland::resize(uint32_t width, uint32_t height)
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
