Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738A0C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 07:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D65B0810DB;
	Sun, 11 Aug 2024 07:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtbh_M9WOMNu; Sun, 11 Aug 2024 07:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D92DF81127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D92DF81127;
	Sun, 11 Aug 2024 07:33:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5F751BF870
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 07:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A734440562
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 07:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSPWW0kA6fSm for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 07:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E8464027D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E8464027D
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 07:33:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19C8B84BDD; Sun, 11 Aug 2024 07:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Aug 2024 09:32:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1c98218005276dd2607526495f9ed9446384af4f
X-Git-Newrev: d644ce0f94ee758d3eb8f64a1a0681342bffff22
X-Patchwork-Hint: ignore
Message-Id: <20240811073307.19C8B84BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/sunxi-tools:
 sunxi-fel needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=d644ce0f94ee758d3eb8f64a1a0681342bffff22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure raised since bump to version
1.4.2-168-ged3039c in commit 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb:

/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: attempted static link of dynamic object `libfdt/libfdt-1.6.1.so'

Fixes:
 - http://autobuild.buildroot.org/results/6788d86c10d551b3d617e33c85083b817eb5d0b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit e167800979b48a449c168c229448e7069d2045e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index 14f7da5bf2..16550f4e55 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_BOOTINFO
 
 config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	bool "sunxi-fel"
+	depends on !BR2_STATIC_LIBS # dtc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_DTC
@@ -33,8 +34,8 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	  fel mode. This allows do download code to memory and execute
 	  it.
 
-comment "sunxi-fel needs a toolchain w/ threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+comment "sunxi-fel needs a toolchain w/ dynamic library, threads, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_SUNXI_TOOLS_NAND_PART
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
