Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E48ACD98F2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 22:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB73406ED;
	Mon, 22 Jun 2026 22:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vp0Ll1ZFSFcV; Mon, 22 Jun 2026 22:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4188C406F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782165769;
	bh=rFlCVZdzjbrYLk7uAYWV76Z8DZjMSw2nSufYIN5o5Mc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G9ufs6MUViH96rPoCVGtEMv7ClEg1LZ12+PSRlZT/4YARcekUPTwnVkuJgXqNNPH3
	 8KLZzxulVyx3mFWTDOi5+DC41rfSDTrQ6vaSRtri3OjevnCKTwS2+7WdyR4xgUvV+E
	 KeqqOLAvat7aRGIxzYcHDUsKoYAsDCyWuXW0tJ87JeW+m3vuNNM67XOPB+W38cQ7si
	 pqMEmOFUfOV6ts4o+qxdOAGVddTG9C5E6xrCssAPTLNEJSqhOhXjJ8RUTBSBEfAf3E
	 XTE7LuQlCWtZDmV2CfcW4l6m9nhdVbuIVzN+BQ4G6ftfBjploh4B+Ole2jyT46St1p
	 p1GBfmc+hRiXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4188C406F5;
	Mon, 22 Jun 2026 22:02:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 023DD770
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE7C400CB
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eaXN9fNyaTN for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 22:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 139C0400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 139C0400C7
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C200A84020; Mon, 22 Jun 2026 22:02:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 23:51:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da9dcddff15af3e99cbc20297f4a3d25e89c66e1
X-Git-Newrev: 46886b51c29b1c1108c85087cba4dbf22c6fa79d
X-Patchwork-Hint: ignore
Message-Id: <20260622220221.C200A84020@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: restrict Gallium VA-API
 support to supported drivers
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46886b51c29b1c1108c85087cba4dbf22c6fa79d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This patch fixes a build error introduced by buildroot commit
460700d38e1bb9ddb83bf8de81d69a2448099165 which took not into account
that only certain drivers support Gallium VA-API:

../output-1/build/mesa3d-26.1.2/meson.build:742:3: ERROR: Feature
 gallium-va cannot be enabled: VA state tracker requires at least one
 of the following gallium drivers: r600, radeonsi, nouveau, d3d12
 (with option gallium-d3d12-video), virgl.

Fixes:
https://autobuild.buildroot.net/results/16b/16b2a63b444d7f84ceab5134ce9ff63e910537a7/

which includes configure option -Dgallium-drivers=etnaviv,r300.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e4a444efbb..e184039150 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -197,6 +197,7 @@ comment "llvmpipe driver needs llvm"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
@@ -236,6 +237,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 		(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
 			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
@@ -254,6 +256,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
@@ -325,6 +328,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	bool "Gallium virgl driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  virgl is the 3D acceleration backend for the virtio-gpu
@@ -507,17 +511,20 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
+config BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
+	bool
+
 config BR2_PACKAGE_MESA3D_GALLIUM_VA
 	bool "Gallium VA-API"
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	# circular dependency: mesa3d -> libva -> libgl -> mesa3d
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_GLX || BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable VA-API video acceleration support in Gallium drivers.
 
-comment "Gallium VA-API needs a gallium driver, incompatible with GLX w/o libglvnd"
-	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER || \
+comment "Gallium VA-API needs a supported gallium driver, incompatible with GLX w/o libglvnd"
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER || \
 		(BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND)
 
 config BR2_PACKAGE_MESA3D_PATENTED_VIDEO_CODECS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
