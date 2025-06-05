Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E2C5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 20:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB59482F77;
	Thu,  5 Jun 2025 20:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhP3AlDVd346; Thu,  5 Jun 2025 20:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E91820F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E91820F1;
	Thu,  5 Jun 2025 20:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D931A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9840D61020
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BEptQ4oJDVP for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 20:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2BCA6141F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2BCA6141F
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 20:04:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91423879A4; Thu,  5 Jun 2025 20:04:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 5 Jun 2025 21:55:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1539e932b659d7a16ab02551ebfdc01aefcebcc1
X-Git-Newrev: e893a70e12361c57d53c1c7edd41ffb085553fd2
X-Patchwork-Hint: ignore
Message-Id: <20250605200430.91423879A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: vulkan intel needs llvm
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

commit: https://git.buildroot.net/buildroot/commit/?id=e893a70e12361c57d53c1c7edd41ffb085553fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since mesa3d was bumped to 25.0.6 with buildroot commit 317260f336 the
Intel Vulkan driver also needs llvm.

Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
https://lists.buildroot.org/pipermail/buildroot/2025-May/780130.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 10 +++++++++-
 package/mesa3d/mesa3d.mk |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9454beedf4..98c77125e1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -51,7 +51,8 @@ config BR2_PACKAGE_MESA3D_OPENCL
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
+		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
@@ -324,10 +325,17 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_OPENCL
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
+	select BR2_PACKAGE_SPIRV_TOOLS
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
+comment "intel vulkan needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 84d1aae6ef..bc456a43a3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -133,6 +133,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += host-python-ply
+MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
+MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
