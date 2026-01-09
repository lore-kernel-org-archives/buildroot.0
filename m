Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E4ED2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2AE60D5F;
	Tue, 13 Jan 2026 19:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY3EBDGOUZrF; Tue, 13 Jan 2026 19:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11DC60BFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333017;
	bh=aZYxIbcTuvwXcZHCAhTUB+5pDoGDqFKLpKpjdomUzDU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZJ53t8w7l6z3ULiHxJohJQQzSlkSA6FlgPDrmGdBpVUZLr0e86pkdcQ9h4FwtRmKH
	 PcMOxsE2RKFZPTmHFmF12kBG9wCMTiq1XSp7t728FIhrRblYLkZfnbfAWCEAInmH3p
	 AeUH/evITkpLVJXy5fl0cfdvGITavbzLKdP+A3Px3/Ga3ouOPAJ28avIcIBL35OG/9
	 YMH1oIXX9bQfG8wWkYb54dd55mWxy9DpFLYn8uq7d1TRQWThw+mXzwT8lBX9wpO3oX
	 vj27Zj8wxjWlTXBD82iCkgWULbrMUr5IS4AmMa7ANBrOwbeGpIoEY+AcfykgUsioAe
	 a9gYQaRIaXK4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11DC60BFB;
	Tue, 13 Jan 2026 19:36:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 089FE2CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE2382BF5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyZHxmc-XdOi for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A2B082BE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A2B082BE5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 883168123D; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:21:48 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f777594d19f696f8e5361afde1fc34a4114b1e3b
X-Git-Newrev: 9a4ef6c282363bc9d349b177596e2b064223f30d
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.883168123D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rpi-firmware:
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
Content-Type: multipart/mixed; boundary="===============1508057193089420249=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1508057193089420249==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9a4ef6c282363bc9d349b177596e2b064223f30d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 598cd9c0ef..9416e9d114 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.02.10"
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
+	bool "rpi-firmware vcdbg option removed"
+	select BR2_LEGACY
+	help
+	  rpi-firmware upstream has dropped the vcdbg tool
+
 config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	bool "opencv3 ffmpeg support removed"
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
index 8350d395da..0debb89091 100644
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

--===============1508057193089420249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1508057193089420249==--
