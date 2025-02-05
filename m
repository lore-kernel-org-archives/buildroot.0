Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DA6C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23683405AE;
	Fri, 28 Feb 2025 17:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JAAKIOPnsWb; Fri, 28 Feb 2025 17:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18278504B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18278504B8;
	Fri, 28 Feb 2025 17:14:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 170D768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C5742D1C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKszA7oovjVw for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E8342D2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75E8342D2D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A3CE80584; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 16:13:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1503580dcd8b677d71b79ea834ff2f72cd605186
X-Git-Newrev: ef354264cdb86169f019ca618ab542d3d8fe75cf
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.6A3CE80584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: add option to
 enable VIRTIO vulkan driver
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0920354941304329252=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0920354941304329252==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ef354264cdb86169f019ca618ab542d3d8fe75cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The support for Venus (the Vulkan VirtIO encapsulation) in MESA has
been stable since 23.2 so add an option to enable it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240822181546.64900-6-bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 6 ++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1a446cac49..0412998214 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -336,6 +336,12 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
 	help
 	  Vulkan swrast driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO
+	bool "Vulkan VirtIO driver (Venus)"
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan VirtIO (venus) driver.
+
 comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2a0b3aefe6..202fc5cc74 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -116,6 +116,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \

--===============0920354941304329252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0920354941304329252==--
