Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E962BC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 13:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A21A406EC;
	Sat, 17 May 2025 13:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UKFopM39ydK; Sat, 17 May 2025 13:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2A240683
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2A240683;
	Sat, 17 May 2025 13:51:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46ED8D89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3821E40581
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0ZkkjkNM-JN for <buildroot@buildroot.org>;
 Sat, 17 May 2025 13:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880C1404CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 880C1404CD
 for <buildroot@buildroot.org>; Sat, 17 May 2025 13:51:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76DAF86F3A; Sat, 17 May 2025 13:51:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 15:48:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73ff421159c542cc627a002e570812d531e6489a
X-Git-Newrev: 600e75b606e61d5456257cb5368ca312df70046f
X-Patchwork-Hint: ignore
Message-Id: <20250517135150.76DAF86F3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: remove depends on
 architecture for Iris/Vulkan
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

commit: https://git.buildroot.net/buildroot/commit/?id=600e75b606e61d5456257cb5368ca312df70046f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This dependency systematically applied with integrated GPUs but no longer
with discrete GPUs, so remove it.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
[Julien: fix conflicts after mesa3d bump in commit 317260f]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ef2c2c3258..a059fe6749 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -129,7 +129,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_OPENCL
@@ -322,7 +321,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
@@ -331,7 +329,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
 comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
