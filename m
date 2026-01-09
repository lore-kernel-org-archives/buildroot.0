Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA44D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7143E83FFB;
	Tue, 13 Jan 2026 19:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Xh4CsT4JWbP; Tue, 13 Jan 2026 19:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F2983FBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333311;
	bh=8APosYaHJT7XiJOf3RD1jtNxA96J66NFld+cMLVcW1k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eWdmMJq1ucFOJI++ehjtazlY3JaTw1d9ZnzPYk5rYqlYfi6tZiBU6q35YhuxwZg09
	 TtIV1+MAcXL4/vC3bJ3Rr6zidHT9oEfQSHZzNswi2InOU0YfSLEM/azUzO5F+tO/bL
	 tU8FtDub5+2ymm/z+Ik8t+G2x85NgtDI7Wm0MWH8qv+nrdehOJBBXoUwdkqzr6wcFO
	 q6A2wV3E4bypwnZpLmbv4HTHbBuw6lcoSDJc6Ei0oijtwGpvd9fo2mH/fgwzQKs07P
	 3saOGKZPXYxCLTj4nu8yi1FzSyIGLEmCTiAx4NYPJVJNT7NAteRRdnah3voggfJvfH
	 WIXdfMbIOcbrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F2983FBA;
	Tue, 13 Jan 2026 19:41:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0528F231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39009406E4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1MOGZ2jjDV3 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62377406DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62377406DF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 601D786E70; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:22:08 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9ddd7fe42c3a740316b03ecd1dd50e645c7b5763
X-Git-Newrev: 21868726d38ca2cfc17cd0bfcab5b97f032f8d1c
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.601D786E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rpi-firmware:
 drop support for vcdbg
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3403086594887731270=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3403086594887731270==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=21868726d38ca2cfc17cd0bfcab5b97f032f8d1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

This tool has been removed from upstream rpi-firmware, so drop the
corresponding option and logic in rpi-firmware.mk.

The tool has been removed by upstream commit
d1fcc26038186aecc1501a0b749833300afba801 ("opt: Remove builds of
deprectated userland tools").

It is Buildorot commit
28e6953ba84d39a6074aee439a64ef86b109dcf0 ("package/rpi-firmware: bump
version to 5476720") that did a bump to a version of rpi-firmware that
no longer provided vcdbg.

Cc: Köry Maincent <kory.maincent@bootlin.com>
Cc: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f53a1af56b8cedda58038413cbb9e621ab01705a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                     |  6 ++++++
 package/rpi-firmware/Config.in       | 12 ------------
 package/rpi-firmware/rpi-firmware.mk | 20 --------------------
 3 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 85c6a68527..a0cbf6f929 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11.1"
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
+	bool "rpi-firmware vcdbg option removed"
+	select BR2_LEGACY
+	help
+	  rpi-firmware upstream has dropped the vcdbg tool
+
 config BR2_PACKAGE_LIBDNET_PYTHON
 	bool "libdnet python module removed"
 	select BR2_LEGACY
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f99c116ca2..4dda33a713 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -100,16 +100,4 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	  overlays, to support HATs (Hardware Attached on Top, add-on
 	  modules).
 
-config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
-	bool "vcdbg"
-	depends on BR2_arm # prebuilt arm binary, rpi-userland
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
-	help
-	  Install vcdbg, to help debug communication with the GPU.
-
-comment "vcdbg needs a glibc toolchain w/ C++"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
-
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 3318e9a0c1..83d0808990 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -62,26 +62,6 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
-# Install prebuilt libraries if RPI_USERLAND not enabled
-ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
-define RPI_FIRMWARE_INSTALL_TARGET_LIB
-	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libvcos.so \
-		$(TARGET_DIR)/usr/lib/libvcos.so
-	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libdebug_sym.so \
-		$(TARGET_DIR)/usr/lib/libdebug_sym.so
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
-define RPI_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
-		$(TARGET_DIR)/usr/sbin/vcdbg
-	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \
-		$(TARGET_DIR)/usr/lib/libelftoolchain.so
-	$(RPI_FIRMWARE_INSTALL_TARGET_LIB)
-endef
-endif # INSTALL_VCDBG
-
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(RPI_FIRMWARE_INSTALL_BIN)
 	$(RPI_FIRMWARE_INSTALL_CONFIG)

--===============3403086594887731270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3403086594887731270==--
