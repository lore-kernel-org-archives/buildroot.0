Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DA9C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BB14258B;
	Sat, 28 Oct 2023 20:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BB14258B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bql6A2j01U6j; Sat, 28 Oct 2023 20:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DA44241A;
	Sat, 28 Oct 2023 20:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1DA44241A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 375D91BF25F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F3584187C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F3584187C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtRwAG1gZOF2 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 155B341869
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 155B341869
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00A2685F64; Sat, 28 Oct 2023 20:44:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:41:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecce7bf95a8a5febbbe1d22563a079326bbf1ea4
X-Git-Newrev: 3155bd54ebf705b9e436856f38b0c7d1a584b8ae
X-Patchwork-Hint: ignore
Message-Id: <20231028204443.00A2685F64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-headers: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=3155bd54ebf705b9e436856f38b0c7d1a584b8ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c:

CMake Error at /home/buildroot/autobuild/instance-3/output-1/host/share/cmake-3.27/Modules/CMakeTestCXXCompiler.cmake:60 (message):
  The C++ compiler

    "/usr/bin/c++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/4b94edf6dee03e74ff53939aa228069cc6ba4292

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: propagate to spirv-tools]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/spirv-headers/Config.in | 4 ++++
 package/spirv-tools/Config.in   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/spirv-headers/Config.in b/package/spirv-headers/Config.in
index fd20f301d4..e03a6ca1ee 100644
--- a/package/spirv-headers/Config.in
+++ b/package/spirv-headers/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SPIRV_HEADERS
 	bool "spirv-headers"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Machine-readable files for the SPIR-V Registry
 
 	  https://www.khronos.org/registry/spir-v
+
+comment "spirv-headers needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index e2f46253a9..345b8e7331 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
+	depends on BR2_INSTALL_LIBSTDCPP # spirv-headers
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
 	  The SPIR-V Tools project provides an API and commands for
 	  processing SPIR-V modules.
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
+
+comment "spirv-tools needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
