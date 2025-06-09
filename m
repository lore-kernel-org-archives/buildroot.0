Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC9AC5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 20:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED5782158;
	Mon,  9 Jun 2025 20:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qe0P8gR6Axs; Mon,  9 Jun 2025 20:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A5C82151
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A5C82151;
	Mon,  9 Jun 2025 20:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D365232
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A11D614F8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnTO6iQTfmTw for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 20:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F208614FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F208614FE
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:00:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A71887B35; Mon,  9 Jun 2025 20:00:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 19:29:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b55e05f858b9c95ef41704a1285331aad2201227
X-Git-Newrev: 053b0c9f66d89c9290fbef689fb049289952506c
X-Patchwork-Hint: ignore
Message-Id: <20250609200016.8A71887B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-embeddedsw: remove
 support for xilinx vendor name
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

commit: https://git.buildroot.net/buildroot/commit/?id=053b0c9f66d89c9290fbef689fb049289952506c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch removes the support for the microblazeel-xilinx-elf arch tuple.
Users will now get an error message telling them to change their configuration
to the microblazeel-buildroot-elf arch tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-embeddedsw/Config.in            | 1 -
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 31b12baaf2..98d39331fe 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,6 +1,5 @@
 comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
 	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
-	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
 
 menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
index 03acb153d1..abcfee255d 100644
--- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -20,7 +20,7 @@ XILINX_EMBEDDEDSW_MICROBLAZE_AR = $(XILINX_EMBEDDEDSW_MICROBLAZE_CC)-ar
 
 ifeq ($(basename $(notdir $(XILINX_EMBEDDEDSW_MICROBLAZE_CC))),microblazeel-xilinx-elf-gcc)
 $(warning microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
-$(warning Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)
+$(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)
 endif
 
 # ZYNQMP_PMUFW application allows users to add cflags
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
