Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302D4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 20:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7CCF81D5C;
	Wed, 24 Nov 2021 20:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8jPnv6fqqhO; Wed, 24 Nov 2021 20:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB16280D1B;
	Wed, 24 Nov 2021 20:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBC671BF4E2
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8B5680D1B
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpOYm62vzz4c for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 20:56:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBE0880CED
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9u70jDvRxRYmlmY9lVF5xmci2Gi1svQfOStSWpQ9Ayo=; b=hZAfav2cxjpqDGAvEFjjhOz2eX
 L2FdQYHmMDMWgAvuIMbfBASWatt/2AmMrnCEIKSMA4Ck+N93JZdh/k0HfLUK8ayvxQ3yB3TFWvUtF
 IkEny6mNVjz3OExl8eRqLhl3reV7KubCMbPdwpQrKqZJbhL5w7qsf9M84L9zm5qqxMxiijGPbTSQs
 gjWCOwQ4/WqeXiPAUWJfDAqK2fcofi5vYwUf7gdY9HIkCblIkstV7iRzSt5/e7o/1mF0xikgkmNQE
 4NxVbuwWthL0Zi628TzYC6T1bTtqZIcPzQhbUaB0CrvJsGFa1dU/Ilo1hpttraZpuprSsBRZ+rnVK
 42LRCD3g==;
Received: from 91-153-34-221.elisa-laajakaista.fi ([91.153.34.221] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1mpzJT-0003ZW-1i; Wed, 24 Nov 2021 21:56:19 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id b98f6d56;
 Wed, 24 Nov 2021 20:56:07 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 22:56:07 +0200
Message-Id: <20211124205607.3021277-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump version to 2.34.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the the next minor release, which fixes an scrolling issue and
incorporated a patch that can now be removed from Buildroot. Release
notes:

  https://wpewebkit.org/release/wpewebkit-2.34.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...e-build-issues-with-ENABLE_VIDEO-OFF.patch | 78 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 +-
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 5 insertions(+), 83 deletions(-)
 delete mode 100644 package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch

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
index a1e8bff784..7d6b7692fd 100644
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
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
