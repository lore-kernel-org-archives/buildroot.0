Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B95EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA27E4058C;
	Sun,  9 Jan 2022 20:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gl7U_XzycTxb; Sun,  9 Jan 2022 20:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD291405CB;
	Sun,  9 Jan 2022 20:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3A691BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B215C81D11
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quFicNqecwx2 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:25:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABC4E81D0C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:25:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7439582B94; Sun,  9 Jan 2022 20:19:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:25:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5c69dc19fb0f6c7aabadb6700dac527304f54a4
X-Git-Newrev: 69d5165bc44276e580690dad234abe9a4298f3b5
X-Patchwork-Hint: ignore
Message-Id: <20220109201912.7439582B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix gbm config warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=69d5165bc44276e580690dad234abe9a4298f3b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for the following defconfig:

  BR2_x86_64=y
  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
  BR2_TARGET_GENERIC_GETTY_PORT="tty1"
  BR2_PACKAGE_MESA3D=y
  BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL=y
  BR2_PACKAGE_MESA3D_OPENGL_EGL=y
  BR2_PACKAGE_MESA3D_OPENGL_ES=y

this warning:

  WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_GBM
    Depends on [n]: BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y] && (BR2_PACKAGE_MESA3D_DRI_DRIVER [=n] || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER [=n] && BR2_PACKAGE_MESA3D_OPENGL_EGL [=y])
    Selected by [y]:
    - BR2_PACKAGE_MESA3D_OPENGL_EGL [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y]

  WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_GBM
    Depends on [n]: BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y] && (BR2_PACKAGE_MESA3D_DRI_DRIVER [=n] || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER [=n] && BR2_PACKAGE_MESA3D_OPENGL_EGL [=y])
    Selected by [y]:
    - BR2_PACKAGE_MESA3D_OPENGL_EGL [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y]

as BR2_PACKAGE_MESA3D_VULKAN_DRIVER selects BR2_PACKAGE_MESA3D_DRIVER which
enables possible selection of BR2_PACKAGE_MESA3D_OPENGL_EGL selecting
BR2_PACKAGE_MESA3D_GBM.

Selecting EGL with only a vulkan driver selected gives the following configure
failure:

  .../build/mesa3d-20.3.2/meson.build:424:4: ERROR: Problem encountered: EGL requires dri

Note dri means here an dri or gallium driver (see meson.build and look
for with_dri).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: convert if to depends]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7cf5c26227..e41da562dc 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -432,6 +432,7 @@ comment "OpenGL GLX support needs X11"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
