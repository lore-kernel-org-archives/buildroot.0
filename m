Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484E7C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B050B40E06;
	Fri, 28 Feb 2025 17:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynlVTwGStxlQ; Fri, 28 Feb 2025 17:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C61C40E1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C61C40E1F;
	Fri, 28 Feb 2025 17:21:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 045FF1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B7AA47141
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vYTQ6xgy9th for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B5946B7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B5946B7B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BD5586143; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 23:22:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 28ae74a1345181be4a913c1a9727991b9b6fdc84
X-Git-Newrev: 02b9d987c4865d4cb6354728c6eac1310e6a619f
X-Patchwork-Hint: ignore
Message-Id: <20250228163043.7BD5586143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 toolchain/toolchain-bare-metal-buildroot: update help text for multiple
 tuple support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02b9d987c4865d4cb6354728c6eac1310e6a619f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that binutils-bare-metal, gcc-bare-metal and newlib-bare-metal packages
have been upgraded to support a list of architecture tuples, this patch
updates the toolchain-bare-metal-buildroot help text to describe the new
capability.

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is still backwards compatible with
its prior definition as defining a single tuple with this new definition
works exactly the same as before.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/Config.in                                          |  2 +-
 toolchain/toolchain-bare-metal-buildroot/Config.in           | 12 +++++++++---
 .../toolchain-bare-metal-buildroot.mk                        |  1 -
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index d6ed25ff96..94723da141 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -941,7 +941,7 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 comment "Bare metal toolchain"
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
-	bool "Build a bare metal toolchain"
+	bool "Build bare metal toolchains"
 	select BR2_PACKAGE_NEWLIB_BARE_METAL
 	help
 	  Select if you need a bare-metal toolchain for building
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 6fe969357f..c86c5d725c 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -1,10 +1,16 @@
 if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 
 config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
-	string "architecture tuple"
+	string "list of architecture tuples"
 	help
-	  This option allows to define the architecture tuple for the
-	  bare-metal toolchain.
+	  This option allows to define the list of architecture
+	  tuples for which bare-metal toolchains will be created.
+	  One toolchain will be built for each of the architecture
+	  tuples specified in this option.
+
+	  For example, to build both a Microblaze and a RISC-V bare
+	  metal toolchain, use the following definition:
+	  "microblazeel-xilinx-elf riscv32-buldroot-elf"
 
 source "package/newlib-bare-metal/Config.in"
 
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
index dbfe30a910..71063fcee4 100644
--- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -6,7 +6,6 @@
 
 TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
 TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
-TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT = $(HOST_DIR)/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/sysroot
 TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
