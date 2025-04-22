Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F576C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9EA140BD5;
	Tue, 22 Apr 2025 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJKxALZQdXwL; Tue, 22 Apr 2025 21:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA65040A04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA65040A04;
	Tue, 22 Apr 2025 21:52:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D108D1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCC7D406D9
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LR_WfW-JYtJ for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C4D40654
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C4D40654
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:52:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 021B280E3F; Tue, 22 Apr 2025 21:52:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:52:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4440f8a24521c91a80cbff6166d9afe98d8190e2
X-Git-Newrev: d2f5f519ece82257e760e1470f3b0674cedd77a8
X-Patchwork-Hint: ignore
Message-Id: <20250422215228.021B280E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-firmware-inphi: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2f5f519ece82257e760e1470f3b0674cedd77a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NXP BSPs have custom support for a 25G Ethernet retimer
(drivers/net/phy/in112525.c in U-Boot) for the LX2160A-RDB board.
That driver requires a text file to be located at a given offset in the
same storage device as U-Boot itself. The text file contains a list of
register addresses and values which are programmed into the retimer.

All in all, a pretty convoluted mechanism, but the driver is
non-upstreamable, and to support the board we need this "firmware" file
deployed.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/qoriq-firmware-inphi/Config.in                 |  7 +++++++
 package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash |  3 +++
 package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk   | 18 ++++++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2862dd7b49..6c71aacc5e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3388,6 +3388,7 @@ F:	configs/ts5500_defconfig
 
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
+F:	package/qoriq-firmware-inphi/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
 
diff --git a/package/Config.in b/package/Config.in
index 27ee4b4c32..1bdbbd28fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -450,6 +450,7 @@ menu "Firmware"
 	source "package/panel-mipi-dbi-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-ddr-phy-binary/Config.in"
+	source "package/qoriq-firmware-inphi/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
 	source "package/qoriq-mc-utils/Config.in"
diff --git a/package/qoriq-firmware-inphi/Config.in b/package/qoriq-firmware-inphi/Config.in
new file mode 100644
index 0000000000..88ae96c075
--- /dev/null
+++ b/package/qoriq-firmware-inphi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QORIQ_FIRMWARE_INPHI
+	bool "qoriq-firmware-inphi"
+	help
+	  Firmware image for the Inphi IN112525 2x 25GbE SFP+
+	  retimer, exclusively for use on the NXP LX2160A-RDB.
+
+	  https://github.com/nxp-qoriq/qoriq-firmware-inphi
diff --git a/package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash
new file mode 100644
index 0000000000..df860e47a0
--- /dev/null
+++ b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  bc04d6b7ca578ad4bba053a8ec3929af305f296f23c32557dc290540cb49ac18  qoriq-firmware-inphi-f22e9ff3bfed8342da6efb699e473b11fbad5695.tar.gz
+sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk
new file mode 100644
index 0000000000..630c6634fd
--- /dev/null
+++ b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qoriq-firmware-inphi
+#
+################################################################################
+
+# Unlikely to ever be updated, keep a fixed version instead of following BSP tags
+QORIQ_FIRMWARE_INPHI_VERSION = f22e9ff3bfed8342da6efb699e473b11fbad5695
+QORIQ_FIRMWARE_INPHI_SITE = $(call github,nxp,qoriq-firmware-inphi,$(QORIQ_FIRMWARE_INPHI_VERSION))
+QORIQ_FIRMWARE_INPHI_LICENSE = NXP Binary EULA
+QORIQ_FIRMWARE_INPHI_LICENSE_FILES = EULA.txt
+QORIQ_FIRMWARE_INPHI_INSTALL_IMAGES = YES
+
+define QORIQ_FIRMWARE_INPHI_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/in112525-phy-ucode.txt $(BINARIES_DIR)/in112525-phy-ucode.txt
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
