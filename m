Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ECCD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 815404029E;
	Sat, 26 Oct 2024 19:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NV2KaJ7CjQdL; Sat, 26 Oct 2024 19:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E444026F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E444026F;
	Sat, 26 Oct 2024 19:14:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 384682318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C8940003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ueTURLzzOul for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D40E440166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D40E440166
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AA6884044; Sat, 26 Oct 2024 19:14:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 21:09:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03c3083b977b4e63af531044143679f38792e430
X-Git-Newrev: ab3fb12c79e3edd809923f762cafcedd29b9df29
X-Patchwork-Hint: ignore
Message-Id: <20241026191437.3AA6884044@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump version to
 1.14.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab3fb12c79e3edd809923f762cafcedd29b9df29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bugfix release which plugs a couple of small leaks, and
includes patch "0001-Cast-to-EGLNativeWindowType-explicitly.patch",
which can now be removed. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.14.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Cast-to-EGLNativeWindowType-explicitly.patch | 36 ----------------------
 package/wpebackend-fdo/wpebackend-fdo.hash         |  7 +++--
 package/wpebackend-fdo/wpebackend-fdo.mk           |  2 +-
 3 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch b/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
deleted file mode 100644
index eae0d22e30..0000000000
--- a/package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e56a2597eb66c2221b004aa3356b06c1b071b5b5 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 14 Aug 2024 00:51:26 +0300
-Subject: [PATCH] Cast to EGLNativeWindowType explicitly
-
-In order to avoid off build failures due to mismatching (but
-compatible) declarations of wl_egl_window and EGLNativeWindowType,
-add an explicit cast to EGLNativeWindowType inside the
-TargetWayland::nativeWindow() function.
-
-Solves the following build issue found by the Buildroot autobuilders:
-
-  http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://github.com/Igalia/WPEBackend-fdo/commit/e56a2597eb66c2221b004aa3356b06c1b071b5b5
----
- src/egl-client-wayland.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/egl-client-wayland.cpp b/src/egl-client-wayland.cpp
-index 10e02f0..22bb212 100644
---- a/src/egl-client-wayland.cpp
-+++ b/src/egl-client-wayland.cpp
-@@ -63,7 +63,7 @@ TargetWayland::~TargetWayland()
- 
- EGLNativeWindowType TargetWayland::nativeWindow() const
- {
--    return m_egl.window;
-+    return (EGLNativeWindowType) m_egl.window;
- }
- 
- void TargetWayland::resize(uint32_t width, uint32_t height)
--- 
-2.46.0
-
diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 26ba121727..5055998ab7 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,6 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.2.tar.xz.sums
-sha1  f453f8d77e93f4ac6ac81c1874d4d6bdcb45c253  wpebackend-fdo-1.14.2.tar.xz
-sha256  93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38  wpebackend-fdo-1.14.2.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.3.tar.xz.sums
+md5  ab73398b1e35495977e50bee103969d2  wpebackend-fdo-1.14.3.tar.xz
+sha1  2d2945df15cc1efa957657fa727f3bc4c6f580bb  wpebackend-fdo-1.14.3.tar.xz
+sha256  10121842595a850291db3e82f3db0b9984df079022d386ce42c2b8508159dc6c  wpebackend-fdo-1.14.3.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 7ef347b622..dbabacf498 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.2
+WPEBACKEND_FDO_VERSION = 1.14.3
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
