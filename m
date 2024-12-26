Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A76C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC7DF847C8;
	Fri, 28 Feb 2025 16:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quTttl7pCgqF; Fri, 28 Feb 2025 16:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BC684814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BC684814;
	Fri, 28 Feb 2025 16:43:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2188B68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12BCA419F5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84hz4K4KR8an for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F0042525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57F0042525
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50B057FD48; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 00:04:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 83b783c29e4b2eed8ad8e6bd63ceda0571db73cb
X-Git-Newrev: f78d8b50fea526a9cadd8480cb058536202cb4bc
X-Patchwork-Hint: ignore
Message-Id: <20250228162946.50B057FD48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cmake: bump to version
 3.31.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f78d8b50fea526a9cadd8480cb058536202cb4bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
