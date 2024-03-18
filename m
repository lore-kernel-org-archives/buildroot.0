Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28355C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 16:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD926086F;
	Mon, 18 Mar 2024 16:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgGEb3Ai8q91; Mon, 18 Mar 2024 16:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03BAE608B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03BAE608B2;
	Mon, 18 Mar 2024 16:53:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 406371BF377
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CBBB4052F
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QunlPfwoOk-u for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 16:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BAFB40517
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BAFB40517
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 16:53:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2752982C83; Mon, 18 Mar 2024 16:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 17:50:09 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: afb9780ab82504da4546eb21d3e929990ecf6935
X-Git-Newrev: e2c773d8ea9eb163d46660aa3e883a2b2e7dae0b
X-Patchwork-Hint: ignore
Message-Id: <20240318165303.2752982C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/spirv-tools:
 needs gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2c773d8ea9eb163d46660aa3e883a2b2e7dae0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

spirv-tools unconditionally includes filesystem since its addition in
commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c resulting in the
following build failure:

/home/buildroot/autobuild/run/instance-1/output-1/build/spirv-tools-1.3.261.1/tools/objdump/objdump.cpp:15:10: fatal error: filesystem: No such file or directory
 #include <filesystem>
          ^~~~~~~~~~~~

Fixes: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
 - http://autobuild.buildroot.org/results/aaeb0ca8773842768f9311fc804bb7529d9e3bfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b6d96266a174024c5f6f8647cf19617056aef56c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spirv-tools/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index 39fdb80b86..fa9b615c56 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
 	  The SPIR-V Tools project provides an API and commands for
@@ -9,6 +9,6 @@ config BR2_PACKAGE_SPIRV_TOOLS
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
 
-comment "spirv-tools needs a toolchain w/ C++, gcc >= 7"
+comment "spirv-tools needs a toolchain w/ C++, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
