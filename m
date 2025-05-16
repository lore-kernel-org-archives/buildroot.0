Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DC9C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D12261242;
	Fri, 16 May 2025 10:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5oH1wtSZSWh; Fri, 16 May 2025 10:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8FC66124A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8FC66124A;
	Fri, 16 May 2025 10:58:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 027931AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CA4860B6D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BguWf4weCFe7 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D86F60B0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D86F60B0B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DF9E86A44; Fri, 16 May 2025 10:57:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d0e9e07a8d4a5a51594f5f0db89d22ba2a5972e
X-Git-Newrev: 05b20d572c852d88c693c474ea5ca70b38891b9a
X-Patchwork-Hint: ignore
Message-Id: <20250516105758.5DF9E86A44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump
 version to 6.4.11.p3.0
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
Content-Type: multipart/mixed; boundary="===============8983275102484111709=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8983275102484111709==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=05b20d572c852d88c693c474ea5ca70b38891b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with NXP Linux BSP version "lf-6.12.3-1.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v57 July 2024" to "v58 November 2024".
The Vivante.icd file is now in gpu-core/etc/OpenCL/vendors/ and there is
a new directory "vulkan" in gpu-core/etc/. Copy both OpenCL and vulkan
directories to /etc/.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 87ac86ab7a..7b4fcedf4a 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  2242c7cbf1a2b07d40eefe5d1507747e477c54912f179ee0585a5d7965074ce0  imx-gpu-viv-6.4.11.p2.10-aarch32-accdd64.bin
-sha256  8108fd146de6986486f34860227511a5101b31072b99cd78ae38afba8939fd4e  imx-gpu-viv-6.4.11.p2.10-aarch64-accdd64.bin
-sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
-sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  fe8fc231f18047b9547a038e111c08e855760190d0e9848ead22b383d793499d  imx-gpu-viv-6.4.11.p3.0-aarch32-c600d03.bin
+sha256  82e1bb6304d2aac70c72b691239d1bb5f6738cadfa812d07196db2f580c63d29  imx-gpu-viv-6.4.11.p3.0-aarch64-c600d03.bin
+sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
+sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
 sha256  ab20fa3f527fce99087d8d3cd4e2cf4b9cfdfaaa98b3d766a2b5953a981323d3  SCR-imx-gpu-viv.txt
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 857a11b3b9..8744ff1bc9 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_REVISION = accdd64
+IMX_GPU_VIV_REVISION = c600d03
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p2.10-aarch64
+IMX_GPU_VIV_VERSION = 6.4.11.p3.0-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p2.10-aarch32
+IMX_GPU_VIV_VERSION = 6.4.11.p3.0-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION)-$(IMX_GPU_VIV_REVISION).bin
@@ -93,7 +93,7 @@ define IMX_GPU_VIV_INSTALL_TARGET_CMDS
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
 	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
-	$(INSTALL) -D -m 0644 $(@D)/gpu-core/etc/Vivante.icd $(TARGET_DIR)/etc/OpenCL/vendors/Vivante.icd
+	cp -r $(@D)/gpu-core/etc/* $(TARGET_DIR)/etc
 endef
 
 $(eval $(generic-package))

--===============8983275102484111709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8983275102484111709==--
