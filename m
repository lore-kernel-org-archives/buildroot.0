Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43BDEEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7169C80FFA;
	Thu,  1 Jan 2026 22:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2fQuZvna-tM; Thu,  1 Jan 2026 22:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943BE80F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767307155;
	bh=x4FnsjV1BAb2IK8wKUqbxV9AnMSulIiA8DLBgCEolSU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aPSFkokBiZh7C1adQDco8JsVypWqfGU/HMwzzUVveMBSQidyV1CPTxDFYmy8zUO3g
	 Qlb8TVsIGRWXoxIcCaVL5FobHLAIxD0g1idBcDHAmoOR2+C0L0TRu/se4VJ+QyJESw
	 kThCz2e3PiIlTK9qCATOLm+ItrJcf2cYa9tjTtZKnZHGJZDDabEoiw+a0Ck5+kony1
	 CVnD7cFkkjriGpgXdCzbb2nmRWpItUc3oh9IJ7slkLorJ31kKiywbNv44rVNBAPhPE
	 1T/gH7vWaI1L3nOTAjSx3AkDv+mWT43Q5yj/6sB/6d0kQhnqBQGY80+hTCGBIVddks
	 pVChIYqf8505Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 943BE80F17;
	Thu,  1 Jan 2026 22:39:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37BC9206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 352D040387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLNeNztVPEyn for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5569140193
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5569140193
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:39:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F31F87D28; Thu,  1 Jan 2026 22:39:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 23:36:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f615dcb271aef7e7ca56ff83c8f88b78dcc7e906
X-Git-Newrev: b1bfe97aa691a6fafa6dc25d7c78a831c64a139e
X-Patchwork-Hint: ignore
Message-Id: <20260101223914.3F31F87D28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cegui: fix cmake 4 build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1bfe97aa691a6fafa6dc25d7c78a831c64a139e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Renamed current patches to prepare for their removal with the upcoming
version bump that will not touch the CMake fix which is not committed
upstream yet.

Fixes:
https://autobuild.buildroot.net/results/a23/a23e3a81e3526d12206ea0f036f6e8db8dc5eaab/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/0001-Fix-cmake-4-build.patch         | 28 ++++++++++++++++++++++
 ...h => 0002-XMLParser.cpp-include-string.h.patch} |  0
 ...type-of-xmlGetLastError-for-libxml2-2-12.patch} |  0
 3 files changed, 28 insertions(+)

diff --git a/package/cegui/0001-Fix-cmake-4-build.patch b/package/cegui/0001-Fix-cmake-4-build.patch
new file mode 100644
index 0000000000..952b17e494
--- /dev/null
+++ b/package/cegui/0001-Fix-cmake-4-build.patch
@@ -0,0 +1,28 @@
+From 6c0e6d8ffb3c13cd7fb08c8ef217daf45eabdf99 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 2 Dec 2025 20:38:29 +0100
+Subject: [PATCH] Fix cmake 4 build
+
+Upstream: https://github.com/cegui/cegui/pull/1334
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 418931822..645ff6cf7 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ################################################################################
+ # Top-level CMakeLists.txt file for Crazy Eddie's GUI System
+ ################################################################################
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if (APPLE AND NOT CMAKE_OSX_ARCHITECTURES)
+     set( CMAKE_OSX_ARCHITECTURES ${CMAKE_HOST_SYSTEM_PROCESSOR} CACHE STRING "Build architectures for Mac OS X")
+-- 
+2.47.3
+
diff --git a/package/cegui/0001-XMLParser.cpp-include-string.h.patch b/package/cegui/0002-XMLParser.cpp-include-string.h.patch
similarity index 100%
rename from package/cegui/0001-XMLParser.cpp-include-string.h.patch
rename to package/cegui/0002-XMLParser.cpp-include-string.h.patch
diff --git a/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch b/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
similarity index 100%
rename from package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
rename to package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
