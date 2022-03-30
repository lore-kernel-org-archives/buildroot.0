Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09559C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4CB08489A;
	Wed, 30 Mar 2022 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBZ9XAt7_g1C; Wed, 30 Mar 2022 20:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9CD1847DE;
	Wed, 30 Mar 2022 20:52:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 563581BF42D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 431E040022
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VppotnSOCchZ for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 20:52:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF61640019
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 20:52:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id r7so13041477wmq.2
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rjzf9ZVF0ryUpRVrR7iHwStotqzRHrGrd8H+ewFPLgo=;
 b=aEKbl6vEnZS05qlnAnTHD355vMTK4unoR/mrGoMq+MTFh31xtHamh26oGLx/Udy3tu
 sLVaJxBesDBypsZsYvXtGmKeVqHaJYLLdpd2MfQx0p4mZs9ZxB5cJQOOJJbIA0kkWFSg
 5t//mMggWPZes+JPZbT2gv05sx5MSPot8d5lIZIE30G8fVXbbJiTSNgOEGxwEyHhF6SL
 dzXvADwml3xeswzPFg1FQz5JVCkszJJssMAdMljvzGH6LK3FfIbMMWejkXBJAtmXy/IR
 fWHpat4G+j1DmV+RNNYUWB///X0GF2a7bYcQ0CFRwc311kY6cQYnWR82Dut5dT1fKAgf
 LAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rjzf9ZVF0ryUpRVrR7iHwStotqzRHrGrd8H+ewFPLgo=;
 b=shYOwNBrQf1blaYA48LUT3k1flB6RHV6hvlmp4h9UeGdah/LtlfFt4ib1F46KjmuCM
 O9wkad4RFQhB3ftS82OeHdxmioKl89yl68L2fS5lOKiJpM8K8jS8A2u/HDFtbiamQDpo
 INFDRMLJBMU0NIHruwvimSQEOvxPrSPAZ3L53q4oN0tKFEl5hKHjN1NJ0Iwq0BsSIwAD
 7/HMakx7P7LX3VHX8Ws5T3SFPOg92lPaja6zuKc7/B3TeRu0m0EwwVFEpEW+j7Fn+x9y
 OxTWIudu4Ou51Xvk2ACPo8bROHz2yLfo7FLTGqFmFZjWwW1cn1Wh7QOFZ+HV9AQSZvq5
 zKnA==
X-Gm-Message-State: AOAM530GBpW11OAVhroRKJp9E5EnaYlpHgy+M2xvmu2xOQq203dSdFku
 GXR8At399VcgPajzX0VOndXSaW0CoNA=
X-Google-Smtp-Source: ABdhPJxhwiFOgV/YXfev5iCL0P9I8rEahtEPIzcO3pR0qp6c4vCPq4c6DPYI982rDQKTvt/BZBya+A==
X-Received: by 2002:a05:600c:a08:b0:38c:c789:dfdf with SMTP id
 z8-20020a05600c0a0800b0038cc789dfdfmr1368127wmp.7.1648673560688; 
 Wed, 30 Mar 2022 13:52:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0038cb8b38f9fsm5701453wmq.21.2022.03.30.13.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:52:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 22:51:12 +0200
Message-Id: <20220330205112.1378968-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: fix uclibc-ng build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with uclibc-ng and grpc raised on arm
and ppc:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_random_internal_randen_hwaes.so.2111.0.0: undefined reference to `getauxval'

Strangely enough it seems there is only one autobuilder failure despite
the fact that libabseil-cpp is unconditionally using getauxval since its
addition in commit 93568440eda120b12bcbfe267af8f0182484c3b6:
https://github.com/abseil/abseil-cpp/blob/20200225/absl/random/internal/randen_detect.cc

Perhaps this build failure is an unexpected side effect of commit
8251d8c2559b25f11684776fc343059cf100657d

Fixes:
 - http://autobuild.buildroot.org/results/775f3ca3dedebff29e212b29dfa896b7613b7a02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-build-with-uclibc-ng.patch       | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch

diff --git a/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch b/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
new file mode 100644
index 0000000000..0797d8e51b
--- /dev/null
+++ b/package/libabseil-cpp/0002-fix-build-with-uclibc-ng.patch
@@ -0,0 +1,62 @@
+From b9ad9bbfed92199a1a58504306d026cd2597539e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 30 Mar 2022 21:56:20 +0200
+Subject: [PATCH] Fix build with uclibc-ng (#1145)
+
+uclibc-ng doesn't provide getauxval which results in the following build
+failure on arm or ppc with any user of abseil-cpp such as grpc:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_random_internal_randen_hwaes.so.2111.0.0: undefined reference to `getauxval'
+
+To fix this build failure, check that __UCLIBC__ is not defined before
+using getauxval (as Babel is not able to check function availability)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/775f3ca3dedebff29e212b29dfa896b7613b7a02
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/abseil/abseil-cpp/commit/b9ad9bbfed92199a1a58504306d026cd2597539e]
+---
+ absl/debugging/internal/vdso_support.cc | 2 +-
+ absl/random/internal/randen_detect.cc   | 7 ++++++-
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/absl/debugging/internal/vdso_support.cc b/absl/debugging/internal/vdso_support.cc
+index c655cf452..e63ac4a3b 100644
+--- a/absl/debugging/internal/vdso_support.cc
++++ b/absl/debugging/internal/vdso_support.cc
+@@ -33,7 +33,7 @@
+ #endif
+ #include <unistd.h>
+ 
+-#if defined(__GLIBC__) && \
++#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
+     (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
+ #define ABSL_HAVE_GETAUXVAL
+ #endif
+diff --git a/absl/random/internal/randen_detect.cc b/absl/random/internal/randen_detect.cc
+index 9bb58fc68..6dababa35 100644
+--- a/absl/random/internal/randen_detect.cc
++++ b/absl/random/internal/randen_detect.cc
+@@ -24,6 +24,11 @@
+ 
+ #include "absl/random/internal/platform.h"
+ 
++#if !defined(__UCLIBC__) && defined(__GLIBC__) && \
++    (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
++#define ABSL_HAVE_GETAUXVAL
++#endif
++
+ #if defined(ABSL_ARCH_X86_64)
+ #define ABSL_INTERNAL_USE_X86_CPUID
+ #elif defined(ABSL_ARCH_PPC) || defined(ABSL_ARCH_ARM) || \
+@@ -31,7 +36,7 @@
+ #if defined(__ANDROID__)
+ #define ABSL_INTERNAL_USE_ANDROID_GETAUXVAL
+ #define ABSL_INTERNAL_USE_GETAUXVAL
+-#elif defined(__linux__)
++#elif defined(__linux__) && defined(ABSL_HAVE_GETAUXVAL)
+ #define ABSL_INTERNAL_USE_LINUX_GETAUXVAL
+ #define ABSL_INTERNAL_USE_GETAUXVAL
+ #endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
