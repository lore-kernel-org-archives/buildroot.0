Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B38EC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D15283BCB;
	Thu,  7 Sep 2023 15:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D15283BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qs_nVvPO7Acw; Thu,  7 Sep 2023 15:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540F183C8A;
	Thu,  7 Sep 2023 15:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 540F183C8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41B3E1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2A7041D98
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A7041D98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UG3y52aY0VYJ for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 813E841DA5
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 813E841DA5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CA3F86A1E; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 11:53:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a77db2f34c06ef6b20e301b476339103488326a8
X-Git-Newrev: 2389c76a95725b91ba538b56fb7da70877c7d3ad
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.7CA3F86A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-boot-firmware: new package
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
Content-Type: multipart/mixed; boundary="===============1408553626706820835=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1408553626706820835==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2389c76a95725b91ba538b56fb7da70877c7d3ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is extracted from a patch from Xuanhao Shi, Anand Gadiyar and
Andreas Dannenberg submitted at
https://patchwork.ozlabs.org/project/buildroot/patch/20230616002359.4139814-3-dannenberg@ti.com/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                        |  2 ++
 boot/Config.in                                    |  1 +
 boot/ti-k3-boot-firmware/Config.in                |  7 +++++++
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash |  3 +++
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index abd633f840..3b60189c77 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -132,6 +132,7 @@ F:	package/libxmlrpc/
 F:	package/python-docopt/
 
 N:	Anand Gadiyar <gadiyar@ti.com>
+F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-r5-loader/
 
 N:	André Zwing <nerv@dawncrow.de>
@@ -3114,6 +3115,7 @@ N:	Wojciech Niziński <niziak@spox.org>
 F:	package/fwup/
 
 N:	Xuanhao Shi <X15000177@gmail.com>
+F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-r5-loader/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
diff --git a/boot/Config.in b/boot/Config.in
index 9d7f5c4cb9..87e1b7c00e 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,6 +19,7 @@ source "boot/opensbi/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
new file mode 100644
index 0000000000..d80bb4bdb3
--- /dev/null
+++ b/boot/ti-k3-boot-firmware/Config.in
@@ -0,0 +1,7 @@
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE
+	bool "ti-k3-boot-firmware"
+	depends on BR2_aarch64
+	help
+	  This package downloads and installs the TI-specific ti-sysfw
+	  and ti-dm firmware needed to boot TI K3 platforms (which
+	  include AM62x, AM64x, AM65x and more).
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
new file mode 100644
index 0000000000..95131180ef
--- /dev/null
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
+sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
new file mode 100644
index 0000000000..1f8ade207c
--- /dev/null
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ti-k3-boot-firmware
+#
+################################################################################
+
+# The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
+# Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
+TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
+TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
+TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
+TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
+TI_K3_BOOT_FIRMWARE_LICENSE = TI Proprietary
+TI_K3_BOOT_FIRMWARE_LICENSE_FILES = LICENSE.ti
+
+define TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES_CMDS
+	cp -dpfr $(@D)/ti-sysfw $(BINARIES_DIR)/
+	cp -dpfr $(@D)/ti-dm $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))

--===============1408553626706820835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1408553626706820835==--
