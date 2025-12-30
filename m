Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0438EE49B4
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813166080C;
	Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYI3cDh6QnIz; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993EF608DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133589;
	bh=A3d6S0B3oFuY9wVIV3GSSbCng3MuxWZPH2F7WI2XR7Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oXuO4DzWP3S+ldfy6TC2D/OaFhKabL7q5UZOToy1sBGPlwCP6G2vJTEMhqI7IHiXO
	 ZM+PbJM+Oyv/R/tzxPrgp8oG6hkWDolPBKLPwemWImDd0WMnhvw6PekEOZ+16PHT7x
	 2KSub2NbpyFInz8KhY/qdm+LMgY/rrgWE6wb1f7nJ9kH60HPqfgNLdhB0HjYPPIGe5
	 KPcoJ0BP9rg/zu6yXO7y4ebVhJqgQFEXGEou4jd+UNevddll4GirxsE2356vxQ1hjO
	 fC8JbWd3TdjtUicO9He/CDnxLvUHcnk9OLR+eNFtYQ4AoM5kUj+BlCwOlz22Xu/3UL
	 uSUpc/uzv/cew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993EF608DC;
	Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B83177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B1166080C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0lmfKZbnxKS for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C82B60608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C82B60608
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 332F787D46; Tue, 30 Dec 2025 22:26:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f78163431c4ea5a7d8aa083639fc5435d8d64957
X-Git-Newrev: f53a1af56b8cedda58038413cbb9e621ab01705a
X-Patchwork-Hint: ignore
Message-Id: <20251230222625.332F787D46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: drop support for
 vcdbg
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
Content-Type: multipart/mixed; boundary="===============9039115913566911172=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9039115913566911172==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f53a1af56b8cedda58038413cbb9e621ab01705a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Config.in.legacy                     |  6 ++++++
 package/rpi-firmware/Config.in       | 12 ------------
 package/rpi-firmware/rpi-firmware.mk | 20 --------------------
 3 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cd5c7ed2a1..719f99c06f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
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

--===============9039115913566911172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9039115913566911172==--
