Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79557E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 21:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B33E4030D;
	Thu, 26 Dec 2024 21:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAH91BFGEfmt; Thu, 26 Dec 2024 21:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB86E40321
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB86E40321;
	Thu, 26 Dec 2024 21:51:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07823F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8FC34030D
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWoScTDcMPFD for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 21:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 606C340321
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 606C340321
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 606C340321
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:51:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7DD5960002;
 Thu, 26 Dec 2024 21:51:17 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2024 22:51:15 +0100
Message-ID: <20241226215116.2530043-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735249877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bGc8GnvBEonIN7agniGftVcCmVcne3qIkhQJjCmxThA=;
 b=kMM5lfcegOj8Dj7EjmB/hhgPd/1a79ZDFnr2IDVisanSGHsH/V+1iTjMDwp9SC7T2Xnhpd
 2025ULyl2CexaG6ah++yjbgh9x+m5xCcjPRxUfkbhPK9/cTXm75S8rad4mqQGeUaWPtqs5
 Qqi4Dx07twCZbX8jC1K23YXbyOKrxE4wwZIEmjfOSkJRKXxiNIuyRap/xYj4dHOq5nbHDC
 o2KOW0vfDsSqZVxKxp+i5nUACThfxfFlGcxQIauSCs3fz0YOU0h763WY9A+RFEMiyRuVQn
 GMUzPQd9kVmlnj1vVPS4XOmjCFsNOtx72Hern64TeAIybXY3sSKz37fUC/MkIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kMM5lfce
Subject: [Buildroot] [PATCH] package/cmake: bump to version 3.31.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to
https://discourse.cmake.org/t/cmake-3-31-3-available-for-download/13245:

Changes made since CMake 3.31.2:

Brad King (16):

    VS: Factor out check for mixed C and C++ target
    VS: Restore support for mixing C++23 and C in one target with clang-cl
    cmLocalUnixMakefileGenerator3: Simplify progress command generation
    Makefile: Fix per-directory codegen target
    Makefile: Enable progress messages for codegen target
    cmGlobalNinjaGenerator: Remove unused local variable
    cmGlobalNinjaGenerator: Remove unnecessary local variable
    cmGlobalNinjaGenerator: Fix local variable name for codegen target
    cmGlobalNinjaGenerator: Clarify order of codegen build statement logic
    cmGlobalNinjaGenerator: Simplify per-directory configuration list lookup
    Ninja: Add missing top-level codegen dependencies on per-directory codegen
    Tests/RunCMake/CXXModules: Rename FileSetModules cases to be more specific
    target_sources: Improve error message for CXX_MODULES on INTERFACE libraries
    Help: Update link to UTF-8 RFC 3629
    ci: update macOS jobs to use Xcode 16.2
    CMake 3.31.3

Craig Scott (1):

    install: Restore treatment of DESTINATION as a single-valued keyword

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 89c2662091..88ffc5412b 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.2-SHA-256.txt
-sha256  42abb3f48f37dbd739cdfeb19d3712db0c5935ed5c2aef6c340f9ae9114238a2  cmake-3.31.2.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.3-SHA-256.txt
+sha256  fac45bc6d410b49b3113ab866074888d6c9e9dc81a141874446eb239ac38cb87  cmake-3.31.3.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1032ec6e39..288039589d 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
