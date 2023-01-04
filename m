Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F374C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 439994EDE1;
	Mon, 20 Feb 2023 23:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 439994EDE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTfvddwv_sDi; Mon, 20 Feb 2023 23:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D237A4EDDB;
	Mon, 20 Feb 2023 23:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D237A4EDDB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DD2E1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EC7161AC8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC7161AC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5cfsXPdtPyx for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43843610B0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43843610B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 328A6828C8; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:21:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 76dfd8d0278d75dabfe2871cd4e683b7a2790d26
X-Git-Newrev: 917f05975f9c60eca92988ea9974de55a9e91e44
X-Patchwork-Hint: ignore
Message-Id: <20230220205223.328A6828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: bump to
 version 2.38.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=917f05975f9c60eca92988ea9974de55a9e91e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to a new major release which brings in improvements and a few
new features. Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.0.html

This release also includes security fixes for CVE-2022-32886,
CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2022-0009.html

Both building documentation and support for gobject-introspection have
been added in this release. Version 2.38.0 also introduces a new WebRTC
implementation based on GstWebRTC. Options for them are explicitly left
disabled to keep the configuration as it was, and may be enabled in
follow-up patches. Lastly, the SILENCE_CROSS_COMPILATION_NOTICES option
removed because it no longer exists.

The patch that fixes the build on 32-bit ARM targets is also updated
for the 2.38 release series.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...NEON.cpp-fails-to-build-NEON-fast-path-se.patch | 30 ++++++++++++++++------
 package/wpewebkit/wpewebkit.hash                   |  8 +++---
 package/wpewebkit/wpewebkit.mk                     |  8 +++---
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
index b61909b2ac..ea1676abb6 100644
--- a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
+++ b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
@@ -1,4 +1,4 @@
-From 59c9e3a4aeb4753be97b3817d106816d9a4ebe73 Mon Sep 17 00:00:00 2001
+From da159b0150cba0e5e5251e4cc6a090440f73cb7c Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
@@ -35,15 +35,28 @@ left for a follow-up fix.
 Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 [Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241182]
 ---
+ Source/WebCore/Sources.txt                    |  1 +
  .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
- .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
+ .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
  .../graphics/filters/DistantLightSource.h     |  4 ++
  .../platform/graphics/filters/FELighting.h    |  7 ---
  .../graphics/filters/PointLightSource.h       |  4 ++
  .../graphics/filters/SpotLightSource.h        |  4 ++
  .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 7 files changed, 56 insertions(+), 35 deletions(-)
+ 8 files changed, 58 insertions(+), 36 deletions(-)
 
+diff --git a/Source/WebCore/Sources.txt b/Source/WebCore/Sources.txt
+index 8ce3510fe1a8..efd56bcb8746 100644
+--- a/Source/WebCore/Sources.txt
++++ b/Source/WebCore/Sources.txt
+@@ -2136,6 +2136,7 @@ platform/graphics/WebMResourceClient.cpp
+ platform/graphics/WOFFFileFormat.cpp
+ platform/graphics/WidthIterator.cpp
+ platform/graphics/cpu/arm/filters/FEBlendNeonApplier.cpp
++platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+ platform/graphics/displaylists/DisplayList.cpp
+ platform/graphics/displaylists/DisplayListDrawingContext.cpp
+ platform/graphics/displaylists/DisplayListItems.cpp
 diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
 index f6ff8c20a5a8..42a97ffc5372 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
@@ -67,7 +80,7 @@ index f6ff8c20a5a8..42a97ffc5372 100644
      // Calling a powf function from the assembly code would require to save
      // and reload a lot of NEON registers. Since the base is in range [0..1]
 diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-index b17c603d40d3..e4629cda0b7c 100644
+index b17c603d40d3..c6d17f573eca 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 @@ -24,14 +24,15 @@
@@ -98,9 +111,10 @@ index b17c603d40d3..e4629cda0b7c 100644
  {
 -    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
 -    FELightingPaintingDataForNeon neonData = {
+-        data.pixels->data(),
 +    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
 +    WebCore::FELightingPaintingDataForNeon neonData = {
-         data.pixels->data(),
++        data.pixels->bytes(),
          1,
 -        data.widthDecreasedByOne - 1,
 -        data.heightDecreasedByOne - 1,
@@ -244,7 +258,7 @@ index 0c073bc13f8c..e0db00545c17 100644
      float m_surfaceScale;
      float m_diffuseConstant;
 diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index 5c9c7fb783e6..e53aa012ac1c 100644
+index 126b3b2350f6..d906db21aa9c 100644
 --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
 @@ -26,6 +26,10 @@
@@ -259,7 +273,7 @@ index 5c9c7fb783e6..e53aa012ac1c 100644
  
  class PointLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 04e331ec4ec0..763c8d400b00 100644
+index 641b205f986d..64380d9b6eb8 100644
 --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 @@ -26,6 +26,10 @@
@@ -274,7 +288,7 @@ index 04e331ec4ec0..763c8d400b00 100644
  
  class SpotLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-index 3875b0a4b5de..6d3864aafb9a 100644
+index c974d92115ff..e2896660cfbd 100644
 --- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
 +++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
 @@ -36,6 +36,7 @@
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 9c8beecf2e..5dd64b34b7 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.36.8.tar.xz.sums
-md5  939dc646bb6652fde9a5b6512c17fc58  wpewebkit-2.36.8.tar.xz
-sha1  f45936c578f7dcfbb6064e87da6c098efe093e68  wpewebkit-2.36.8.tar.xz
-sha256  8d42a349c910b2d0961b8d34fecef29cec3d21e3af5977346c90026692dc75eb  wpewebkit-2.36.8.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.0.tar.xz.sums
+md5  e0e6b98c86351c39e41da475afc50780  wpewebkit-2.38.0.tar.xz
+sha1  66e6dd1c285a21ce50370fb4d60332838d801663  wpewebkit-2.38.0.tar.xz
+sha256  e653e12eca63e6371c06d4cd9efcd5492db67f7d9ef324fd5d8668b1151e72b2  wpewebkit-2.38.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 0ff8204519..001c701ee9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.8
+WPEWEBKIT_VERSION = 2.38.0
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -22,9 +22,11 @@ WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
 	-DENABLE_ACCESSIBILITY=OFF \
 	-DENABLE_API_TESTS=OFF \
+	-DENABLE_DOCUMENTATION=OFF \
+	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
-	-DUSE_SOUP2=ON \
-	-DSILENCE_CROSS_COMPILATION_NOTICES=ON
+	-DENABLE_WEB_RTC=OFF \
+	-DUSE_SOUP2=ON
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
 WPEWEBKIT_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
