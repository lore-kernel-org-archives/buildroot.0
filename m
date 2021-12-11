Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7434CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED65842706;
	Sat, 11 Dec 2021 20:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6VFmVsiH9cd; Sat, 11 Dec 2021 20:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1312C42729;
	Sat, 11 Dec 2021 20:54:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 170001BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40DF260768
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4gV_rsjG-wv for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42CC560D93
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2161882964; Sat, 11 Dec 2021 20:48:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:46:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b2da3caaf87e44b0e3a8d72d43135b123e38bb6
X-Git-Newrev: 4b89414ca8a2352d10cbc06b822874fa4529042a
X-Patchwork-Hint: ignore
Message-Id: <20211211204815.2161882964@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: bump version to 2.34.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b89414ca8a2352d10cbc06b822874fa4529042a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the the next minor release, which fixes an scrolling issue and
incorporated a patch that can now be removed from Buildroot. Release
notes:

  https://wpewebkit.org/release/wpewebkit-2.34.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ltiple-build-issues-with-ENABLE_VIDEO-OFF.patch | 78 ----------------------
 package/wpewebkit/wpewebkit.hash                   |  8 +--
 package/wpewebkit/wpewebkit.mk                     |  2 +-
 3 files changed, 5 insertions(+), 83 deletions(-)

diff --git a/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch b/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
deleted file mode 100644
index 932ade101c..0000000000
--- a/package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From afc83d41293333f694630451f865a7a257a9b917 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 25 Oct 2021 23:45:15 +0300
-Subject: [PATCH] [WPE][GTK] Multiple build issues with ENABLE_VIDEO=OFF
- https://bugs.webkit.org/show_bug.cgi?id=232264
-
-.:
-
-Reviewed by NOBODY (OOPS!).
-
-* Source/cmake/WebKitFeatures.cmake: Make ENABLE_MEDIA_SESSION depend on ENABLE_VIDEO.
-
-Source/WebCore:
-
-Reviewed by NOBODY (OOPS!).
-
-No new tests needed.
-
-* accessibility/AXObjectCache.cpp:
-(WebCore::isSimpleImage): Guard usage of HTMLMediaElement with ENABLE(VIDEO).
-* page/EventHandler.cpp:
-(WebCore::EventHandler::textRecognitionCandidateElement const): Ditto.
-* platform/graphics/BifurcatedGraphicsContext.cpp: Ditto.
-* platform/graphics/displaylists/DisplayListRecorder.h: Guard usage of MediaPlayer with
-ENABLE(VIDEO).
-* platform/graphics/displaylists/DisplayListRecorderImpl.cpp: Ditto.
-* platform/graphics/displaylists/DisplayListRecorderImpl.h: Ditto.
-
-Source/WebKit:
-
-* WebProcess/WebCoreSupport/ShareableBitmapUtilities.cpp:
-(WebKit::createShareableBitmap): Guard usage of RenderVideo with ENABLE(VIDEO).
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
----
-Upstream status: https://trac.webkit.org/changeset/284858/webkit
-
- Source/WebCore/accessibility/AXObjectCache.cpp                 | 2 ++
- Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/Source/WebCore/accessibility/AXObjectCache.cpp b/Source/WebCore/accessibility/AXObjectCache.cpp
-index f2451102040..930b969dcc2 100644
---- a/Source/WebCore/accessibility/AXObjectCache.cpp
-+++ b/Source/WebCore/accessibility/AXObjectCache.cpp
-@@ -528,9 +528,11 @@ static bool isSimpleImage(const RenderObject& renderer)
-         || (is<HTMLImageElement>(node) && downcast<HTMLImageElement>(node)->hasAttributeWithoutSynchronization(usemapAttr)))
-         return false;
- 
-+#if ENABLE(VIDEO)
-     // Exclude video and audio elements.
-     if (is<HTMLMediaElement>(node))
-         return false;
-+#endif // ENABLE(VIDEO)
- 
-     return true;
- }
-diff --git a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
-index c0ce72c5ffc..d7ead303f3c 100644
---- a/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
-+++ b/Source/WebCore/platform/graphics/BifurcatedGraphicsContext.cpp
-@@ -269,11 +269,13 @@ void BifurcatedGraphicsContext::drawPattern(NativeImage& nativeImage, const Floa
-     m_secondaryContext.drawPattern(nativeImage, imageSize, destRect, tileRect, patternTransform, phase, spacing, options);
- }
- 
-+#if ENABLE(VIDEO)
- void BifurcatedGraphicsContext::paintFrameForMedia(MediaPlayer& player, const FloatRect& destination)
- {
-     m_primaryContext.paintFrameForMedia(player, destination);
-     m_secondaryContext.paintFrameForMedia(player, destination);
- }
-+#endif // ENABLE(VIDEO)
- 
- void BifurcatedGraphicsContext::scale(const FloatSize& scale)
- {
--- 
-2.33.1
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index acb3ec4a3e..a71c1afc72 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.1.tar.xz.sums
-md5  915e583b0e7e82efa155cbce917d6319  wpewebkit-2.34.1.tar.xz
-sha1  452081b6df9d079f26d22bd0dca9e90f87943089  wpewebkit-2.34.1.tar.xz
-sha256  cb336986341be9c3a9b1ca2c18de0d29d90ae4e77b9967a6f6879597e7a969f7  wpewebkit-2.34.1.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.34.2.tar.xz.sums
+md5  b26f07bc809d9fd3e54e815c22312f15  wpewebkit-2.34.2.tar.xz
+sha1  4200ef87a4e1eb1921f0f40779742381598e1429  wpewebkit-2.34.2.tar.xz
+sha256  b1a3733c2d486c4da27f9636ccc39947da7d84258cd7a24a6fb0b842c9595c0b  wpewebkit-2.34.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index fbe87862a7..d936b342bf 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.1
+WPEWEBKIT_VERSION = 2.34.2
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
