Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B76AC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E70526141F;
	Sat, 19 Jul 2025 11:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNfP2kmpjU7R; Sat, 19 Jul 2025 11:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D2F861421
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D2F861421;
	Sat, 19 Jul 2025 11:11:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECEBC222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE78240B03
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwlyXLc-I1JK for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C82A40ACE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C82A40ACE
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:11:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A14486675; Sat, 19 Jul 2025 11:11:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 12:52:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eaeb6fcb94df5a6a7844918a9b77a0e2b458fd3
X-Git-Newrev: 5e818c16a31a902ec29a250f920f43c76e2d9868
X-Patchwork-Hint: ignore
Message-Id: <20250719111157.1A14486675@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add support for
 imagination vulkan driver
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e818c16a31a902ec29a250f920f43c76e2d9868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds the experimental vulkan support for the PowerVR rogue
architecture.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 8 ++++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b5c1d92d68..924437f033 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -359,6 +359,14 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	help
 	  Vulkan broadcom driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
+	bool "Vulkan imagination driver (experimental)"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan imagination driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 998fd25584..716e11044b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -135,6 +135,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination-experimental
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
