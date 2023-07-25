Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197C3EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7911610EF;
	Tue, 25 Jul 2023 19:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7911610EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydeNiecCNEyc; Tue, 25 Jul 2023 19:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320A860A4F;
	Tue, 25 Jul 2023 19:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 320A860A4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD7C81BF980
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4BF782072
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4BF782072
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vQEJFejJSM4 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:48:55 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA53781CE7
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA53781CE7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BCF007802D1;
 Tue, 25 Jul 2023 21:48:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 21:48:48 +0200
Date: Tue, 25 Jul 2023 21:48:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230725194848.GL3544423@scaer>
References: <20230725171008.1559503-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725171008.1559503-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690314532;
 bh=2+4UwuaJHjHLpZLaObYC7NDPMYNhnpKFJB/S/5fhdCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oP2hg5M5k0WzxCwEE3dndYfdQbiFVhxh+zOHg8AP1h4a9Tu5SN0LmoP2jd32OSlYN
 JD1B86Tfrn/E8iaOWkqpYrUg/CQpwom21EhdHO4YQD4hCaR1WNmFANkcdvluAg2k+X
 Y5+Kul7ww45FyCj8S35pAGwUxH68uYwXla2SNsO9+LtCQCfyXwhvK6qW2UDWJffz7c
 DBB224l2LHuambaVrsTY45p9BEpOBUyg7mcrz/LeRabQAEsFNADpss+brfz2wFC+/f
 J6K7rFbCCrNtx+wHIOt+8XG0Sq8t803cDh1VqGSXTSQtwVy9I1YIPNYWVEozJjw7Kf
 cJVAj2//DUpIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oP2hg5M5
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: drop NEON build fix
 patch
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

+Adrian

On 2023-07-25 11:10 -0600, James Hilliard spake thusly:
> This patch is already upstream and no longer applies.

What do you mean by it "no longer applies"?

If I run it locally, it does apply (albeit with some fuzz):

    $ make wpewebkit-patch
    [...]
    Applying 0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch using patch:
    patching file Source/WebCore/Sources.txt
    Hunk #1 succeeded at 2234 with fuzz 2 (offset 98 lines).
    patching file Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
    patching file Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
    patching file Source/WebCore/platform/graphics/filters/DistantLightSource.h
    Hunk #1 succeeded at 26 with fuzz 1 (offset 1 line).
    patching file Source/WebCore/platform/graphics/filters/FELighting.h
    Hunk #2 succeeded at 62 (offset -3 lines).
    patching file Source/WebCore/platform/graphics/filters/PointLightSource.h
    patching file Source/WebCore/platform/graphics/filters/SpotLightSource.h
    patching file Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h

So, can you clarify the situation, please?

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...cpp-fails-to-build-NEON-fast-path-se.patch | 328 ------------------
>  1 file changed, 328 deletions(-)
>  delete mode 100644 package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
> 
> diff --git a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
> deleted file mode 100644
> index ea1676abb6..0000000000
> --- a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
> +++ /dev/null
> @@ -1,328 +0,0 @@
> -From da159b0150cba0e5e5251e4cc6a090440f73cb7c Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Thu, 2 Jun 2022 11:19:06 +0300
> -Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
> - unused https://bugs.webkit.org/show_bug.cgi?id=241182
> -
> -Reviewed by NOBODY (OOPS!).
> -
> -Move the NEON fast path for the SVG lighting filter effects into
> -FELightingSoftwareApplier, and arrange to actually use them by
> -forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> -
> -Some changes were needed to adapt platformApplyNeon() to the current
> -state of filters after r286140. This was not detected because the code
> -bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
> -not get used much these days: CPU(ARM_THUMB2) is more common. It should
> -be possible to use the NEON fast paths also in Thumb mode, but that is
> -left for a follow-up fix.
> -
> -* Source/WebCore/Sources.txt:
> -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> -(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> -(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> -(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> -(WebCore::FELighting::getPowerCoefficients): Deleted.
> -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> -(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> -(WebCore::FELighting::platformApplyNeon): Deleted.
> -* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> -* Source/WebCore/platform/graphics/filters/FELighting.h:
> -* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> -* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> -* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
> -
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241182]
> ----
> - Source/WebCore/Sources.txt                    |  1 +
> - .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> - .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
> - .../graphics/filters/DistantLightSource.h     |  4 ++
> - .../platform/graphics/filters/FELighting.h    |  7 ---
> - .../graphics/filters/PointLightSource.h       |  4 ++
> - .../graphics/filters/SpotLightSource.h        |  4 ++
> - .../software/FELightingSoftwareApplier.h      | 16 ++++++
> - 8 files changed, 58 insertions(+), 36 deletions(-)
> -
> -diff --git a/Source/WebCore/Sources.txt b/Source/WebCore/Sources.txt
> -index 8ce3510fe1a8..efd56bcb8746 100644
> ---- a/Source/WebCore/Sources.txt
> -+++ b/Source/WebCore/Sources.txt
> -@@ -2136,6 +2136,7 @@ platform/graphics/WebMResourceClient.cpp
> - platform/graphics/WOFFFileFormat.cpp
> - platform/graphics/WidthIterator.cpp
> - platform/graphics/cpu/arm/filters/FEBlendNeonApplier.cpp
> -+platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> - platform/graphics/displaylists/DisplayList.cpp
> - platform/graphics/displaylists/DisplayListDrawingContext.cpp
> - platform/graphics/displaylists/DisplayListItems.cpp
> -diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -index f6ff8c20a5a8..42a97ffc5372 100644
> ---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> -     return s_FELightingConstantsForNeon;
> - }
> - 
> --void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> -+void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> - {
> -     neonDrawLighting(parameters);
> - }
> -@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> -     "b .lightStrengthCalculated" NL
> - ); // NOLINT
> - 
> --int FELighting::getPowerCoefficients(float exponent)
> -+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> - {
> -     // Calling a powf function from the assembly code would require to save
> -     // and reload a lot of NEON registers. Since the base is in range [0..1]
> -diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -index b17c603d40d3..c6d17f573eca 100644
> ---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -@@ -24,14 +24,15 @@
> -  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -  */
> - 
> --#ifndef FELightingNEON_h
> --#define FELightingNEON_h
> -+#pragma once
> - 
> - #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> - 
> --#include "FELighting.h"
> -+#include "FELightingSoftwareApplier.h"
> -+#include "ImageBuffer.h"
> - #include "PointLightSource.h"
> - #include "SpotLightSource.h"
> -+#include <wtf/ObjectIdentifier.h>
> - #include <wtf/ParallelJobs.h>
> - 
> - namespace WebCore {
> -@@ -93,14 +94,14 @@ extern "C" {
> - void neonDrawLighting(FELightingPaintingDataForNeon*);
> - }
> - 
> --inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
> -+inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
> - {
> --    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> --    FELightingPaintingDataForNeon neonData = {
> --        data.pixels->data(),
> -+    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
> -+    WebCore::FELightingPaintingDataForNeon neonData = {
> -+        data.pixels->bytes(),
> -         1,
> --        data.widthDecreasedByOne - 1,
> --        data.heightDecreasedByOne - 1,
> -+        data.width - 2,
> -+        data.height - 2,
> -         0,
> -         0,
> -         0,
> -@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> -     // Set light source arguments.
> -     floatArguments.constOne = 1;
> - 
> --    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> -+    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> - 
> -     floatArguments.colorRed = color.red;
> -     floatArguments.colorGreen = color.green;
> -     floatArguments.colorBlue = color.blue;
> -     floatArguments.padding4 = 0;
> - 
> --    if (m_lightSource->type() == LS_POINT) {
> -+    if (data.lightSource->type() == LS_POINT) {
> -         neonData.flags |= FLAG_POINT_LIGHT;
> --        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
> -+        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
> -         floatArguments.lightX = pointLightSource.position().x();
> -         floatArguments.lightY = pointLightSource.position().y();
> -         floatArguments.lightZ = pointLightSource.position().z();
> -         floatArguments.padding2 = 0;
> --    } else if (m_lightSource->type() == LS_SPOT) {
> -+    } else if (data.lightSource->type() == LS_SPOT) {
> -         neonData.flags |= FLAG_SPOT_LIGHT;
> --        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
> -+        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
> -         floatArguments.lightX = spotLightSource.position().x();
> -         floatArguments.lightY = spotLightSource.position().y();
> -         floatArguments.lightZ = spotLightSource.position().z();
> -@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> -         if (spotLightSource.specularExponent() == 1)
> -             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> -     } else {
> --        ASSERT(m_lightSource->type() == LS_DISTANT);
> -+        ASSERT(data.lightSource->type() == LS_DISTANT);
> -         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
> -         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
> -         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
> -@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> -     // Set lighting arguments.
> -     floatArguments.surfaceScale = data.surfaceScale;
> -     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
> --    if (m_lightingType == FELighting::DiffuseLighting)
> --        floatArguments.diffuseConstant = m_diffuseConstant;
> -+    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
> -+        floatArguments.diffuseConstant = data.diffuseConstant;
> -     else {
> -         neonData.flags |= FLAG_SPECULAR_LIGHT;
> --        floatArguments.diffuseConstant = m_specularConstant;
> --        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
> --        if (m_specularExponent == 1)
> -+        floatArguments.diffuseConstant = data.specularConstant;
> -+        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
> -+        if (data.specularExponent == 1)
> -             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
> -     }
> -     if (floatArguments.diffuseConstant == 1)
> -         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
> - 
> --    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> -+    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
> -+    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
> -     if (optimalThreadNumber > 1) {
> -         // Initialize parallel jobs
> --        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
> -+        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
> - 
> -         // Fill the parameter array
> -         int job = parallelJobs.numberOfJobs();
> -         if (job > 1) {
> -             int yStart = 1;
> --            int yStep = (data.heightDecreasedByOne - 1) / job;
> -+            int yStep = (data.height - 2) / job;
> -             for (--job; job >= 0; --job) {
> -                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
> -                 params = neonData;
> -                 params.yStart = yStart;
> --                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
> -+                params.pixels += (yStart - 1) * data.width * 4;
> -                 if (job > 0) {
> -                     params.absoluteHeight = yStep;
> -                     yStart += yStep;
> -                 } else
> --                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
> -+                    params.absoluteHeight = (data.height - 1) - yStart;
> -             }
> -             parallelJobs.execute();
> -             return;
> -@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
> - } // namespace WebCore
> - 
> - #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> --
> --#endif // FELightingNEON_h
> -diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -index 0660143fc1cf..2b1e86d99fa4 100644
> ---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -@@ -25,6 +25,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> - 
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> - 
> - class DistantLightSource : public LightSource {
> -diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
> -index 0c073bc13f8c..e0db00545c17 100644
> ---- a/Source/WebCore/platform/graphics/filters/FELighting.h
> -+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> -@@ -35,8 +35,6 @@
> - 
> - namespace WebCore {
> - 
> --struct FELightingPaintingDataForNeon;
> --
> - class FELighting : public FilterEffect {
> - public:
> -     const Color& lightingColor() const { return m_lightingColor; }
> -@@ -67,11 +65,6 @@ protected:
> - 
> -     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
> - 
> --#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> --    static int getPowerCoefficients(float exponent);
> --    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
> --#endif
> --
> -     Color m_lightingColor;
> -     float m_surfaceScale;
> -     float m_diffuseConstant;
> -diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -index 126b3b2350f6..d906db21aa9c 100644
> ---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> - 
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> - 
> - class PointLightSource : public LightSource {
> -diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -index 641b205f986d..64380d9b6eb8 100644
> ---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> - 
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> - 
> - class SpotLightSource : public LightSource {
> -diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -index c974d92115ff..e2896660cfbd 100644
> ---- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -+++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -@@ -36,6 +36,7 @@
> - namespace WebCore {
> - 
> - class FELighting;
> -+struct FELightingPaintingDataForNeon;
> - 
> - class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
> -     WTF_MAKE_FAST_ALLOCATED;
> -@@ -132,8 +133,23 @@ private:
> - 
> -     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
> -     static void applyPlatformGenericWorker(ApplyParameters*);
> -+
> -+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> -+    static int getPowerCoefficients(float exponent);
> -+    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> -+    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
> -+
> -+    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
> -+    {
> -+        applyPlatformNeon(data, paintingData);
> -+    }
> -+#else
> -     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
> -+#endif
> -+
> -     static void applyPlatform(const LightingData&);
> - };
> - 
> - } // namespace WebCore
> -+
> -+#include "FELightingNEON.h"
> --- 
> -2.37.3
> -
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
