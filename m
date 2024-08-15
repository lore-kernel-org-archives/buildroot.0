Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1832C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 13:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBBE407AA;
	Thu, 15 Aug 2024 13:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVMlFnTKUXa8; Thu, 15 Aug 2024 13:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36FE040824
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FE040824;
	Thu, 15 Aug 2024 13:34:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD2D61BF2A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA40F40247
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6508S15Chci for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 13:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97BFF40190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97BFF40190
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 13:34:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ADFA85EBD; Thu, 15 Aug 2024 13:34:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 15:33:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b866afa68405564497dd60c1f8f33cdf71d22728
X-Git-Newrev: 0904d3a2ee4132b2611a86d14da60285080d1adb
X-Patchwork-Hint: ignore
Message-Id: <20240815133418.8ADFA85EBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpebackend-fdo: add patch with
 missing EGL cast
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0904d3a2ee4132b2611a86d14da60285080d1adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import a patch that has been accepted upstream and fixes build failures
caused by a missing explicit cast to EGLNativeWindowType.

Fixes: http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
