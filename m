Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D51AC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB2A827DE;
	Thu, 12 Jun 2025 08:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuBC94bS8z3f; Thu, 12 Jun 2025 08:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8606A82983
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8606A82983;
	Thu, 12 Jun 2025 08:39:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90C271E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DB54405A6
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SotK3gf8FGYp for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76681405A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76681405A7
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 738A98106F; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 May 2025 16:15:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 737aa40a1c7e98a88fdad0d36b7ab47a4819be1a
X-Git-Newrev: 395568599c2922fc2b7bfb62a66e81db6767db38
X-Patchwork-Hint: ignore
Message-Id: <20250612083829.738A98106F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-{headers,
 tools}: bump to version 1.4.313.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=395568599c2922fc2b7bfb62a66e81db6767db38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update SPIR-V headers and SPIR-V tools to version 1.4.313.0 from the
Vulkan SDK.

This versions are required for compatibility with updated
spirv-llvm-translator (v20.1.2).
The source archive now follows the vulkan-sdk- prefix convention.

release:
https://github.com/KhronosGroup/SPIRV-Headers/releases/tag/vulkan-sdk-1.4.313.0
https://github.com/KhronosGroup/SPIRV-Tools/releases/tag/vulkan-sdk-1.4.313.0

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd:
 bumped to 1.4.313.0
 Updated license hash of spirv-headers due to upstream commits:
 https://github.com/KhronosGroup/SPIRV-Headers/commit/1c9115b562bab79ee2160fbd845f41b815b9f21f
 https://github.com/KhronosGroup/SPIRV-Headers/commit/23d4a398c2ccca05fc623cca8785ce7741c5345d]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-headers/spirv-headers.hash | 4 ++--
 package/spirv-headers/spirv-headers.mk   | 4 ++--
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 136f3df733..6e3cc33d6b 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32b4c6ae6a2fa9b56c2c17233c8056da47e331f76e117729925825ea3e77a739  spirv-headers-1.3.261.1.tar.gz
-sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
+sha256  f68be549d74afb61600a1e3a7d1da1e6b7437758c8e77d664909f88f302c5ac1  spirv-headers-1.4.313.0.tar.gz
+sha256  ff04ae7e6a468587fe59434fee2e67c0e2a749b592c794b764ff80f30b94a084  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 9f84c42b2d..675cef9f16 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.3.261.1
-SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
+SPIRV_HEADERS_VERSION = 1.4.313.0
+SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
 
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index 65cb9c619b..de118b378e 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ead95c626ad482882a141d1aa0ce47b9453871f72c42c0b28d39c82f60a52008  spirv-tools-1.3.261.1.tar.gz
+sha256  6b60f723345ceed5291cceebbcfacf7fea9361a69332261fa08ae57e2a562005  spirv-tools-1.4.313.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index 51b1c9f22a..1aa0cc6199 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.3.261.1
-SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
+SPIRV_TOOLS_VERSION = 1.4.313.0
+SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
 SPIRV_TOOLS_DEPENDENCIES = spirv-headers
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
