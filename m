Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE49E7DEF7
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C044081511;
	Mon,  2 Feb 2026 15:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENokC9vCcNds; Mon,  2 Feb 2026 15:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A86DF81604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770046824;
	bh=TQg9Xk1boez7rfq84MElHf9BC5hsQCQJT5nbNz0gNHM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=blE8RNLz1P07klChgGCDTPsLCKFvaCddS2+66erI+v7y0jKWq0vZANH0P++UmM/i/
	 ja62o4Xh0J23wDc8xxIgXYdmtlcTHQyJssR/rpMsIXw4V+8NFi68IeZ27132kX5Y8u
	 JgtxiLi6nfV856gtLyYekNpjdD1nSCnXbKgMG6TyKkPtTXvYn5Q/i38+GDU2m6Fxey
	 TWEB4UbtfKu76hCPO9dyw98Ffy3nB/89qLgnViybIVJubqUsWdenJwpwkggetVV3mD
	 mrgwCIp4rl045RGCG6QzcrQ6s/ZgWYVVnOidZ0aqSOe81gg2gTZtGCx/9rxKQhNYE8
	 RN6GHWaOgg0ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A86DF81604;
	Mon,  2 Feb 2026 15:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 489B671E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D15408A5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9KhAnm1rpLF for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D4140660
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37D4140660
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E2F6847C4; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 16:21:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d214905353be2227290243e85554f817e1d0253c
X-Git-Newrev: 8538604cc806ce5486cef13f8d2f372c8f112e38
X-Patchwork-Hint: ignore
Message-Id: <20260202154017.1E2F6847C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/palo: new boot package
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
Content-Type: multipart/mixed; boundary="===============6504075646501269165=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6504075646501269165==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8538604cc806ce5486cef13f8d2f372c8f112e38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Palo is a PA-RISC/Linux boot loader.
It can be used to make bootable disk images or network bootable images.

While at it, add this boot package to myself in DEVELOPERS.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS          |  1 +
 boot/Config.in      |  1 +
 boot/palo/Config.in | 13 +++++++++++++
 boot/palo/palo.hash |  3 +++
 boot/palo/palo.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7cc4fcbace..703f5c345c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3373,6 +3373,7 @@ F:	arch/arch.mk.hppa
 F:	board/arm/foundation-v8/
 F:	board/bananapi/bananapi-m2-zero/
 F:	board/qemu/hppa-b160l/
+F:	boot/palo/
 F:	configs/arm_foundationv8_defconfig
 F:	configs/bananapi_m2_zero_defconfig
 F:	configs/qemu_hppa_b160l_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 6816531be9..d73d221431 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
+source "boot/palo/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
diff --git a/boot/palo/Config.in b/boot/palo/Config.in
new file mode 100644
index 0000000000..34e2d5bf00
--- /dev/null
+++ b/boot/palo/Config.in
@@ -0,0 +1,13 @@
+config BR2_TARGET_PALO
+	bool "palo"
+	depends on BR2_hppa
+	help
+	  Palo is a PA-RISC/Linux boot loader.
+
+	  It comprises iplboot, a bootloader loaded by the HP firmware,
+	  and palo, a boot media management tool.
+
+	  Palo allows to update disk images with a bootloader to make
+	  them bootable, or to create network bootable images.
+
+	  https://parisc.docs.kernel.org
diff --git a/boot/palo/palo.hash b/boot/palo/palo.hash
new file mode 100644
index 0000000000..2a7e2ef89a
--- /dev/null
+++ b/boot/palo/palo.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  73db9f60d439c4ae9d31b049671283e01d95ae364fc78b4db37eed5523218d6c  palo-2.28.tar.gz
+sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/boot/palo/palo.mk b/boot/palo/palo.mk
new file mode 100644
index 0000000000..dadb0cde92
--- /dev/null
+++ b/boot/palo/palo.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# palo
+#
+################################################################################
+
+PALO_VERSION = 2.28
+PALO_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git/snapshot
+PALO_LICENSE = GPL-2.0
+PALO_LICENSE_FILES = COPYING
+PALO_INSTALL_IMAGES  = YES
+
+define PALO_BUILD_CMDS
+	# Dummy README to remove the dependency on lynx.
+	touch $(@D)/README
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CROSS_COMPILE=$(TARGET_CROSS) all makeipl
+endef
+
+define PALO_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/iplboot $(BINARIES_DIR)/iplboot
+	$(INSTALL) -D -m 0755 $(@D)/palo/palo $(HOST_DIR)/bin/palo
+endef
+
+$(eval $(generic-package))

--===============6504075646501269165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6504075646501269165==--
