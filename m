Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CFDC7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1740C4070F;
	Sat, 25 Feb 2023 09:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1740C4070F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPges4_a-_xO; Sat, 25 Feb 2023 09:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D37B40B71;
	Sat, 25 Feb 2023 09:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D37B40B71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14D3B1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E350E416BC
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E350E416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjOOTjRieJ1H for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:50:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2D8C4168C
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D8C4168C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFAFA86A88; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:49:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a99d6611f0de6b1844cdbdc81d0ff25949c2b16
X-Git-Newrev: 333580b68037ef756fa637bbfc49f34f1ad5e0ea
X-Patchwork-Hint: ignore
Message-Id: <20230225095001.CFAFA86A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: drop
 BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES
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
Content-Type: multipart/mixed; boundary="===============8776427179058463786=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8776427179058463786==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=333580b68037ef756fa637bbfc49f34f1ad5e0ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Arm and aarch64 packages don't contain examples anymore so drop the
config option to install them to prevent build failure when selected:

>>> imx-gpu-g2d 6.4.3.p4.4-arm Installing to target
mkdir -p /home/sszy/br-test-pkg/bootlin-armv7-glibc/target/usr/share/examples/
cp -a /home/sszy/br-test-pkg/bootlin-armv7-glibc/build/imx-gpu-g2d-6.4.3.p4.4-arm/gpu-demos/opt/* /home/sszy/br-test-pkg/bootlin-armv7-glibc/target/usr/share/examples/
cp: cannot stat '/home/sszy/br-test-pkg/bootlin-armv7-glibc/build/imx-gpu-g2d-6.4.3.p4.4-arm/gpu-demos/opt/*': No such file or directory
make: *** [package/pkg-generic.mk:384: /home/sszy/br-test-pkg/bootlin-armv7-glibc/build/imx-gpu-g2d-6.4.3.p4.4-arm/.stamp_target_installed] Error 1

Fixes: b84557b588b3 ("package/freescale-imx/imx-gpu-g2d: bump version to 6.4.3.p4.4")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                 | 6 ++++++
 package/freescale-imx/imx-gpu-g2d/Config.in      | 9 ---------
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk | 8 --------
 3 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7f69462f2e..af1d8cc1dc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES
+	bool "imx-gpu-g2d examples removed"
+	select BR2_LEGACY
+	help
+	  The examples are not provided by NXP anymore.
+
 config BR2_KERNEL_HEADERS_6_0
 	bool "kernel headers version 6.0.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/freescale-imx/imx-gpu-g2d/Config.in b/package/freescale-imx/imx-gpu-g2d/Config.in
index aeca087f86..c143b17c47 100644
--- a/package/freescale-imx/imx-gpu-g2d/Config.in
+++ b/package/freescale-imx/imx-gpu-g2d/Config.in
@@ -18,12 +18,3 @@ config BR2_PACKAGE_IMX_GPU_G2D
 
 	  This library is provided by NXP as-is and doesn't have an
 	  upstream.
-
-if BR2_PACKAGE_IMX_GPU_G2D
-
-config BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES
-	bool "install examples"
-	help
-	  Copy the Vivante G2D examples to the target.
-
-endif
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index d94da24d8f..42a1fe70cf 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -26,15 +26,7 @@ define IMX_GPU_G2D_INSTALL_STAGING_CMDS
 	cp -a $(@D)/g2d/usr/* $(STAGING_DIR)/usr
 endef
 
-ifeq ($(BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES),y)
-define IMX_GPU_G2D_INSTALL_EXAMPLES
-	mkdir -p $(TARGET_DIR)/usr/share/examples/
-	cp -a $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
-endef
-endif
-
 define IMX_GPU_G2D_INSTALL_TARGET_CMDS
-	$(IMX_GPU_G2D_INSTALL_EXAMPLES)
 	cp -a $(@D)/g2d/usr/lib $(TARGET_DIR)/usr
 endef
 

--===============8776427179058463786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8776427179058463786==--
