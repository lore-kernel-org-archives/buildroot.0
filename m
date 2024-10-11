Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8178ED0D78F
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 13:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA30614DF;
	Fri, 11 Oct 2024 13:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czQSCqtTK6pE; Fri, 11 Oct 2024 13:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3C7614D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3C7614D8;
	Fri, 11 Oct 2024 13:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 413131BF859
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1C7582038
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Es0sMDh2tGcc for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 13:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E712D840F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E712D840F2
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 13:06:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D34D885D4C; Fri, 11 Oct 2024 13:06:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 14:59:58 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e055e7cf2c297d37c0d38bf5780e5be0f90a1608
X-Git-Newrev: df7308ffefecc2871a36a8d6cb3532423d45505a
X-Patchwork-Hint: ignore
Message-Id: <20241011130613.D34D885D4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wpewebkit:
 security bump to version 2.44.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=df7308ffefecc2871a36a8d6cb3532423d45505a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes security issues CVE-2024-40776, CVE-2024-40779, CVE-2024-40780,
CVE-2024-40782, CVE-2024-40789, and CVE-2024-4558. Security advisory:

  https://wpewebkit.org/security/WSA-2024-0004.html

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.44.3.html
  https://wpewebkit.org/release/wpewebkit-2.44.4.html

Patch "0001-Remove-ARM-specific-declarations-in-FELighting.patch" has
been included as part of the fixes in version 2.44.3 and is therefore
removed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 064ddfc99742c9e8fe688faf8a9c92d4c905f455)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-ARM-specific-declarations-in-FELighting.patch | 68 ----------------------
 package/wpewebkit/wpewebkit.hash                   |  8 +--
 package/wpewebkit/wpewebkit.mk                     |  2 +-
 3 files changed, 5 insertions(+), 73 deletions(-)

diff --git a/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch b/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch
deleted file mode 100644
index 9e2bc86fef..0000000000
--- a/package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 8863ceb3c8486f31e1ccfcd2c7c602fad9feac52 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 27 May 2024 02:09:58 +0300
-Subject: [PATCH] Cherry-pick 279334@main (36d1b5d7c0ef). <bug>
-
-    Remove ARM-specific declarations in FELighting.h unneeded after 272873@main
-
-    Unreviewed build fix.
-
-    * Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
-      declarations for the getPowerCoefficients() and platformApplyNeon()
-      functions, which are now defined elsewhere; and were causing a build
-      failure due to usage of the protected LightingData type.
-    * Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp:
-      (WebCore::FELightingNeonParallelApplier::applyPlatformParallel const):
-      Add missing LightType:: namespace to uses of LS_POINT and LS_SPOT.
-
-    Canonical link: https://commits.webkit.org/279334@main
-
-Canonical link: https://commits.webkit.org/274313.261@webkitglib/2.44
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://github.com/WebKit/WebKit/commit/8863ceb3c8486f31e1ccfcd2c7c602fad9feac52
----
- .../cpu/arm/filters/FELightingNeonParallelApplier.cpp        | 4 ++--
- Source/WebCore/platform/graphics/filters/FELighting.h        | 5 -----
- 2 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-index 04d855fa6d71..5f4250d87b61 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNeonParallelApplier.cpp
-@@ -542,14 +542,14 @@ void FELightingNeonParallelApplier::applyPlatformParallel(const LightingData& da
-     floatArguments.colorBlue = color.blue;
-     floatArguments.padding4 = 0;
- 
--    if (data.lightSource->type() == LS_POINT) {
-+    if (data.lightSource->type() == LightType::LS_POINT) {
-         neonData.flags |= FLAG_POINT_LIGHT;
-         auto& pointLightSource = downcast<PointLightSource>(*data.lightSource);
-         floatArguments.lightX = pointLightSource.position().x();
-         floatArguments.lightY = pointLightSource.position().y();
-         floatArguments.lightZ = pointLightSource.position().z();
-         floatArguments.padding2 = 0;
--    } else if (data.lightSource->type() == LS_SPOT) {
-+    } else if (data.lightSource->type() == LightType::LS_SPOT) {
-         neonData.flags |= FLAG_SPOT_LIGHT;
-         auto& spotLightSource = downcast<SpotLightSource>(*data.lightSource);
-         floatArguments.lightX = spotLightSource.position().x();
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 4efab920b1c3..dcd80b6f42b7 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -68,11 +68,6 @@ protected:
- 
-     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
- 
--#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
--    static int getPowerCoefficients(float exponent);
--    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
--#endif
--
-     Color m_lightingColor;
-     float m_surfaceScale;
-     float m_diffuseConstant;
--- 
-2.45.2
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 790adbb0d4..7a7cef15a5 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.44.2.tar.xz.sums
-md5  0e2a6d05b000e79c51c537ab3261b171  wpewebkit-2.44.2.tar.xz
-sha1  5bded217fab25aea776e41158fcdbd72d69a612e  wpewebkit-2.44.2.tar.xz
-sha256  2a3d23cb4fb071ca0db3a09c5a85f27b8bcc6094a2026d3b7407bed4f99218f7  wpewebkit-2.44.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.44.4.tar.xz.sums
+md5  4d91f3ff629c9356dcff866b68a4646f  wpewebkit-2.44.4.tar.xz
+sha1  ef1ea0484e9ec17a362afe9a709fe0754f05cc14  wpewebkit-2.44.4.tar.xz
+sha256  cd6042c63a6f883cc1586e5cea94e846aaaee6a864c14988e8af4ef4f362ba3b  wpewebkit-2.44.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 9daca79fc7..a2b4bc402e 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-WPEWEBKIT_VERSION = 2.44.2
+WPEWEBKIT_VERSION = 2.44.4
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
