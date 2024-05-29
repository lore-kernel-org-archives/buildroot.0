Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF39C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 06:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B613B8114E;
	Wed, 29 May 2024 06:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKMd_i0DGuqx; Wed, 29 May 2024 06:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0480781141
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0480781141;
	Wed, 29 May 2024 06:17:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF361D3170
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36D0080C70
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rj3xWiUJcybf for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 06:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A837B81127
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A837B81127
 for <buildroot@buildroot.org>; Wed, 29 May 2024 06:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1694876C5; Wed, 29 May 2024 06:16:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 08:13:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8845a796bb4bc04d0504496e09a4634a93165b1d
X-Git-Newrev: 3d235a0689a7d571a8b67c474644312989275d3e
X-Patchwork-Hint: ignore
Message-Id: <20240529061656.A1694876C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.44.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d235a0689a7d571a8b67c474644312989275d3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the most recent stable release of WPE WebKit. As this is a
change to a newer release series, there are a few changes in the CMake
build options. Dependencies mostly remain the same. The main changes
are:

 - The new ENABLE_WEB_CODECS option is set along with ENABLE_VIDEO and
   ENABLE_WEB_RTC depending on BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA.
 - The new USE_LIBBACKTRACE option is set accordingly, depending on
   BR2_PACKAGE_LIBBACKTRACE.
 - WebAssembly does not work with ENABLE_C_LOOP, so it needs to be
   disabled alongside it for MIPSr6, ARMv5 and ARMv6; not that building
   WebAssembly support is enabled by default.
 - ENABLE_ACCESSIBILITY has been removed, instead the new USE_ATK option
   can be used to the same effect.
 - JPEG2000 is no longer supported, the openjpeg dependency is removed.

Release notes and announcement:

  - https://wpewebkit.org/blog/2024-wpewebkit-2.44.html

  - https://wpewebkit.org/release/wpewebkit-2.44.0.html
  - https://wpewebkit.org/release/wpewebkit-2.44.1.html
  - https://wpewebkit.org/release/wpewebkit-2.44.2.html

Relevant security advisories:

  - https://wpewebkit.org/security/WSA-2024-0002.html
  - https://wpewebkit.org/security/WSA-2024-0003.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Peter: use .tar.xz]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...NEON.cpp-fails-to-build-NEON-fast-path-se.patch | 337 ---------------------
 ...LowLevelInterpreter.cpp-339-21-error-t6-w.patch |  39 ---
 package/wpewebkit/Config.in                        |   1 -
 package/wpewebkit/wpewebkit.hash                   |   7 +-
 package/wpewebkit/wpewebkit.mk                     |  30 +-
 5 files changed, 26 insertions(+), 388 deletions(-)

diff --git a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
deleted file mode 100644
index 17d4957657..0000000000
--- a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
+++ /dev/null
@@ -1,337 +0,0 @@
-From 5ba2d275457c4fdf1efdcca8351792400bda5679 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Thu, 2 Jun 2022 11:19:06 +0300
-Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
- unused https://bugs.webkit.org/show_bug.cgi?id=241182
-
-Reviewed by NOBODY (OOPS!).
-
-Move the NEON fast path for the SVG lighting filter effects into
-FELightingSoftwareApplier, and arrange to actually use them by
-forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
-
-Some changes were needed to adapt platformApplyNeon() to the current
-state of filters after r286140. This was not detected because the code
-bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
-not get used much these days: CPU(ARM_THUMB2) is more common. It should
-be possible to use the NEON fast paths also in Thumb mode, but that is
-left for a follow-up fix.
-
-* Source/WebCore/Sources.txt:
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
-(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
-(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
-(WebCore::FELighting::platformApplyNeonWorker): Deleted.
-(WebCore::FELighting::getPowerCoefficients): Deleted.
-* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
-(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
-(WebCore::FELighting::platformApplyNeon): Deleted.
-* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
-* Source/WebCore/platform/graphics/filters/FELighting.h:
-* Source/WebCore/platform/graphics/filters/PointLightSource.h:
-* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
-* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://bugs.webkit.org/show_bug.cgi?id=241182
----
- Source/WebCore/Sources.txt                    |  1 +
- .../cpu/arm/filters/FELightingNEON.cpp        |  6 +--
- .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
- .../graphics/filters/DistantLightSource.h     |  4 ++
- .../platform/graphics/filters/FELighting.h    |  7 ---
- .../graphics/filters/PointLightSource.h       |  4 ++
- .../graphics/filters/SpotLightSource.h        |  4 ++
- .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 8 files changed, 59 insertions(+), 37 deletions(-)
-
-diff --git a/Source/WebCore/Sources.txt b/Source/WebCore/Sources.txt
-index 9ca28a7b2bc0..ed2c7f9f41ee 100644
---- a/Source/WebCore/Sources.txt
-+++ b/Source/WebCore/Sources.txt
-@@ -2303,6 +2303,7 @@ platform/graphics/controls/MeterPart.cpp
- platform/graphics/controls/ProgressBarPart.cpp
- platform/graphics/controls/SliderTrackPart.cpp
- platform/graphics/cpu/arm/filters/FEBlendNeonApplier.cpp
-+platform/graphics/cpu/arm/filters/FELightingNEON.cpp
- platform/graphics/displaylists/DisplayList.cpp
- platform/graphics/displaylists/DisplayListDrawingContext.cpp
- platform/graphics/displaylists/DisplayListItems.cpp
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-index f6ff8c20a5a8..dced3d55eb4e 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
-@@ -35,7 +35,7 @@ namespace WebCore {
- //   ALPHAX_Q ALPHAY_Q REMAPX_D REMAPY_D
-
-
--static alignas(16) short s_FELightingConstantsForNeon[] = {
-+alignas(16) static short s_FELightingConstantsForNeon[] = {
-     // Alpha coefficients.
-     -2, 1, 0, -1, 2, 1, 0, -1,
-     0, -1, -2, -1, 0, 1, 2, 1,
-@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
-     return s_FELightingConstantsForNeon;
- }
-
--void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
-+void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
- {
-     neonDrawLighting(parameters);
- }
-@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
-     "b .lightStrengthCalculated" NL
- ); // NOLINT
-
--int FELighting::getPowerCoefficients(float exponent)
-+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
- {
-     // Calling a powf function from the assembly code would require to save
-     // and reload a lot of NEON registers. Since the base is in range [0..1]
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-index b17c603d40d3..fd23e31cce29 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-@@ -24,14 +24,15 @@
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
-
--#ifndef FELightingNEON_h
--#define FELightingNEON_h
-+#pragma once
-
- #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
-
--#include "FELighting.h"
-+#include "FELightingSoftwareApplier.h"
-+#include "ImageBuffer.h"
- #include "PointLightSource.h"
- #include "SpotLightSource.h"
-+#include <wtf/ObjectIdentifier.h>
- #include <wtf/ParallelJobs.h>
-
- namespace WebCore {
-@@ -93,14 +94,14 @@ extern "C" {
- void neonDrawLighting(FELightingPaintingDataForNeon*);
- }
-
--inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
-+inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
- {
--    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
--    FELightingPaintingDataForNeon neonData = {
--        data.pixels->data(),
-+    alignas(16) WebCore::FELightingFloatArgumentsForNeon floatArguments;
-+    WebCore::FELightingPaintingDataForNeon neonData = {
-+        data.pixels->bytes(),
-         1,
--        data.widthDecreasedByOne - 1,
--        data.heightDecreasedByOne - 1,
-+        data.width - 2,
-+        data.height - 2,
-         0,
-         0,
-         0,
-@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-     // Set light source arguments.
-     floatArguments.constOne = 1;
-
--    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
-+    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
-
-     floatArguments.colorRed = color.red;
-     floatArguments.colorGreen = color.green;
-     floatArguments.colorBlue = color.blue;
-     floatArguments.padding4 = 0;
-
--    if (m_lightSource->type() == LS_POINT) {
-+    if (data.lightSource->type() == LS_POINT) {
-         neonData.flags |= FLAG_POINT_LIGHT;
--        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
-+        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
-         floatArguments.lightX = pointLightSource.position().x();
-         floatArguments.lightY = pointLightSource.position().y();
-         floatArguments.lightZ = pointLightSource.position().z();
-         floatArguments.padding2 = 0;
--    } else if (m_lightSource->type() == LS_SPOT) {
-+    } else if (data.lightSource->type() == LS_SPOT) {
-         neonData.flags |= FLAG_SPOT_LIGHT;
--        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
-+        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
-         floatArguments.lightX = spotLightSource.position().x();
-         floatArguments.lightY = spotLightSource.position().y();
-         floatArguments.lightZ = spotLightSource.position().z();
-@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-         if (spotLightSource.specularExponent() == 1)
-             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
-     } else {
--        ASSERT(m_lightSource->type() == LS_DISTANT);
-+        ASSERT(data.lightSource->type() == LS_DISTANT);
-         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
-         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
-         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
-@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-     // Set lighting arguments.
-     floatArguments.surfaceScale = data.surfaceScale;
-     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
--    if (m_lightingType == FELighting::DiffuseLighting)
--        floatArguments.diffuseConstant = m_diffuseConstant;
-+    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
-+        floatArguments.diffuseConstant = data.diffuseConstant;
-     else {
-         neonData.flags |= FLAG_SPECULAR_LIGHT;
--        floatArguments.diffuseConstant = m_specularConstant;
--        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
--        if (m_specularExponent == 1)
-+        floatArguments.diffuseConstant = data.specularConstant;
-+        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
-+        if (data.specularExponent == 1)
-             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
-     }
-     if (floatArguments.diffuseConstant == 1)
-         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
-
--    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
-+    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
-+    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
-     if (optimalThreadNumber > 1) {
-         // Initialize parallel jobs
--        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
-+        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
-
-         // Fill the parameter array
-         int job = parallelJobs.numberOfJobs();
-         if (job > 1) {
-             int yStart = 1;
--            int yStep = (data.heightDecreasedByOne - 1) / job;
-+            int yStep = (data.height - 2) / job;
-             for (--job; job >= 0; --job) {
-                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
-                 params = neonData;
-                 params.yStart = yStart;
--                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
-+                params.pixels += (yStart - 1) * data.width * 4;
-                 if (job > 0) {
-                     params.absoluteHeight = yStep;
-                     yStart += yStep;
-                 } else
--                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
-+                    params.absoluteHeight = (data.height - 1) - yStart;
-             }
-             parallelJobs.execute();
-             return;
-@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
- } // namespace WebCore
-
- #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
--
--#endif // FELightingNEON_h
-diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 70f583b36e2c..7d5d27e5ccf8 100644
---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -26,6 +26,10 @@
- #include <wtf/ArgumentCoder.h>
- #include <wtf/Ref.h>
-
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-
- class DistantLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 179edf6dba24..694d712d56fd 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -35,8 +35,6 @@
-
- namespace WebCore {
-
--struct FELightingPaintingDataForNeon;
--
- class FELighting : public FilterEffect {
- public:
-     bool operator==(const FELighting&) const;
-@@ -68,11 +66,6 @@ protected:
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
-diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index a8cfdab895a9..34f867bba237 100644
---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include <wtf/Ref.h>
-
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-
- class PointLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 6404467a5b6f..5cac38f22362 100644
---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-@@ -26,6 +26,10 @@
- #include "LightSource.h"
- #include <wtf/Ref.h>
-
-+namespace WTF {
-+class TextStream;
-+} // namespace WTF
-+
- namespace WebCore {
-
- class SpotLightSource : public LightSource {
-diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-index c974d92115ff..e2896660cfbd 100644
---- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-+++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
-@@ -36,6 +36,7 @@
- namespace WebCore {
-
- class FELighting;
-+struct FELightingPaintingDataForNeon;
-
- class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
-     WTF_MAKE_FAST_ALLOCATED;
-@@ -132,8 +133,23 @@ private:
-
-     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
-     static void applyPlatformGenericWorker(ApplyParameters*);
-+
-+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
-+    static int getPowerCoefficients(float exponent);
-+    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
-+    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
-+
-+    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
-+    {
-+        applyPlatformNeon(data, paintingData);
-+    }
-+#else
-     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
-+#endif
-+
-     static void applyPlatform(const LightingData&);
- };
-
- } // namespace WebCore
-+
-+#include "FELightingNEON.h"
---
-2.43.1
-
diff --git a/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch b/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
deleted file mode 100644
index a15d9e647f..0000000000
--- a/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 5 Feb 2024 11:00:49 -0600
-Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
- =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
- =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
- =?UTF-8?q?=3D268739?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Unreviewed build fix. Seems a backport went badly, and we didn't notice
-because the code is architecture-specific.
-
-* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
-(JSC::CLoop::execute):
-
-Upstream: https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
----
- Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 5064ead6cd2e..9a2e2653b121 100644
---- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-+++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
-     UNUSED_VARIABLE(t2);
-     UNUSED_VARIABLE(t3);
-     UNUSED_VARIABLE(t5);
--    UNUSED_VARIABLE(t6);
--    UNUSED_VARIABLE(t7);
-
-     struct StackPointerScope {
-         StackPointerScope(CLoopStack& stack)
---
-2.43.1
-
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 432aa4c3a3..e4b0320e1d 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -54,7 +54,6 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_OPENJPEG
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_WEBP
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 71e41bb1dd..790adbb0d4 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,6 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.42.5.tar.xz.sums
-sha1  50a18f43452520e9f34f84c04bc0166af655ffff  wpewebkit-2.42.5.tar.xz
-sha256  4dbab6c5e6dc0c65a3d7dffc1c2390be5f9abd423faf983fe3a55fe081df0532  wpewebkit-2.42.5.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.44.2.tar.xz.sums
+md5  0e2a6d05b000e79c51c537ab3261b171  wpewebkit-2.44.2.tar.xz
+sha1  5bded217fab25aea776e41158fcdbd72d69a612e  wpewebkit-2.44.2.tar.xz
+sha256  2a3d23cb4fb071ca0db3a09c5a85f27b8bcc6094a2026d3b7407bed4f99218f7  wpewebkit-2.44.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 442709848a..ecb3b3e352 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-WPEWEBKIT_VERSION = 2.42.5
+WPEWEBKIT_VERSION = 2.44.2
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -17,18 +17,18 @@ WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
-	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
+	libpng libxslt wayland-protocols webp wpebackend-fdo
 
 WPEWEBKIT_CMAKE_BACKEND = ninja
 
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
-	-DENABLE_ACCESSIBILITY=OFF \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_DOCUMENTATION=OFF \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
 	-DENABLE_WEB_RTC=OFF \
+	-DUSE_ATK=OFF \
 	-DUSE_AVIF=OFF
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
@@ -44,12 +44,14 @@ endif
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
-	-DENABLE_WEB_AUDIO=ON
+	-DENABLE_WEB_AUDIO=ON \
+	-DENABLE_WEB_CODECS=ON
 WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
 else
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF
+	-DENABLE_WEB_AUDIO=OFF \
+	-DENABLE_WEB_CODECS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM),y)
@@ -78,6 +80,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBACKTRACE),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_LIBBACKTRACE=ON
+WPEWEBKIT_DEPENDENCIES += libbacktrace
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_LIBBACKTRACE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WOFF2),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
 WPEWEBKIT_DEPENDENCIES += woff2
@@ -110,14 +119,19 @@ endif
 # have a check for these processors. The same goes for ARMv5 and ARMv6.
 # Disable JIT forcibly here and use the CLoop interpreter instead.
 #
-# Also, we have to disable the sampling profiler, which does NOT work
-# with ENABLE_C_LOOP.
+# Also, we have to disable the sampling profiler and WebAssembly, which
+# do NOT work with ENABLE_C_LOOP.
 #
 # Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
 #                https://bugs.webkit.org/show_bug.cgi?id=172765
+#                https://bugs.webkit.org/show_bug.cgi?id=265218
 #
 ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
+WPEWEBKIT_CONF_OPTS += \
+	-DENABLE_JIT=OFF \
+	-DENABLE_C_LOOP=ON \
+	-DENABLE_SAMPLING_PROFILER=OFF \
+	-DENABLE_WEBASSEMBLY=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
