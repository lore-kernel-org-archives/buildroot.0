Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4BAC3ABAA
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A32D81E8D;
	Mon,  5 May 2025 20:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I91r_9-ueYvv; Mon,  5 May 2025 20:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7779E81331
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7779E81331;
	Mon,  5 May 2025 20:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA2D420F8
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 999F181331
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-J-JBJPdwjq for <buildroot@buildroot.org>;
 Mon,  5 May 2025 20:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D44D0811D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D44D0811D6
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0179864C8; Mon,  5 May 2025 20:53:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 May 2025 22:20:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50c7542326aed41fc558fc7b4969ea747861f7bb
X-Git-Newrev: a36d5fd2f8283b849d7b0837cefdb2c2ed1dff51
X-Patchwork-Hint: ignore
Message-Id: <20250505205315.C0179864C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xilinx-fpgautil: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a36d5fd2f8283b849d7b0837cefdb2c2ed1dff51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new package to Buildroot called xilinx-fpgautil which builds the
Xilinx fpgautil script which can be used for loading FPGA bitstreams
on zynq, zynqmp and versal products at run-time.  This is a handy
application for loading FPGA bitstreams and their corresponding device
tree overlays.

An explanation of how this script can be used for each type of product
can be found on the wiki pages below.

https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming

In addition, the source code for xilinx-fpgautil can be found here:
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c

The Xilinx fpgautil script can be used hand in hand with the Versal
Segmented Configuration with the following example command for
programming the pld.pdi file to the Versal FPGA:

    fpgautil -b /lib/firmware/xilinx/<design-name>_pld.pdi -o /lib/firmware/xilinx/<dtbo-name>.dtbo

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Luca: build-tested only]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Julien: reflow commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/xilinx-fpgautil/Config.in            |  8 ++++++++
 package/xilinx-fpgautil/xilinx-fpgautil.hash |  3 +++
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 22 ++++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c26ee3f22..5bb81ad149 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2492,6 +2492,7 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/xilinx-fpgautil/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 167965d64b..59ac4ad070 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -461,6 +461,7 @@ menu "Firmware"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
+	source "package/xilinx-fpgautil/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
 	source "package/18xx-ti-utils/Config.in"
diff --git a/package/xilinx-fpgautil/Config.in b/package/xilinx-fpgautil/Config.in
new file mode 100644
index 0000000000..29245c0c5e
--- /dev/null
+++ b/package/xilinx-fpgautil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XILINX_FPGAUTIL
+	bool "xilinx-fpgautil"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Xilinx FPGA Manager Utility for zynq, zynqmp
+	  and versal products.
+
+	  https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
new file mode 100644
index 0000000000..1329b9ad70
--- /dev/null
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  439a3681d8efa9641ab39c7645836b9ac78b2fdb36242f9bc94c1f3dfb2d9c4e  xilinx-fpgautil-xlnx-rel-v2024.2_update3.tar.gz
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
new file mode 100644
index 0000000000..6f42b4799f
--- /dev/null
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# xilinx-fpgautil
+#
+################################################################################
+
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
+XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
+XILINX_FPGAUTIL_LICENSE = MIT
+XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
+
+define XILINX_FPGAUTIL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_LDFLAGS) \
+		$(@D)/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c \
+		-o $(@D)/fpgautil
+endef
+
+define XILINX_FPGAUTIL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/fpgautil $(TARGET_DIR)/usr/bin/fpgautil
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
