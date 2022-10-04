Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB106C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 13:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3500B40BEE;
	Tue,  4 Oct 2022 13:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3500B40BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxemfIM592Ii; Tue,  4 Oct 2022 13:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B664640BE4;
	Tue,  4 Oct 2022 13:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B664640BE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E98D1BF841
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5C0340469
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5C0340469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFd_czExW48g for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 13:31:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 660994032B
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 660994032B
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 13:31:13 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ofi0t-007mYY-AO; Tue, 04 Oct 2022 15:31:11 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 333ba8e5;
 Tue, 4 Oct 2022 13:30:57 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 16:30:53 +0300
Message-Id: <20221004133057.2003750-2-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004133057.2003750-1-aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20221004133057.2003750-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDeCzVVS/arQoFmXb+YNx/bJhgybYHIeb4jCPgKuruY=; b=Mq+zLDuwhFd8Uj8SBzRlnzcuMt
 137Jtta0QdOzG5tkK5vVOB+G8dqqgR5XgK6LGsKyaEkP3pPgYp1CbT9dD29CpS2rOaF44+Rsiw9eQ
 1/Y8JtZ+BCL+nGqWT9tJniTRfzisQCUirxQmjq2BKELlDYakJHFnpoQ7eygSEDefC698GW9HBNda6
 Aqi+YG6EAe+Y++kTVmsXHlfMBk3Am2Sux5j2hetlDGKMk6AtOlHDQYWqZ2vB05RZCfvTRa9k13IsO
 rwVzSOc/HicYs7Z//zrQdpPdByAsI9P+9eiO9CDvXoIntLKAM9WVfY91jSR7Lp8pTDLbJdX7LM+uJ
 M6osuy5A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Mq+zLDuw
Subject: [Buildroot] [PATCH 1/5] package/wpewebkit: security bump to version
 2.36.8
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release, with security fixes for CVE-2022-32886 and CVE-2022-32912.
Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.8.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2022-0009.html

This also imports a build fix for ARM NEON targets.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 314 ++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |   8 +-
 package/wpewebkit/wpewebkit.mk                |   2 +-
 3 files changed, 319 insertions(+), 5 deletions(-)
 create mode 100644 package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch

diff --git a/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
new file mode 100644
index 0000000000..b61909b2ac
--- /dev/null
+++ b/package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
@@ -0,0 +1,314 @@
+From 59c9e3a4aeb4753be97b3817d106816d9a4ebe73 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Thu, 2 Jun 2022 11:19:06 +0300
+Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
+ unused https://bugs.webkit.org/show_bug.cgi?id=241182
+
+Reviewed by NOBODY (OOPS!).
+
+Move the NEON fast path for the SVG lighting filter effects into
+FELightingSoftwareApplier, and arrange to actually use them by
+forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
+
+Some changes were needed to adapt platformApplyNeon() to the current
+state of filters after r286140. This was not detected because the code
+bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
+not get used much these days: CPU(ARM_THUMB2) is more common. It should
+be possible to use the NEON fast paths also in Thumb mode, but that is
+left for a follow-up fix.
+
+* Source/WebCore/Sources.txt:
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
+(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
+(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
+(WebCore::FELighting::platformApplyNeonWorker): Deleted.
+(WebCore::FELighting::getPowerCoefficients): Deleted.
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
+(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
+(WebCore::FELighting::platformApplyNeon): Deleted.
+* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
+* Source/WebCore/platform/graphics/filters/FELighting.h:
+* Source/WebCore/platform/graphics/filters/PointLightSource.h:
+* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
+* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241182]
+---
+ .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
+ .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
+ .../graphics/filters/DistantLightSource.h     |  4 ++
+ .../platform/graphics/filters/FELighting.h    |  7 ---
+ .../graphics/filters/PointLightSource.h       |  4 ++
+ .../graphics/filters/SpotLightSource.h        |  4 ++
+ .../software/FELightingSoftwareApplier.h      | 16 ++++++
+ 7 files changed, 56 insertions(+), 35 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+index f6ff8c20a5a8..42a97ffc5372 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
+     return s_FELightingConstantsForNeon;
+ }
+ 
+-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
+ {
+     neonDrawLighting(parameters);
+ }
+@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
+     "b .lightStrengthCalculated" NL
+ ); // NOLINT
+ 
+-int FELighting::getPowerCoefficients(float exponent)
++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
+ {
+     // Calling a powf function from the assembly code would require to save
+     // and reload a lot of NEON registers. Since the base is in range [0..1]
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+index b17c603d40d3..e4629cda0b7c 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+@@ -24,14 +24,15 @@
+  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#ifndef FELightingNEON_h
+-#define FELightingNEON_h
++#pragma once
+ 
+ #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+ 
+-#include "FELighting.h"
++#include "FELightingSoftwareApplier.h"
++#include "ImageBuffer.h"
+ #include "PointLightSource.h"
+ #include "SpotLightSource.h"
++#include <wtf/ObjectIdentifier.h>
+ #include <wtf/ParallelJobs.h>
+ 
+ namespace WebCore {
+@@ -93,14 +94,14 @@ extern "C" {
+ void neonDrawLighting(FELightingPaintingDataForNeon*);
+ }
+ 
+-inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
+ {
+-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
+-    FELightingPaintingDataForNeon neonData = {
++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
++    WebCore::FELightingPaintingDataForNeon neonData = {
+         data.pixels->data(),
+         1,
+-        data.widthDecreasedByOne - 1,
+-        data.heightDecreasedByOne - 1,
++        data.width - 2,
++        data.height - 2,
+         0,
+         0,
+         0,
+@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+     // Set light source arguments.
+     floatArguments.constOne = 1;
+ 
+-    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
++    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
+ 
+     floatArguments.colorRed = color.red;
+     floatArguments.colorGreen = color.green;
+     floatArguments.colorBlue = color.blue;
+     floatArguments.padding4 = 0;
+ 
+-    if (m_lightSource->type() == LS_POINT) {
++    if (data.lightSource->type() == LS_POINT) {
+         neonData.flags |= FLAG_POINT_LIGHT;
+-        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
++        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
+         floatArguments.lightX = pointLightSource.position().x();
+         floatArguments.lightY = pointLightSource.position().y();
+         floatArguments.lightZ = pointLightSource.position().z();
+         floatArguments.padding2 = 0;
+-    } else if (m_lightSource->type() == LS_SPOT) {
++    } else if (data.lightSource->type() == LS_SPOT) {
+         neonData.flags |= FLAG_SPOT_LIGHT;
+-        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
++        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
+         floatArguments.lightX = spotLightSource.position().x();
+         floatArguments.lightY = spotLightSource.position().y();
+         floatArguments.lightZ = spotLightSource.position().z();
+@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+         if (spotLightSource.specularExponent() == 1)
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+-        ASSERT(m_lightSource->type() == LS_DISTANT);
++        ASSERT(data.lightSource->type() == LS_DISTANT);
+         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
+         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
+         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
+@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+     // Set lighting arguments.
+     floatArguments.surfaceScale = data.surfaceScale;
+     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
+-    if (m_lightingType == FELighting::DiffuseLighting)
+-        floatArguments.diffuseConstant = m_diffuseConstant;
++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
++        floatArguments.diffuseConstant = data.diffuseConstant;
+     else {
+         neonData.flags |= FLAG_SPECULAR_LIGHT;
+-        floatArguments.diffuseConstant = m_specularConstant;
+-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
+-        if (m_specularExponent == 1)
++        floatArguments.diffuseConstant = data.specularConstant;
++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
++        if (data.specularExponent == 1)
+             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
+     }
+     if (floatArguments.diffuseConstant == 1)
+         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
+ 
+-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
+     if (optimalThreadNumber > 1) {
+         // Initialize parallel jobs
+-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
+ 
+         // Fill the parameter array
+         int job = parallelJobs.numberOfJobs();
+         if (job > 1) {
+             int yStart = 1;
+-            int yStep = (data.heightDecreasedByOne - 1) / job;
++            int yStep = (data.height - 2) / job;
+             for (--job; job >= 0; --job) {
+                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
+                 params = neonData;
+                 params.yStart = yStart;
+-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
++                params.pixels += (yStart - 1) * data.width * 4;
+                 if (job > 0) {
+                     params.absoluteHeight = yStep;
+                     yStart += yStep;
+                 } else
+-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
++                    params.absoluteHeight = (data.height - 1) - yStart;
+             }
+             parallelJobs.execute();
+             return;
+@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
+ } // namespace WebCore
+ 
+ #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
+-
+-#endif // FELightingNEON_h
+diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+index 0660143fc1cf..2b1e86d99fa4 100644
+--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+@@ -25,6 +25,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class DistantLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
+index 0c073bc13f8c..e0db00545c17 100644
+--- a/Source/WebCore/platform/graphics/filters/FELighting.h
++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
+@@ -35,8 +35,6 @@
+ 
+ namespace WebCore {
+ 
+-struct FELightingPaintingDataForNeon;
+-
+ class FELighting : public FilterEffect {
+ public:
+     const Color& lightingColor() const { return m_lightingColor; }
+@@ -67,11 +65,6 @@ protected:
+ 
+     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
+ 
+-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+-    static int getPowerCoefficients(float exponent);
+-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
+-#endif
+-
+     Color m_lightingColor;
+     float m_surfaceScale;
+     float m_diffuseConstant;
+diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+index 5c9c7fb783e6..e53aa012ac1c 100644
+--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class PointLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+index 04e331ec4ec0..763c8d400b00 100644
+--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class SpotLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+index 3875b0a4b5de..6d3864aafb9a 100644
+--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+@@ -36,6 +36,7 @@
+ namespace WebCore {
+ 
+ class FELighting;
++struct FELightingPaintingDataForNeon;
+ 
+ class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
+     WTF_MAKE_FAST_ALLOCATED;
+@@ -132,8 +133,23 @@ private:
+ 
+     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
+     static void applyPlatformGenericWorker(ApplyParameters*);
++
++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
++    static int getPowerCoefficients(float exponent);
++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
++    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
++
++    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
++    {
++        applyPlatformNeon(data, paintingData);
++    }
++#else
+     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
++#endif
++
+     static void applyPlatform(const LightingData&);
+ };
+ 
+ } // namespace WebCore
++
++#include "FELightingNEON.h"
+-- 
+2.37.3
+
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 6881deb8fc..9c8beecf2e 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.36.7.tar.xz.sums
-md5  a9f8d521d8171292aab842d3e8ba227e  wpewebkit-2.36.7.tar.xz
-sha1  e9255b3592bbaac8b20af03cafa31cedfb0b4898  wpewebkit-2.36.7.tar.xz
-sha256  f3747d72ffc562ad0cfb6218fdf6d897c78c4bdbf5618e0fa26906fba52b95c9  wpewebkit-2.36.7.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.8.tar.xz.sums
+md5  939dc646bb6652fde9a5b6512c17fc58  wpewebkit-2.36.8.tar.xz
+sha1  f45936c578f7dcfbb6064e87da6c098efe093e68  wpewebkit-2.36.8.tar.xz
+sha256  8d42a349c910b2d0961b8d34fecef29cec3d21e3af5977346c90026692dc75eb  wpewebkit-2.36.8.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index b9758083b7..0ff8204519 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.7
+WPEWEBKIT_VERSION = 2.36.8
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
