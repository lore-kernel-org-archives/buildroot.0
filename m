Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DA4C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9E0813AB;
	Sat, 13 Jul 2024 21:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3l4rWF5pnrtO; Sat, 13 Jul 2024 21:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85AF5813AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AF5813AD;
	Sat, 13 Jul 2024 21:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9BF11BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9489881307
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SC8_m6FvDO7 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A876981120
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A876981120
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:05:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93B1E8668F; Sat, 13 Jul 2024 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 23:03:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36c7b1f08607c92186b849bd395fb2529942a6f9
X-Git-Newrev: f30da3dc2181f157c25b742e6785b4b79f5deedf
X-Patchwork-Hint: ignore
Message-Id: <20240713210503.93B1E8668F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/x11r7/xlib_libxshmfence:
 disable on riscv32"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f30da3dc2181f157c25b742e6785b4b79f5deedf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts (partial) commit
e39ad96136a8c340b3aea6b036024e28f14584f3, and
26642e4cc09666110d5105e7867579a0e48cfa09, but also fixed additional
sites where the !BR2_RISCV_32 dependency is no longer needed, thanks
to the recently added
0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch in
xlib_libxshmfence.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in                    | 6 +++---
 package/weston/Config.in                    | 2 --
 package/wlroots/Config.in                   | 2 --
 package/x11r7/xlib_libxshmfence/Config.in   | 3 ---
 package/x11r7/xserver_xorg-server/Config.in | 3 +--
 package/x11r7/xwayland/Config.in            | 2 --
 6 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b88f21935e..7761b0a650 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -99,7 +99,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
-	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	help
@@ -135,7 +135,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
-	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Utgard GPUs.
@@ -151,7 +151,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
-	depends on (BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32) || !BR2_PACKAGE_XORG7 # libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 8af2d19173..d55c456425 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -128,7 +128,6 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	depends on BR2_USE_MMU # xwayland
 	depends on !BR2_STATIC_LIBS # xwayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
-	depends on !BR2_RISCV_32 # xwayland -> xlib_libxshmfence
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
@@ -142,7 +141,6 @@ comment "XWayland support needs libepoxy and X.org enabled"
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 67c1b53969..d81506c375 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -48,7 +48,6 @@ config BR2_PACKAGE_WLROOTS_XWAYLAND
 	depends on BR2_USE_MMU # xwayland
 	depends on !BR2_STATIC_LIBS # xwayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
-	depends on !BR2_RISCV_32 # xwayland -> xlib_libxshmfence
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL_WM
@@ -61,7 +60,6 @@ comment "XWayland support needs X.org enabled"
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
index 7823bda7c0..710476b357 100644
--- a/package/x11r7/xlib_libxshmfence/Config.in
+++ b/package/x11r7/xlib_libxshmfence/Config.in
@@ -1,8 +1,5 @@
 config BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	bool "libxshmfence"
-	# Due to use of SYS_futex - can be enabled again when upstream
-	# adds SYS_futex64 as an alternative
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index b933bd0285..89410f22bb 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -49,8 +49,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBPCIACCESS
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
-		(BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_RISCV_32)
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 9ac1928f51..311dae25ec 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_XWAYLAND
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
-	depends on !BR2_RISCV_32 # xlib_libxshmfence
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
@@ -27,6 +26,5 @@ config BR2_PACKAGE_XWAYLAND
 
 comment "xwayland needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
